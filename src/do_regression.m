function [all, VpVs,p]=do_regression(dtp,dts)
%Function to find the Vp/Vs using orthogonal regression

%all diff times for the cluster
dtPtimes=cell2mat(dtp);
dtStimes=cell2mat(dts);

%Remove outliers
all=[dtPtimes dtStimes];
all=all(abs(all(:,1))<=0.1 & abs(all(:,2))<=0.1,:);


%Do orthogonal regression
p=linortfit(all(:,1),all(:,2));


VpVs=p(1,2);

end