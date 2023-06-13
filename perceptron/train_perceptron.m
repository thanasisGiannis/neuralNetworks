function w = train_perceptron(D)
% last column of D contains the class of the row
% binary -1,1

w = [0 zeros(1,size(D,2)-1)];
for j = 1:size(D,1)
    x = [1 D(j,1:end-1)];
    
    y = sign(w*x');
    d = D(j,end);
    
    w = w + (d-y)*x;
end

end