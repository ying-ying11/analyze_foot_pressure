clc;
clear;
close all;

file_path_before='C:\Users\a0916\OneDrive\desktop\Coretac\1121_after_fatigue_swap_3.xlsx';
%file_path_after='C:\Users\user\Desktop\10925218_after_1115.xlsx';

t_before=xlsread(file_path_before,'工作表1','a4:a3002');
a=xlsread(file_path_before,'工作表1','b4:b3002');
a1=xlsread(file_path_before,'工作表1','c4:c3002');
a2=xlsread(file_path_before,'工作表1','d4:d3002');
a3=xlsread(file_path_before,'工作表1','e4:e3002');
a4=xlsread(file_path_before,'工作表1','f4:f3002');
a5=xlsread(file_path_before,'工作表1','g4:g3002');

%t_after=xlsread('C:\Users\user\Desktop\foot analysis\Coretec\drive-download-20221116T062720Z-001\10925218_after_1115.xlsx','工作表1','a4:a2685');
%b=xlsread('C:\Users\user\Desktop\foot analysis\Coretec\drive-download-20221116T062720Z-001\10925218_after_1115.xlsx','工作表1','b4:b2685');
pa_before=(a*0.001*9.80556)/(0.0153*0.05);
pa1_before=(a1*0.001*9.80556)/(0.0153*0.15);
pa2_before=(a2*0.001*9.80556)/(0.0153*0.1);
pa3_before=(a3*0.001*9.80556)/(0.0153*0.1);
pa4_before=(a4*0.001*9.80556)/(0.0153*0.3);
pa5_before=(a5*0.001*9.80556)/(0.0153*0.3);
%pa_after=(b*0.001*9.80556)/(0.0153*0.05);
[maxv_before,max_before]=findpeaks(pa_before,'minpeakheight',950,'minpeakdistance',100);
[maxv1_before,max1_before]=findpeaks(pa1_before,'minpeakheight',900,'minpeakdistance',100);
[maxv2_before,max2_before]=findpeaks(pa2_before,'minpeakheight',50,'minpeakdistance',100);
[maxv3_before,max3_before]=findpeaks(pa3_before,'minpeakheight',250,'minpeakdistance',100);
[maxv4_before,max4_before]=findpeaks(pa4_before,'minpeakheight',50,'minpeakdistance',100);
[maxv5_before,max5_before]=findpeaks(pa5_before,'minpeakheight',50,'minpeakdistance',100);
%[maxv_after,max_after]=findpeaks(pa_after,'minpeakheight',950);
subplot(321);
plot(t_before,pa_before);hold on;
plot((max_before/100),maxv_before,'ro');
title('HA');
subplot(322);
plot(t_before,pa1_before);hold on;
plot((max1_before/100),maxv1_before,'ro');
title('LT');
subplot(323);
plot(t_before,pa2_before);hold on;
plot((max2_before/100),maxv2_before,'ro');
title('M1');
subplot(324);
plot(t_before,pa3_before);hold on;
plot((max3_before/100),maxv3_before,'ro');
title('M5');
subplot(325);
plot(t_before,pa4_before);hold on;
plot((max4_before/100),maxv4_before,'ro');
title('Arch');
subplot(326);
plot(t_before,pa5_before);hold on;
plot((max5_before/100),maxv5_before,'ro');
title('HM');
%subplot(312);
%plot(t_after,pa_after);hold on;
%plot((max_after/100),maxv_after,'ro');
%xlswrite('C:\Users\user\Desktop\test.xlsx',maxv,'a2:'+'a'+length(maxv));
time_a=zeros(length(max_before/100)-1,1);
%time_b=zeros(length(max_after/100)-1,1);
pa_avg=mean(maxv_before);
pa1_avg=mean(maxv1_before);
pa2_avg=mean(maxv2_before);
pa3_avg=mean(maxv3_before);
pa4_avg=mean(maxv4_before);
pa5_avg=mean(maxv5_before);

%pb_avg=mean(maxv_after);
result_before_peak=zeros(1,6);
%disp(pa_avg);
%disp(pb_avg);
result_before_peak(1)=pa_avg;
result_before_peak(2)=pa1_avg;
result_before_peak(3)=pa2_avg;
result_before_peak(4)=pa3_avg;
result_before_peak(5)=pa4_avg;
result_before_peak(6)=pa5_avg;
disp('peak value:')
disp(result_before_peak);
for i=1:length(max_before/100)-1
    time_a(i)=(max_before(i+1)/100)-(max_before(i)/100);
end
%for i=1:length(max_after/100)-1
%    time_b(i)=(max_after(i+1)/100)-(max_after(i)/100);
%end
velocity_a=10/(max_before(length(max_before))/100-max_before(1)/100);
%velocity_b=10/(max_after(length(max_after))/100-max_after(1)/100);
disp('peak interval time:');
disp(mean(time_a));
%disp(mean(time_b));
disp('Velocity (m/s)');
disp(velocity_a);
%disp(velocity_b);