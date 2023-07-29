%% Newton-Raphson Method to compute gamma2.

function [gamma2] = L2_Newton_Raphson(Gamma2_0, mu, tol)

gamma2 = Gamma2_0;

f = 1 - mu + gamma2 - (1 - mu)/((1 + gamma2)^2) - mu/(gamma2^2);
df = 1 - (2*(mu - 1))/((gamma2 + 1)^3) + (2*mu)/(gamma2^3);

iter = 0;
diff = 1;

while iter < 100 && abs(diff) > tol
    
    prevGamma2 = gamma2;
    gamma2 = gamma2 - (f/df);
    f = 1 - mu + gamma2 - (1 - mu)/((1 + gamma2)^2) - mu/(gamma2^2);
    df = 1 - (2*(mu - 1))/((gamma2 + 1)^3) + (2*mu)/(gamma2^3);
    diff = prevGamma2 - gamma2;
    iter = iter + 1;
    
end

end