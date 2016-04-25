%state to state ranking dependence analysis
% data_tensor is a three index tensor TxNxM of non-negative numbers 
function [ranking_dependence_tensor overlap_set_tensor] = state2state_ranking_depende(filename, kmax)
load('filename')
nM = size(data_tensor,3);

ranking_dependence_tensor = zeros([nM nM kmax]);
overlap_set_tensor = zeros([nM nM kmax]);

for s1 = 1:nM
    Xlong = data_tensor(:,:,s1);
    X = (Xlong(:,sum(Xlong,1)>0))';
    for s2 = s1+1:nM
        Ylong = data_tensor(:,:,s2);
        Y = (Ylong(:,sum(Ylong,1)>0))';
        for k =1:kmax
            [r ov] = ranking_dependence(X,Y,k);
            ranking_dependence_tensor(s1,s2,k) = r;
            overlap_set_tensor(s1,s2,k) = ov;  
            overlap_set_tensor(s2,s1,k) = ov;  
            if ov > 0
            ranking_dependence_tensor(s2,s1,k) = -r; 
            end
        end
    end
end
