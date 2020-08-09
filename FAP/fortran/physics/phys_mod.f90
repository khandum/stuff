!moment_inertia
!tan_vel
!tan_accel
!p_diff
!angular_vel
!angular_accel
!k
!rad_force
!degree_to_rad
!ramp
!tension
!linear_density
!wave

module phys_mod
implicit none
contains

pure real function moment_inertia(c, m, r) &
result(a)
implicit none
real, intent(in) :: c, m, r 
	a = c*m*(r**2)
end function

pure real function tan_vel(r, t) &
result(a)
implicit none
real, intent(in) :: r, t
real, parameter :: pi = 3.14159265359
	a = (2*pi*r)/t
end function

pure real function tan_accel(v, r) &
result(a)
implicit none
real, intent(in):: v, r
	a = (v**2)/r 
end function

pure real function p_diff(a, b) &
result(c)
implicit none
real, intent(in)::a, b
	c = abs((a - b)/((a + b)/2)) * 100.0
end function 

pure real function angular_vel(r, t) &
result(a)
implicit none
real, intent(in) :: t, r
	a = tan_vel(r, t)/r
end function

pure real function angular_accel(a, r) &
result(b)
implicit none
real, intent(in) :: a, r
	b = a/r 
end function 

pure real function k(m, v) &
result(a)
implicit none
real, intent(in) :: m, v
a = .5*m*(v**2)
end function

pure real function rad_force(m, v, r) &
result(a)
real, intent(in) :: m, v, r 
	a = (m*(v**2))/r 
end function

pure real function degree_to_rad(d)
	implicit none
	real, intent(in) :: d
	real, parameter :: pi = 3.14159265359
	degree_to_rad = d*(pi/180)
end function

pure real function ramp(l1, l2, m, g, uk, theta)
	implicit none
	real, intent(in) :: l1, l2, m, g, uk, theta
	real :: a, b, c
	
	ramp = -((l2*m*g*(sin(degree_to_rad(theta)) + &
		uk*cos(degree_to_rad(theta)))) + (l1*uk*m*g))/(-(l1+l2))
end function

pure real function tension(m, a) 
	implicit none
	real, intent(in) :: m, a
	tension = m*a
end function

pure real function linear_density(m, l)
	implicit none
	real, intent(in) :: m, l
	linear_density = m/l
end function

pure real function wave_velocity(t, l)
	implicit none
	real, intent(in) :: t, l
	wave_velocity = sqrt(t/l)
end function

pure real function fund_freq(v, l)
	implicit none 
	real, intent(in) :: v, l
	fund_freq = (v/(2*l))
end function
	
pure real function freq(v, m, l)
	implicit none
	real, intent(in) :: v, m, l 
	freq = (v*m)/(2*l)
end function

pure real function coulomb(q1, q2, r, k)
	implicit none
	real, intent(in) :: q1, q2, r, k
	coulomb = (k * abs(q1) * abs(q2))/(r**2)
end function	

pure real function dielectric(a, c, d, e0)
	implicit none
	real, intent(in) :: a, c, d, e0
	dielectric = (c*d)/(e0*a)
end function
end module
