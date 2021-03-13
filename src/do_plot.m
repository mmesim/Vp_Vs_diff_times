function[]=do_plot(all,id,VpVs,p,sVpVs,mVpVs)

%Do a fancy plot
figure
subplot(1,2,1)
plot(all(:,1),all(:,2),'o')
xlabel('dtP')
ylabel('dtS')
title(sprintf('Cluster: %02d  Vp/Vs= %4.2f' ,id,VpVs));
xlim([-0.15 0.15])
ylim([-0.15 0.15])
set(gca,'FontSize',14);hold on
%Plot line
xnew=-0.1:0.001:0.1; ynew=p(1,1)+(VpVs*xnew);
plot(xnew,ynew,'-r','Linewidth',1.5)
grid on; hold off


%Plot bootstrap lines
subplot(1,2,2)
plot(all(:,1),all(:,2),'o')
xlabel('dtP')
ylabel('dtS')
title(sprintf('Cluster: %02d  Vp/Vs= %4.2f\x00B1%5.3f',id,mVpVs,sVpVs));
xlim([-0.15 0.15])
ylim([-0.15 0.15])
set(gca,'FontSize',14);hold on
%Plot line
xnew2=-0.1:0.001:0.1; ynew2=p(1,1)+(mVpVs*xnew); 
plot(xnew2,ynew2,'-r','Linewidth',1.5)
upper=p(1,1)+((mVpVs+sVpVs)*xnew);
plot(xnew2,upper,':k','Linewidth',1.0)
lower=p(1,1)+((mVpVs-sVpVs)*xnew);
plot(xnew2,lower,':k','Linewidth',1.0)

grid on; hold off

end