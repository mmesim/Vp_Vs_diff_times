function [mVpVs,sVpVs]=do_bstrVpVs(all,Nboot)

N=length(all(:,1));
index=(1:N)';nVpVs=NaN*(ones(Nboot,1));
%Do resampling
for i=1:Nboot
    bstr=randsample(index,N,true);
    nall=all(bstr,:);
    %Do regression
    p=linortfit(nall(:,1),nall(:,2));
    nVpVs(i,1)=p(1,2);
end

%Mean VpVs
mVpVs=mean(nVpVs);
%Standar error
sVpVs=std(nVpVs);




end