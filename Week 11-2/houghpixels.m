function [r, c] = houghpixels(f, theta, rho, rbin, cbin)
% HOUGHPIXELS computes image pixels belonging to Hough transform bin. 
%   [R, C] = HOUGHPIXELS(F, THETA, RHO, RBIN, CBIN) computes the row-column
%   indices (R,C) for nonzero pixels in image F that map to a particular
%   Hough transform bin, (RBIN, CBIN). RBIN and CBIN are scalars
%   indicating the row-column bin location in the Hough transform matrix
%   returned by function HOUGH. THETA and RHO are the second and third 
%   output arguments from the HOUGH function. 

[x, y, val] = find(f);
x = x - 1; y = y - 1;

theta_c = theta(cbin)*pi/180;
rho_xy = x*cos(theta_c) + y*sin(theta_c);
nrho = length(rho);
slope = (nrho - 1)/(rho(end) - rho(1));
rho_bin_index = round(slope*(rho_xy - rho(1)) + 1);
idx = find(rho_bin_index == rbin);
r = x(idx) + 1; c = y(idx) + 1;

