VULKAN_SDK_PATH = /home/shoshone/vulkan/1.2.148.1/x86_64
APP = Test
COMP =  nvcc #x86_64-w64-mingw32-g++ #g++ #nvcc
CPP_FILE = main.cpp
CFLAGS = -std=c++17 -I$(VULKAN_SDK_PATH)/include -I/usr/local/include

LDFLAGS = -L$(VULKAN_SDK_PATH)/lib -L/usr/lib `pkg-config --static --libs glfw3` -lvulkan

$(APP): $(CPP_FILE)
	$(COMP) $(CFLAGS) -o $(APP) $(CPP_FILE) $(LDFLAGS)
  
.PHONY: test clean

test: $(APP)
	LD_LIBRARY_PATH=$(VULKAN_SDK_PATH)/lib VK_LAYER_PATH=$(VULKAN_SDK_PATH)/etc/vulkan/explicit_layer.d ./APP
  
clean:
	rm -f $(APP)
  

