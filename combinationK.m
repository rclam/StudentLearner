%comparing all K

clear
clc

%-- w19
w19_drops = [168.318218912236,127.355744718469,95.8168729023596,2.73290173065229];
w19_k = [104202.450883567,141051.882510170,41328.8789261376,2252.82477178457];

w19_d_edit = [127.355744718469,95.8168729023596,2.73290173065229];
w19_k_edit = [141051.882510170,41328.8789261376,2252.82477178457];

%-- w20
w20_drops = [105.823537504175,1.82391055487494,0.885568661112359,3.05598371864971,0.698662188903455,100.694500809495,0.963159878968526,95.1416128562885];
w20_k = [9654.11097971759,4566.62632667680,594.301497290424,2379.30840754443,1512.25582013675,422376.261785236,765.871405032108,29234.7630458124];

% w20_d_edit = [1.82391055487494,0.885568661112359,3.05598371864971,0.698662188903455,100.694500809495,0.963159878968526,95.1416128562885];
% w20_k_edit = [4566.62632667680,594.301497290424,2379.30840754443,1512.25582013675,422376.261785236,765.871405032108,29234.7630458124];
w20_d_edit = [105.823537504175,3.05598371864971,95.1416128562885];
w20_k_edit = [9654.11097971759,2379.30840754443,29234.7630458124];

%-- w21
w21_drops = [10.5637832970097,111.250914596019,114.872109720410,100.683693552239];
w21_k = [4978.22021536751,45581.5604523421,58851.4317948747,341185.000177287];

% w21_d_edit = [111.250914596019,114.872109720410,100.683693552239];
% w21_k_edit = [45581.5604523421,58851.4317948747,341185.000177287];
w21_d_edit = [10.5637832970097,111.250914596019,114.872109720410];
w21_k_edit = [4978.22021536751,45581.5604523421,58851.4317948747];


%-- w23
w23_drops = [4.13680621042624,120.715184244736,113.720530760653,127.845829898112];
w23_k = [2856.14110179315,128181.772492420,7632250.38662902,123618.091179779];

w23_d_edit = [120.715184244736,113.720530760653,127.845829898112];
w23_k_edit = [128181.772492420,7632250.38662902,123618.091179779];

%-- w24
w24_drops = [0.802410839966683,3.32447938088529,1.02731078019053,124.825486700799,1.37100906289623,91.8925958367405,64.9364900210380];
w24_k = [7478.89682138118,2157.66000394946,277.097367478702,42052.7123854314,593.592646122508,53531.4345347758,32280.0523055780];

w24_d_edit = [3.32447938088529,1.02731078019053,124.825486700799,1.37100906289623,91.8925958367405,64.9364900210380];
w24_k_edit = [2157.66000394946,277.097367478702,42052.7123854314,593.592646122508,53531.4345347758,32280.0523055780];

%-- w25
w25_drops = [93.1425860273888,25.4479026453819,2.12451222547054,1.78563697416021];
w25_k = [76601.9310547388,9940.50931062333,3960.31731842754,2406.25939812455];

w25_d_edit = [25.4479026453819,2.12451222547054,1.78563697416021];
w25_k_edit = [9940.50931062333,3960.31731842754,2406.25939812455];

%-- w26
w26_drops = [148.492397149880,127.301764454731];
w26_k = [8304943.91217375,1643027.41939586];

w26_d_edit = [148.492397149880,127.301764454731];
w26_k_edit = [8304943.91217375,1643027.41939586];


%==========================================================================
%-- PLOTS
%==========================================================================
figure(1)
scatter(w19_drops, w19_k, 'k')
hold on
scatter(w20_drops, w20_k, 'b')
hold on
scatter(w21_drops, w21_k, 'c')
hold on
scatter(w23_drops, w23_k, 'r')
hold on
scatter(w24_drops, w24_k, 'g')
hold on
scatter(w25_drops, w25_k, 'y')
hold on
scatter(w26_drops, w26_k, 'm')

xlabel('\Delta diffStress')
ylabel('Stiffness K')
legend('w19','w20','w21','w23','w24','w25','w26')

figure(2)
scatter(w19_d_edit, w19_k_edit, 'k')
hold on
scatter(w20_d_edit, w20_k_edit, 'b')
hold on
scatter(w21_d_edit, w21_k_edit, 'c')
hold on
scatter(w23_d_edit, w23_k_edit, 'r')
hold on
scatter(w24_d_edit, w24_k_edit, 'g')
hold on
scatter(w25_d_edit, w25_k_edit, 'y')
hold on
scatter(w26_d_edit, w26_k_edit, 'm')

xlabel('\Delta diffStress')
ylabel('Stiffness K')
legend('w19','w20','w21','w23','w24','w25','w26')

figure(3)
scatter(w19_drops, w19_k, 'k')
hold on
scatter(w20_drops, w20_k, 'b')
hold on
scatter(w21_drops, w21_k, 'c')
hold on
scatter(w24_drops, w24_k, 'g')
hold on
scatter(w25_drops, w25_k, 'y')

xlabel('\Delta diffStress')
ylabel('Stiffness K')
legend('w19','w20','w21','w24','w25')


figure(4)
scatter(w19_d_edit, w19_k_edit, 'k')
hold on
scatter(w20_d_edit, w20_k_edit, 'b')
hold on
scatter(w21_d_edit, w21_k_edit, 'c')
hold on
scatter(w24_d_edit, w24_k_edit, 'g')
hold on
scatter(w25_d_edit, w25_k_edit, 'y')
xlabel('\Delta diffStress')
ylabel('Stiffness K')
legend('w19','w20','w21','w24','w25')

figure(5)
scatter(w19_d_edit, w19_k_edit, 'k')
hold on
scatter(w21_d_edit, w21_k_edit, 'c')
hold on
scatter(w24_d_edit, w24_k_edit, 'g')
hold on
scatter(w25_d_edit, w25_k_edit, 'y')
xlabel('\Delta diffStress')
ylabel('Stiffness K')
legend('w19','w21','w24','w25')

figure(6)
scatter(w20_d_edit, w20_k_edit, 'b')
hold on
scatter(w23_d_edit, w23_k_edit, 'c')
hold on
scatter(w26_d_edit, w26_k_edit, 'm')
xlabel('\Delta diffStress (MPa)')
ylabel('Stiffness K (MPa/mm)')
legend('w20','w23','w26')
