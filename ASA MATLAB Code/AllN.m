data = readtable('Values100000.csv');
T = data(:,1);

iterations = 100000;

values_T = table2array(T);
values  = values_T.';

vec_lower = 1:1:971;
vec_upper = 1:1:971;
t = 1.645;

for n = 30:1000
    
    vec_holder = randperm(100000,n);
    vec_subvalues = zeros(n);
    
    for i = 1:n
        vec_subvalues(i) = values(vec_holder(i));
    end
    
    S = std(vec_subvalues);
    M = mean(vec_subvalues);
    lower = M - (t*S/sqrt(n));
    upper = M + (t*S/sqrt(n));
    
    vec_lower(n-29) = lower(1);
    vec_upper(n-29) = upper(1);
    
end

n = 30:1:1000;
figure(1)
plot(n, vec_lower);
hold on;
plot(n, vec_upper);
title("Change of Lower and Upper Bound of CI with n");
xlabel("n");
legend("Upper Bound", "Lower Bound");
hold off;

log_upper = log(vec_upper);
log_n = log(n);
recip_n = 1./sqrt(n);

MyFit = LinearModel.fit(recip_n, vec_upper);
MyFit

figure(2)
plot(MyFit)
hold on;
plot(recip_n, vec_upper);
hold off

figure(3)
plotResiduals(MyFit, "lagged");

