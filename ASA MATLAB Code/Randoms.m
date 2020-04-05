data = readtable('values.csv');
T = data(:,1);

iterations = 10000000;

values_T = table2array(T);
values  = values_T.';

minimum = values(1)
maximum = values(iterations)
prob_size = maximum - minimum + 1;

t = 1:1:iterations;
t1 = minimum:1:maximum;

figure(1)
plot(values, t);
title(sprintf('Distribution of SPUZ for n = %d', iterations));
xlabel("SPUZ")
ylabel("Occurances")


c = unique(values);
n  = histc(values,c);

prob_vector = zeros(prob_size);
prob_vector(c + 1 - minimum) = n;
prob_vector = prob_vector / iterations;
probability = prob_vector(:,1);

figure(2)
plot(t1, probability);
title(sprintf('SPUZ Probability Distribution for n = %d', iterations));
xlabel("SPUZ")
ylabel("Probability");

max(probability);
largest = probability(1);
for i = 1:length(probability)
    if(probability(i) > largest) 
        largest  = probability(i);
        most_likely = minimum + i - 1;
    end   
    
    t = 1.6449;
    S = std(values)
    M = mean(values)
    lower = M - (t*S/sqrt(iterations))
    upper = M + (t*S/sqrt(iterations))
end
most_likely


