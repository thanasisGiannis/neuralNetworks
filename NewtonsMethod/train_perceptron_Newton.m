function [w] = train_perceptron_Newton(D)
% we use column major representation for each 
% data so we use the transpose of D
D = D';
num_of_data = size(D,2);

w = rand(size(D,1)-1,1);
w = w./norm(w);
for i=1:num_of_data
    x = D(1:end-1,i);
    d = D(end,i);
    
    y = sign(x'*w);
    if(sign(d) == sign(y)) 
        continue;
    end
    w = w - pinv(H(x))*g(x,w); %pseudoinverse because H can me singular
    w = w./norm(w);

end

end

function [H_x] = H(x)
H_x = -2*(x*x');

end

function [g_x] = g(x,w)

g_x = -2*(x'*w)*x;

end