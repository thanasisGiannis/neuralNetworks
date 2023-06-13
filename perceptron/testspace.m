clear 
clc


% perceptron algorithm for classification
% needs data to be linearly seperated

% create double moon data
D = double_moon_points(1000,10,3,5);
n = size(D,1);



% split data into train-test datasets
% by 80-20 rule
perm = randperm(n);
ntrain = ceil(0.8*n);
ntest  = n - ntrain;
D(perm,:) = D;
D(:,end) = D(:,end)-0.5;
D(:,end) = sign(D(:,end));

TrainD = D(1:ntrain,:);
TestD  = D(ntrain+1:end,:);
% train perseptron with train dataset
w = train_perceptron(TrainD);
% classify test dataset

C = sign(w*[ ones(ntest,1) TestD(:,1:end-1)]')';

sprintf("Found wrong classificated data: %d", nnz(TestD(:,end)-C))


