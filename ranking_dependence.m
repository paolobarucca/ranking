function [r overlap_size] = ranking_dependence(X,Y,k)
% Take 2 N time series of length T, X and Y which are NxT matrices
% Compute first_passage_top_k for X and Y 
% r tau_X

tau_X = first_passage_top_k(X,k);

tau_Y = first_passage_top_k(Y,k);

x_set = find(tau_X>0);
y_set = find(tau_Y>0);
xy_set = intersect(x_set,y_set);
overlap_size = length(xy_set) ;

if overlap_size > 0
    r = sum(2*(tau_Y(xy_set) > tau_X(xy_set)) -1)/overlap_size;
else
    r = 0;
end
