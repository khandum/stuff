program physics
use phys_mod
! implicit none
! real :: r, t, m, v, fr
	! r = 1
	! t = 1
	! m = 1
	! v = tan_vel(r, t)
	! print *, 'Tangential Velocity = ', v
	! fr = rad_force(m, v, r)
	! print *, 'Radial Force = ', fr 
	! fr = rad_force(m, (v*2),r)
	! print *, 'Twice vel rad force = ', fr
	! v = tan_vel((r/2), t)
	! print *, 'half radius t-vel = ', v 
	! fr = rad_force(m, v, r)
	! print *, 'half radius Radial Force = ', fr 
	
! real, parameter :: pi = 3.14
! real :: r, a
! integer :: i
! 100 format(f10.5)
! do i=0, 10
	! a = 3*pi*i 
	! print 100, a
 ! end do 
 
 ! real :: m, g, fs, r, theta, us, a
 ! m = 1100
 ! g = 9.8
 ! theta = 13.0
 ! us = 1.0
 ! r = 60.0
 ! fs = (sin(degree_to_rad(theta)) + (us*cos(degree_to_rad(theta))))
 ! a = g*r*fs
 ! a = sqrt(a)
 ! 100 format(f8.4)
 ! print 100, a
 
 ! real, dimension(10):: v, x
 ! real :: m = 0.67271, m2 = 1.172775, a, x2
 ! integer :: i 
 ! v = (/0.9606, .4659, 1.329, 1.252, 0.8086, .8449, 1.266, .7252, 1.456, .5797/)
 ! x = (/.04871, .02007, .0794, .07375, .02967, .06105, .1127, .04871, .1154, .03413/)
 ! 100 format (f10.6, f10.7)
 ! do i = 1, 5
	! a = k(m, v(i))
	! x2 = x(i)**2
	! print 100, a, x2
! end do 

 ! do i = 6, 10
	! a = k(m2, v(i))
	! x2 = x(i)**2
	! print 100, a, x2
! end do	
! print *, " "
 ! v = (/1.032, .5699, .833, 1.305, 1.215, .7562, .6074, 1.383, 1.177, .8448/)
 ! x = (/.07889, .02658, .05488, .1027, .09741, .07889, .05522, .1430, .1365, .08609/)
 ! do i = 1, 5
	! a = k(m, v(i))
	! x2 = x(i)**2
	! print 100, a, x2
! end do 
 ! do i = 6, 10
	! a = k(m2, v(i))
	! x2 = x(i)**2
	! print 100, a,x2
! end do


! real, dimension(6):: m, h 
! real :: v, a 
! integer :: i 
! m = (/.5, 1.0, 2.0, 1.0, 2.0, .5/)
! h = (/1.0, 1.0, 1.0, 2.0, 2.0, 2.0/)
! 100 format (f10.6, f10.7)
! do i = 1, 6
	! v = sqrt(2*9.8*h(i))
	! a = k(m(i), v)

! print 100, a
! end do 


! real, dimension(6) :: m, r, n
! real :: a, b, i, t
! integer :: j 
! m = (/1.4, 0.9, 1.0, 0.9, 1.2, 1.2/)
! r = (/10.0, 7.5, 5.0, 5.0, 9.0, 10.0/)
! n = (/5.0, 7.0, 2.0, 5.0, 2.0, 8.0/)
! do j = 1, 6
	! t = 0.5*n(j)*r(j)
	! i = 0.5*m(j)*(r(j)**2)
	! a = t/i 
	! print *, a
! end do 

! real, dimension(4) :: i, f 
! real :: a
! integer :: j

! i = (/.002388, .003769, .001633, .005897/)
! f = (/.001995, .003356, .001412, .005162/)

! do j = 1, 4
	! a = p_diff(i(j), f(j))
	! print *, a
! end do 
! real, dimension(6) :: f, l, m, r 
! real :: w, i, a
! integer :: j 

! f = (/4.0, 8.0, 6.0, 4.0, 5.0, 2.0/)
! l = (/.4, .8, .2, .4, .4, .8/)
! m = (/.5, .4, .6, .5, .8, .6/)
! r = (/.4, .8, .2, .0, .4, .8/)

! do j = 1, 6
	! i = (m(j) * (l(j)**2))/3
	! w = sqrt((abs(2*(r(j)*f(j)+l(j)*m(j)*(-9.8))))/i)
	! print *, j, ' ',w 
! end do 

! real, dimension(5) :: s 
! real :: a 
! integer :: i 

! s = (/1.10, 1.20, 1.35, 1.40, 1.45/)

! do i = 1, 5
	! a = s(i)**2
	! print *, a 
! end do 

! real, dimension(6) :: t, v 
! real :: p
! integer :: i 

! v = (/3., 6., 3., 6., 9., 6./)
! t = (/2., 2., 4., 4., 4., 6./)
! do i = 1, 6

	! p = t(i)/v(i)
	! print *, p 

!calculate wave velocity

!end do 

! real, dimension(1) :: m
! real :: v, l, fq
! integer :: i , j
! v = 3.00e8
! m = (/1./)
! l=.1

! do i = 1, 7
	
	! fq = (1425.68)/(i-.5)
	! print *, i, fq 
! end do 

! real, dimension(8) :: q1, q2, r
! real :: j, ans
! integer :: i 

! q1 = (/1., 2., 3., 3., 2., 2., 3., 1./)
! q2 = (/-1., -1., -1., -2.,-2.,-2.,-3.,-1./)
! r = (/1., .5, .33333333, 1., 1., .5, .33333333, .5/)
! j = 1.0
! do i = 1, 8
	! ans = coulomb(q1(i), q2(i), r(i), j)
	! print *, i, ans
! end do 


! real, dimension(6) :: a, c 
! real :: e0, d, ans 
! integer :: i 
! a = (/4.0, 8.0, 4.0, 2.0, 2.0, 1.0/)
! c = (/1.0, 2.0, 2.0, 8.0, 4.0, 1.0/)
! d = 1.0
! e0 = 1.0

! do i = 1, 6
	! ans = dielectric(a(i), c(i), d, e0)
	! print *, i, ans
! end do 	.

real, dimension(6) :: a, c 
real:: q 
integer :: i 
a = (/1.0, 2.0, 4.0, 4.0, 2.0, 8.0/)
c = (/1.0, 8.0, 2.0, 1.0, 4.0, 2.0/)
do i = 1, 6
	q = a(i)/c(i) 
	print *, i, q 
end do 
end program






























