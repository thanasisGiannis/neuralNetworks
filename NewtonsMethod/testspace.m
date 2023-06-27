clear 
clc


% perceptron algorithm for classification
% needs data to be linearly seperated

% create double moon data
D = double_moon_points(100000,10,10,0,20);
n = size(D,1);



% split data into train-test datasets
% by 80-20 rule
ntrain = ceil(0.8*n);
ntest  = n - ntrain;

for i=1:100
    perm = randperm(n);
    D(perm,:) = D;
end

D(:,end) = D(:,end)-0.5;
D(:,end) = sign(D(:,end));


TrainD = D(1:ntrain,:);
TestD  = D(ntrain+1:end,:);

w = train_perceptron_Newton(TrainD);

C = sign(TestD(:,1:end-1)*w);

sprintf("Found wrong classificated data: %d out of %d ( %.3f %%)", nnz(TestD(:,end)~=C), size(TestD,1),100*(nnz(TestD(:,end)~=C)/size(TestD,1)))
