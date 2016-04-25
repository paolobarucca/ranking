%state to state ranking dependence analysis

load('fUsaMat_freq.mat')

kmax = 1;
ranking_dependence_tensor = zeros([51 51 kmax]);
overlap_set_tensor = zeros([51 51 kmax]);

for s1 = 1:51
    Xlong = fUsaMat_freq(:,:,s1);
    X = (Xlong(:,sum(Xlong,1)>0))';
    for s2 = s1+1:51 
        Ylong = fUsaMat_freq(:,:,s2);
        Y = (Ylong(:,sum(Ylong,1)>0))';
        for k =1:kmax
            [r ov] = ranking_dependence(X,Y,k);
            ranking_dependence_tensor(s1,s2,k) = r;
            overlap_set_tensor(s1,s2,k) = ov;  
            
            ranking_dependence_tensor(s2,s1,k) = 1-r;
            overlap_set_tensor(s2,s1,k) = ov;   
        end
    end
end