% This script calculates the Vp/Vs ratio for each cluster
% using the differential times derived from waveform cross correaltion
% For more details and applications check 
% [Lin and Shearer, 2007 BSSA] - [Bachura and Fisher, 2016 EPSL]
%Input : cross correlation output from waveform_cc.m
%        cell with clusters -- must contain event ID
%Output: Plots for each Cluster
%--------------------------------------------------> M. Mesimeri 06-07/2020 
%-Revised 03/2021
%--------------------------------------------------------------------------
clear;clc;close all
mydir=pwd; pdir=sprintf('%s/src/',pwd); % get working directory path
addpath(genpath(pdir));  %add src to path 
%% load input arrays and cells
%differential times - 
load results_xcorr.mat cc
%clusters
a=load('test.txt');
%Set number of bootstraps
Nboot=500;Nclust=1;
mVpVs=NaN*ones(max(a(:,10)),1);sVpVs=NaN*ones(Nclust,1);VpVs=NaN*ones(Nclust,1);
%% start doing Vp - Vs for each cluster in a loop
for i=1:Nclust
newcat=a(a(:,10)==a(i,10),:); 
%Calculate Vp/Vs
[all,VpVs(i,1),p]=do_VpVs(newcat,cc);
%Do bootstrap
[mVpVs(i,1),sVpVs(i,1)]=do_bstrVpVs(all,Nboot);
%Plot everything
do_plot(all,a(i,10),VpVs(i,1),p,sVpVs(i,1),mVpVs(i,1))

end


save results.mat