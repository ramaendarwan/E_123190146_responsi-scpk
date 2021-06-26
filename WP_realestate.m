data = readtable('DATA Real Estate.xlsx');
data1 = table2array(data);

k = [0,0,1,0];
w = [3,5,4,1];

[m n]=size (data1);
w=w./sum(w);

for j=2:n,
    if k(j)==0, w(j)=-1*w(j);
    end;
end;
for i=2:m,
    S(i)=prod(data1(i,:).^w);
end;

V= S/sum(S)