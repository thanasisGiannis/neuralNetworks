clear 
clc


% perceptron algorithm for classification
% needs data to be linearly seperated

% create double moon data
D = double_moon_points(100000,100,10,10,20);
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
wmap = train_MAP(TrainD, 1);
wml  = train_ML(TrainD);
% classify test dataset

C = sign(wmap*[TestD(:,1:end-1)]')';

sprintf("MAP wrong classificated data: %.3f%% [%d out of %d]", nnz(TestD(:,end)-C)/size(TestD,1),nnz(TestD(:,end)-C),size(TestD,1))

C = sign(wml*[TestD(:,1:end-1)]')';

sprintf("ML wrong classificated data: %.3f%% [%d out of %d]", nnz(TestD(:,end)-C)/size(TestD,1),nnz(TestD(:,end)-C),size(TestD,1))

