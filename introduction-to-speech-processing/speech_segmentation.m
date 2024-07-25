% % % % % % % % % % % % % % % % %  1.1 Writing the phrase in ARPABET % % % % % % % % % % % % % % % % %
% 
% Oak is strong and also gives shade
%
% OW K IH S S T R EN H AX D AO S OW G IH V S SH EY D
%%

% % % % % % % % % % % % % % % % %  1.2 Labeling Using Waveform % % % % % % % % % % % % % % % % %

% TODO
load ../mcclellan\mcclellan\Data\s5.mat
Fs = 8000;

striplot(s5, Fs, 2000, 100);

OW = 1300:2500;
K = 2500:2700;
IH1 = 3200:4400;
S1 = 4400:5200;
S2 = 5000:5500;
T = 5500:6200;
R = 6200:6600;
EN = 6600:8800;
H = 8800:9400;
AX = 9700:12000;