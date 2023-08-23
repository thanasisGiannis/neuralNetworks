function [w] = train_perceptron_lms(D)
% we use column major representation for each 
% data so we use the transpose of D
D = D';
ita = 10;
num_of_data = size(D,2);

w = rand(size(D,1)-1,1);
w = w./norm(w);
for i=1:num_of_data
    x = D(1:end-1,i);
    d = D(end,i);
    
    y = x'*w;
    if(sign(d) == sign(y)) 
        continue;
    end
    w = w + ita*x*(d-y); %pseudoinverse because H can me singular
    w = w./norm(w);
    ita = max(ita/2,0.1);
end

end
