import argparse
import os
import numpy as np
import csv
import cv2

import tensorflow as tf
from tensorflow.keras import layers, models
from tensorflow.keras.layers import Dense, Lambda, Input, GlobalAveragePooling2D
from tensorflow.keras.models import Model

parser = argparse.ArgumentParser(description='Behavioral Cloning')

parser.add_argument('--data', default='data/driving_log.csv',
                    type=str, help='path to dataset (defaule: data/driving_log.csv)')
parser.add_argument('--epochs', default=10, type=int,
                    help='training epochs (default: 10)')
parser.add_argument('--model_summary', default=False, type=bool,
                    help='show model summary (default: False)')


def data_maker(args):
    #Read the driving log.
    lines = []
    with open(args.data, 'r') as f:
        reader = csv.reader(f)
        for line in reader:
            lines.append(line)
    
    #Parse each line in the driving log and append to array.
    images = []
    measurements = []    
    for line in lines:
        for i in range(3):
            img_path = line[i]
            image = cv2.imread(img_path)
            images.append(image)
            measurement = float(line[3])
            measurements.append(measurement)
            
    X = np.array(images)
    y = np.array(measurements)   
    
    return X, y

def model_maker(args):
    #Use available model architechure from Keras.
    #Weights are not pretrained and top is clipped.
    mobilenet = tf.keras.applications.MobileNetV2(input_shape=(160,320,3),
                                        include_top=False,
                                        classes=1)
    #Define the input shape.
    drive_shape = Input(shape=(160,320,3))
    #Normalize and recenter.
    resized_input = Lambda(lambda x:x /255.0 - 0.5)(drive_shape)
    
    inp = mobilenet(resized_input)
    #Add pooling and linear layers. 
    out = GlobalAveragePooling2D()(inp)
    x1 = Dense(512)(out)
    x2 = Dense(512)(x1)
    predictions = Dense(1)(x2)
    
    #Sew all the added components to model.
    model = Model(inputs=drive_shape, outputs=predictions)
    
    #Print model summary. 
    if args.model_summary:
        model.summary()
      
    return model

def train(model, X_train, y_train, args):
    
    #Define model's name to be saved.
    checkpoint_path = "model.h5"
    checkpoint_dir = os.path.dirname(checkpoint_path)
    
    #Define checkpoint parameters.
    cp_callback = tf.keras.callbacks.ModelCheckpoint(filepath=checkpoint_path,
                                                     save_weights_only=False,
                                                     monitor='val_loss',
                                                     mode='min',
                                                     save_best_only=True)
    #Compile the model with optimizer and loss funtion.
    model.compile(optimizer='Adam', loss='mse', metrics=['accuracy'])
    
    #Train the model
    model.fit(X_train, y_train, validation_split=0.20, shuffle=True,
          epochs=args.epochs,  callbacks=[cp_callback])

if __name__=="__main__":
    args = parser.parse_args()
       
    #Initiate the pipeline
    X_train, y_train = data_maker(args)
    model = model_maker(args)
    train(model, X_train, y_train, args)
    

# def Model():
#     model = models.Sequential([

#     layers.Lambda(lambda x:x /255.0 - 0.5, input_shape=(160,320,3)),
#     layers.Cropping2D(cropping=((70, 25),(0, 0))),
#     layers.Conv2D(24, (5, 5), activation='relu', padding='valid'),
#     #layers.MaxPooling2D((2, 2)),
#     #layers.Dropout(0.5),
#     layers.Conv2D(36, (5, 5), activation='relu', padding='valid'),
#     #layers.MaxPooling2D((2, 2)), 
#     #layers.Dropout(0.5),
#     layers.Conv2D(64, (3, 3), activation='relu', padding='valid'),
#     layers.Conv2D(64, (3, 3), activation='relu', padding='valid'),
#     #layers.MaxPooling2D((2, 2)), 
#     layers.Flatten(),
#     layers.Dense(100),
#     layers.Dense(50),
#     layers.Dense(10),
#     layers.Dense(1)])
#     return model