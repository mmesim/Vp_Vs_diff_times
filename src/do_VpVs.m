function [all,VpVs,p]=do_VpVs(newcat,cc)
%Function to calucate Vp/Vs

%Find all possible event pairs based on event IDs
pairs=my_pairs(newcat(:,9));  %returns all the possible event pairs
npairs=[newcat(pairs(:,1),9) newcat((pairs(:,2)),9)]; %pair with IDs

%Now find in the cc array the common event pairs
for j=1:length(npairs(:,1))
    ind=find(cc(:,1)==npairs(j,1) & cc(:,2)==npairs(j,2) ); %find common pairs
    
    if ~isempty(ind)
    [dtp{j,1},dts{j,1}]=do_dtP_dtS(cc,ind);
    end
end


[all,VpVs,p]=do_regression(dtp,dts);

end