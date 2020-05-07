clc
clear


Fs = 2000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 10000;             % Length of signal
t = (0:L-1)*T;        % Time vector
[number, text1, rawData] = xlsread('E:\matlab2015a\0408\C1_80%00000.csv');
Data = number(6:end,2);
x = Data;
% plot(Data);
% axis([-inf, inf, -inf, inf]);
% title('Signal Corrupted with Zero-Mean Random Noise')
% xlabel('t (milliseconds)')
% ylabel('X(t)')

Y = fft(Data);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
figure
plot(f,P1) 
axis([0,300, -inf, 1]);
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

[max_value max_position]=max(P1);%先得到最大值的?值和位置制
P1(max_position)=min(P1);
[max_value max_position]=max(P1);%先得到最大值的?值和位置制
P1(max_position)=min(P1);
[max_value max_position]=max(P1);%先得到最大值的?值和位置制

sumA = 0;i = 1;
psd = sum(P1(1:1000,1))/2;


while sumA <= psd
    sumA = sumA + P1(i,1);
    i = i+1;
end

figure
plot(f,P1,f(i),P1(i,1),'ko',[f(i) f(i)],[0,1],'r--') 
text((f(i)),P1(i,1)+ 0.4,sprintf('median frequency[Hz = %0.1f,Amplifier  %0.4f]',(f(i)),P1(i)))
axis([0,300, -inf, 1]);







