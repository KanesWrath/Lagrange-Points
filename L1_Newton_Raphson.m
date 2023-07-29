%% Newton-Raphson Method to compute gamma1.

function [gamma1] = L1_Newton_Raphson(Gamma1_0, mu, tol)

gamma1 = Gamma1_0;

f = 1 - mu - gamma1 - (1 - mu)/((1 - gamma1)^2) + mu/(gamma1^2);
df = -1 - (2*(1 - mu))/((1 - gamma1)^3) - (2*mu)/(gamma1^3);

iter = 0;
diff = 1;

while iter < 100 && abs(diff) > tol

    prevGamma1 = gamma1;
    gamma1 = gamma1 - (f/df);
    f = 1 - mu - gamma1 - (1 - mu)/((1 - gamma1)^2) + mu/(gamma1^2);
    df = -1 - (2*(1 - mu))/((1 - gamma1)^3) - (2*mu)/(gamma1^3);
    diff = prevGamma1 - gamma1;
    iter = iter + 1;

end

end