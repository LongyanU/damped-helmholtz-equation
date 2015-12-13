%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DAMPED HELMHOLTZ EQUATION
clc
clear
close all

h = 0.01;
grid = -1:h:1;
N = length(grid);
x0index = ceil(N/2);

c = 1498; % speed of sound in water
w = 59e3; % minnaert frequency: f = w_m/2*pi
k = w/c;
lambda = 2*pi/k;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FREE SPACE GREENS FUNCTION
G0 = zeros(N,N);
for i=1:N
    for j=1:N
        x = [ grid(i) ; grid(j) ; 0.00001];
        G0(i,j) =  (exp(1i*k*norm(x)))/(4*pi*norm(x));
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PLOTTING
% fig = figure(1);
% set(fig, 'Position', [600 100 800 600])
% surf(grid, grid, imag(G0));
% rotate3d on;

fig = figure(2);
set(fig, 'Position', [600 100 800 600])
hold on
plot(grid, imag(G0(x0index:x0index,:)));
line([lambda/4,lambda/4],[-1,3.5], 'color', [.7,.7,.7]);
line([-lambda/4,-lambda/4],[-1,3.5], 'color', [.7,.7,.7]);
rotate3d on;
