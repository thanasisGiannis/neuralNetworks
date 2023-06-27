function [w] = train_MAP(X,lambda)

d = X(:,end);
X = X(:,1:end-1);

size(d)
size(X)
rdx = -X'*d;
R = -X'*X;
w = ((-X+lambda*eye(size(X)))\(-d))';
w = w./norm(w);
end