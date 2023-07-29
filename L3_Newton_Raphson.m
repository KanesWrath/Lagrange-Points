%% Newton-Raphson method to compute gamma3.

function [gamma3] = L3_Newton_Raphson(Gamma3_0, mu, tol)

gamma3 = Gamma3_0;

f = -mu - gamma3 + (1 - mu)/((-gamma3)^2) + mu/((-1 - gamma3)^2);
df = -(2*mu)/((gamma3 + 1)^3) + (2*(mu - 1))/((gamma3)^3) - 1;

iter = 0;
diff = 1;

while iter < 100 && abs(diff) > tol
    
    prevGamma3 = gamma3;
    gamma3 = gamma3 - (f/df);
    f = -mu - gamma3 + (1 - mu)/((-gamma3)^2) + mu/((-1 - gamma3)^2);
    df = -(2*mu)/((gamma3 + 1)^3) + (2*(mu - 1))/((gamma3)^3) - 1;
    diff = prevGamma3 - gamma3;
    iter = iter + 1;

end

end