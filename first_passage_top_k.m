
function [tau top_k_counter] = first_passage_top_k(X,k)
% Take N time series of length T, X is a NxT matrix
% For each t in T rank the values X_{it}  and define the set I^{(k)}_t of the k largest
% elements at time t. 
% Consider for each i the set P_{i}^{(k)} of times t such that i belongs to I^{(k)}_t 
% Define \tau_{i}^{(k)} as the minimum of the set P_{i}^{(k)}. 
% (tau=0, corresponds to infinite passage time, i.e. no passage)


T = size(X,2);
N = size(X,1);

top_k_counter = zeros([N 1]);
tau = zeros([N 1]);

for t = 1:T
    [~, tRank] = sort(X(:,t),'descend');
    I_kt = tRank(1:k);
    
    for i = 1:k
        if top_k_counter(I_kt(i))==0
            tau(I_kt(i)) = t;
        end
    end
    top_k_counter(I_kt) = top_k_counter(I_kt) + 1;
end