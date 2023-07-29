%% Clear MATLAB Workspace.

clear
clc
close all
format compact
format long

%% Compute the 5 Lagrange Points for any CR3BP system.

% Constants and parameters

mu_Earth_Moon = 0.0121505856;
mu = mu_Earth_Moon;             % Mass parameter.
% mu_Sun_Earth = 9.537e-4;
% mu_Sun_Earth = 3.03591e-6;
gam1_g = 0.15;                  % Gamma guesses.
gam2_g = 0.16;
gam3_g = 0.95;

% Set the tolerance for convergence.

tol = 1e-10;

% Compute the Lagrange Points.

L_Earth_Moon = Lagrange_Points(gam1_g, gam2_g, gam3_g, mu, tol);
L = L_Earth_Moon;
% L_Sun_Earth = Lagrange_Points(gam1_g, gam2_g, gam3_g, mu, tol);
% L = L_Sun_Earth

%% Plot the 5 Lagrange Points for any CR3BP system.

scatter3(1 - mu, 0, 0, 'k*', 'LineWidth', 2, 'DisplayName', 'm2, Moon'),
hold on, text(1 - mu, - 0.06, 'm_2, Moon'),
scatter3(-mu, 0, 0, 'k*', 'LineWidth', 8, 'DisplayName', 'm1, Earth'),
text(- mu - 0.15, 0.06, 'm_1, Earth'),
scatter3(0, 0, 0, 'k*', 'LineWidth', 1, 'DisplayName', 'Barycenter'),
text(0.05, 0.05, 'Barycenter'),
scatter3(L(1, 1), 0, 0, 'b*', 'LineWidth', 1, 'DisplayName', 'L1'),
text(L(1, 1), L(1, 2) + 0.05, 'L_1', 'Color', 'b'),
scatter3(L(2, 1), 0, 0, 'b*', 'LineWidth', 1, 'DisplayName', 'L2'),
text(L(2, 1), L(2, 2) + 0.05, 'L_2', 'Color', 'b'),
scatter3(L(3, 1), 0, 0, 'b*', 'LineWidth', 1, 'DisplayName', 'L3'),
text(L(3, 1) - 0.05, L(3, 2) + 0.05, 'L_3', 'Color', 'b'),
scatter3(L(4, 1), L(4, 2), 0, 'b*', 'LineWidth', 1, 'DisplayName', 'L4'),
text(L(4, 1) - 0.05, L(4, 2) + 0.05, 'L_4', 'Color', 'b'),
scatter3(L(5, 1), L(5, 2), 0, 'b*', 'LineWidth', 1, 'DisplayName', 'L5'),
text(L(5, 1) - 0.05, L(5, 2) - 0.05, 'L_5', 'Color', 'b'),
xmin = -1.5; xmax = 1.5; ymin = -1.5; ymax = 1.5;
axis([ xmin xmax ymin ymax ]),
plot([1.0 - mu L(4, 1) 0], [0 L(4, 2) 0], '--k', 'Linewidth', 2.0),
plot([1.0 - mu L(5, 1) 0], [0 L(5, 2) 0], '--k', 'Linewidth', 2.0),
plot([L(3, 1) L(2, 1) 0], [0 0 0], '--k', 'Linewidth', 2.0),
plot([xmin xmax 0], [0 0 0], '-k', 'Linewidth', 0.25),
plot([0 0 0], [ymin ymax 0], '-k', 'Linewidth', 0.25),
xlabel('x, NDU'), ylabel('y, NDU'), zlabel('z, NDU'),
title('CR3BP Geometry of Lagrange Points in Earth-Moon System')
