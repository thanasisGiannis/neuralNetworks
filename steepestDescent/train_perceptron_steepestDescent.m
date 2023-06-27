function [w] = train_perceptron_steepestDescent(D)
% we use column major representation for each 
% data so we use the transpose of D
D = D';
ita = 1;
num_of_data = size(D,2);

w = zeros(size(D,1)-1,1);
for i=1:num_of_data
    x = D(1:end-1,i);
    d = D(end,i);
    
    y = sign(x'*w);
    if(sign(d) == sign(y)) 
        continue;
    end
    w = w - ita*g(x);
    w = w./norm(w);

end

end

function [g_x] = g(x)

g_x = -x;

end