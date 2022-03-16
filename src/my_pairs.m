function pairs=my_pairs(y)
%Create correlation pairs

j=1;
for i=1:length(y)
    for jj=i+1:length(y)
        pairs(j,:)=[i jj];
        j=j+1;
    end
end


end