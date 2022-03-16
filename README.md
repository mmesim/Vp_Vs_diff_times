# Vp/Vs
Calculate Vp/Vs ratio using differential times from waveform cross-correlation. 



#### Input

* .mat file that contains CC times for pairs of events 

  Format: 

```
EVENT ID | EVENT ID | CC (correlation coefficient) | DT (delay time) |
STATION NUMBER (instead of using characters) | Phase ID [1: P, 2: S]
```

* Catalog file with clusters
* Format: 

``` 
 YEAR ORIGINTIME | LATITUDE | LONGITUDE| DEPTH | MAGNITUDE| DECIMAL YEAR |
 TIME RALTIVE TO THE FIRST EVENT IN THE CATALOG| EVENT ID| CLUSTER ID
```



Note:

The input file can be obtain after using [xcorr](https://github.com/mmesim/relative_loc/tree/main/xcorr). 

```matlab
cc=cell2mat(cut_event_pairs);
save results_xcorr.mat
```



This code is based on 

Lin, G., & Shearer, P. (2007). Estimating local Vp/Vs ratios within similar earthquake clusters. *Bulletin of the Seismological Society of America*, *97*(2), 379–388. https://doi.org/10.1785/0120060115

Bachura, M., & Fischer, T. (2016). Detailed velocity ratio mapping during the aftershock sequence as a tool to monitor the fluid activity within the fault plane. *Earth and Planetary Science Letters*, *453*(1975), 215–222. https://doi.org/10.1016/j.epsl.2016.08.017



and was used in 

Maria Mesimeri, Athanassios Ganas, Kristine L Pankow, Multisegment ruptures and Vp/Vs variations during the 2020-2021 seismic crisis in western Corinth Gulf, Greece, *Geophysical Journal International*, 2022;, ggac081, https://doi.org/10.1093/gji/ggac081



Written in Matlab

Author: Maria Mesimeri
