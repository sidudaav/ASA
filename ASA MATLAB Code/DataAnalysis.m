data = readtable('Values10000000.csv');
T = data(:,1);

iterations = 10000000;

values_T = table2array(T);
values  = values_T.';

minimum = values(1)
maximum = values(iterations)
prob_size = maximum - minimum + 1;

t = 1:1:iterations;
t1 = minimum:1:maximum;

c = unique(values);
n  = histc(values,c);

prob_vector = zeros(prob_size);
prob_vector(c + 1 - minimum) = n;
prob_vector = prob_vector / iterations;
probability = prob_vector(:,1);

max(probability);
largest = probability(1);
for i = 1:length(probability)
    if(probability(i) > largest) 
        largest  = probability(i);
        most_likely = minimum + i - 1;
    end   
end
most_likely

t = 1.6449;
S = std(values)
M = mean(values)
lower = M - (t*S/sqrt(iterations))
upper = M + (t*S/sqrt(iterations))