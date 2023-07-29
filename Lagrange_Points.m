%% Function to find Lagrange Points in a given system.

function [L, gamma1, gamma2, gamma3] = Lagrange_Points(Gamma1_0, ...
    Gamma2_0, Gamma3_0, mu, tol)

    L = zeros(5,2);
    gamma1 = L1_Newton_Raphson(Gamma1_0, mu, tol);
    gamma2 = L2_Newton_Raphson(Gamma2_0, mu, tol);
    gamma3 = L3_Newton_Raphson(Gamma3_0, mu, tol);
    L(1,1) = 1 - mu - gamma1;
    L(2,1) = 1 - mu + gamma2;
    L(3,1) = -mu - gamma3;
    L(4,1) = 1/2 - mu;
    L(4,2) = sqrt(3) / 2;
    L(5,1) = L(4,1);
    L(5,2) = -L(4,2);

end

