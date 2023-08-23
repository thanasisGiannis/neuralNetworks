function [w] = train_perceptron_GaussNewton(D)
% we use column major representation for each 
% data so we use the transpose of D
D = D';
num_of_data = size(D,2);

w = rand(size(D,1)-1,1);
w = w./norm(w);
J = [];
e_n = [];
for i=1:num_of_data
    x = D(1:end-1,i);
    d = D(end,i);
    
    y = x'*w;
    if(sign(d) == sign(y)) 
        continue;
    end
    J = Jac(J,x);
    e_n = [e_n; (d-y)];
    w = w - pinv(J'*J)*J'*e_n; %pseudoinverse because H can me singular
    w = w./norm(w);

end

end

function [J_x] = Jac(J_x,x)
J_x = [J_x' -x]';
end
