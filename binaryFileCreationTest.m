for i =1:1000
    x(i)=1;
end
for i =1001:2000
    x(i)=0;
end
tmp = zeros(2*length(x),1);
    tmp(1:2:end) = real(x);
    tmp(2:2:end) = imag(x);

    f1 = fopen('tx.dat', 'w');
    fwrite(f1, tmp, 'float32');
    fclose(f1); 