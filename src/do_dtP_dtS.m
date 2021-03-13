function [dtp,dts]=do_dtP_dtS(cc,ind)

%grab CC times for the cluster
cluster=cc(ind,:);
%Group P and S diff. times
Pcluster=cluster(cluster(:,6)==1,:); %here group the P phases
Scluster=cluster(cluster(:,6)==2,:); %here group the S phases
%For the S remove phases from both horizontals
[~,ia,~]=unique(Scluster(:,5),'stable');
Scluster=Scluster(ia,:);

%Now find the event pairs that have both P and S diff times
[~,ia,ib]=intersect(Pcluster(:,5),Scluster(:,5));
Pfcluster=Pcluster(ia,:);
Sfcluster=Scluster(ib,:);

if length(Pfcluster(:,1))>=3
%Do mean for all stations [P and S]
Pavg=mean(Pfcluster(:,4));
Savg=mean(Sfcluster(:,4));
dtp=Pfcluster(:,4)-Pavg;
dts=Sfcluster(:,4)-Savg;

else
dtp=[];
dts=[];
    
end


end