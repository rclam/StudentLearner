%fresh eyes...

clear
clc

%==========================================================================
%-- import data, set-up
%==========================================================================
load('MTS_Wgn22_Pc_150_Axial.mat');

% new time vector [s]
t_new = 0.12 : 0.10 : 16338;
t     = t_new(1:76360);

% shorten vectors
Displacement = Displacement(1:76360);
diffStress = diffStress(1:76360);

%==========================================================================
%-- determine what is stress drop
%==========================================================================

%-- noise
n_min   = min(diffStress(1:200));
n_max   = max(diffStress(1:200));
n_range = n_max - n_min;
fprintf('Noise range is: %.2f MPa\n', n_range)

%-- time step
ts = Time(2) - Time(1);
fprintf('Sampling rate is: %.2f seconds\n', ts)

%-- define
noise  = n_range * 10;
t_x    = ts * 10;
s_def  = noise/t_x;
fprintf('Stress drop is declared as at least -%.1f MPa over 1 seconds\n\n', s_def)

%==========================================================================
%-- isolate stress drops
%==========================================================================

%-- window
fs = 10;        % sample rate [Hz]
dt = 1;         % time step [s]
win = dt*fs;    % sample window

N = 1:length(diffStress);       % vector length... run window over this length

win_end = N(end) - win;         % end of N for window
win_v   = 1:win:win_end;        % window vector
s_drops = diffStress(win_v);    % diffStress values at each window point
t_win   = t(win_v);             % time values at each window point
d_win   = Displacement(win_v);  % displacement values at each window point
s_d     = [];

%-- calculate change in diffStress for each window point
for i = 1:length(s_drops)-1
    
    s_d(i) = s_drops(i) - s_drops(i+1);
end

%-- determine what counts as stress drop
drops = s_d(s_d>=abs(s_def));   % <------------ stress drops!
fprintf('Stress drop magnitudes are: %.2f MPa\n', drops)
%-- determine where/when stress drops occur
%-- where
sd_loc = find(s_d>=abs(s_def));
%fprintf('Stress drops located: %.f \n', sd_loc)

%-- determine where/when Displacement at drops
d_d = []; % Delta(Displacement) stored here
for j = 1:length(d_win)-1
    d_d(j) = d_win(j) - d_win(j+1);
end
Dd = d_d(sd_loc);
net_Dd = abs(Dd);        % <------------ Delta(Displacement) amounts for D(dS)

%==========================================================================
%-- calculate Stiffness
%==========================================================================
% ! Variable Reminder !!
% D(diffStress)   = drops  --> y-values
% D(Displacement) = net_Dd --> x-values

k = drops./net_Dd;
fprintf('Stiffness: %.f \n', k)

%-- best fit k
[r,p] = corrcoef(drops,k); % pearson r
q = polyfit(drops, k, 1);  %least-squares
%- linfit
y_hat = polyval(q,drops);

%==========================================================================
%-- plots
%==========================================================================
% figure(1)
% plot(Displacement, diffStress,'b')
% xlabel('Displacement (mm)')
% ylabel('Differential Stress (MPa)')
% title('Wgn 22')

% figure(2)
% plot(d_win(2:end),s_d,'b')
% xlabel('Displacement (mm)')
% ylabel('Stress Drops magnitude (MPa)')
% title('Wgn 22')
% hold on
% yline(noise, 'r--')
% legend('data', 'threshold')
% 
% 
% figure(3)
% scatter(net_Dd, drops,'b')
% ylabel('\Delta diffStress (MPa)')
% xlabel('\Delta Displacement (mm)')
% title('Wgn 22')
% 
% figure(4)
% scatter(drops, k, 'b')
% xlabel('\Delta diffStress (MPa)')
% ylabel('Machine Stiffness k (MPa/mm)')
% % title('Wgn 22')
% 
% hold on
% plot(drops, y_hat, 'r--')
% legend('data','lsq-fit')
% title(['Wgn 22, r = ',num2str(r(2))])


