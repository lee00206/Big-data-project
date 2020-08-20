clear;
close all;

%load data
data = readtable('경기.csv');


%% Age change

data.AGE = erase(data.AGE, "s");

data.AGE = cellfun(@str2num, data.AGE);

%% split by date

Jan_19 = data(data.REG_YYMM == 201901, :);
Feb_19 = data(data.REG_YYMM == 201902, :);
Mar_19 = data(data.REG_YYMM == 201903, :);
Apr_19 = data(data.REG_YYMM == 201904, :);
May_19 = data(data.REG_YYMM == 201905, :);
Jun_19 = data(data.REG_YYMM == 201906, :);
Jul_19 = data(data.REG_YYMM == 201907, :);
Aug_19 = data(data.REG_YYMM == 201908, :);
Sep_19 = data(data.REG_YYMM == 201909, :);
Oct_19 = data(data.REG_YYMM == 201910, :);
Nov_19 = data(data.REG_YYMM == 201911, :);
Dec_19 = data(data.REG_YYMM == 201912, :);
Jan_20 = data(data.REG_YYMM == 202001, :);
Feb_20 = data(data.REG_YYMM == 202002, :);
Mar_20 = data(data.REG_YYMM == 202003, :);

%% 업종별 이용금액

%201901

Jan_19age = categorical(Jan_19.AGE);
Jan_19AMTsum = grpstats(Jan_19.AMT, Jan_19age, @sum);
Jan_19.ageAMT = Jan_19AMTsum(Jan_19age);
Jan_19ageAMTtable = table((Jan_19.AGE), Jan_19.ageAMT);
Jan_19ageAMT = unique(Jan_19ageAMTtable);

Age = {'10대';'20대';'30대';'40대';'50대';'60대';'70대'};
Final = cell2table(Age);
Final.JanAMT = Jan_19ageAMT{:, 2};

%201902

Feb_19age = categorical(Feb_19.AGE);
Feb_19AMTsum = grpstats(Feb_19.AMT, Feb_19age, @sum);
Feb_19.ageAMT = Feb_19AMTsum(Feb_19age);
Feb_19ageAMTtable = table((Feb_19.AGE),Feb_19.ageAMT);
Feb_19ageAMT = unique(Feb_19ageAMTtable);
Feb_19ageAMT.Properties.VariableNames = {'Age', 'FebAMT'};

Final.FebAMT = Feb_19ageAMT{:,2};

%201903

Mar_19age = categorical(Mar_19.AGE);
Mar_19AMTsum = grpstats(Mar_19.AMT, Mar_19age, @sum);
Mar_19.ageAMT = Mar_19AMTsum(Mar_19age);
Mar_19ageAMTtable = table((Mar_19.AGE),Mar_19.ageAMT);
Mar_19ageAMT = unique(Mar_19ageAMTtable);
Mar_19ageAMT.Properties.VariableNames = {'Age', 'MarAMT'};

Final.MarAMT = Mar_19ageAMT{:,2};

%201904

Apr_19age = categorical(Apr_19.AGE);
Apr_19AMTsum = grpstats(Apr_19.AMT, Apr_19age, @sum);
Apr_19.ageAMT = Apr_19AMTsum(Apr_19age);
Apr_19ageAMTtable = table((Apr_19.AGE),Apr_19.ageAMT);
Apr_19ageAMT = unique(Apr_19ageAMTtable);
Apr_19ageAMT.Properties.VariableNames = {'연령대', 'AprAMT'};

Final.AprAMT = Apr_19ageAMT{:,2};

%201905

May_19age = categorical(May_19.AGE);
May_19AMTsum = grpstats(May_19.AMT, May_19age, @sum);
May_19.ageAMT =May_19AMTsum(May_19age);
May_19ageAMTtable = table((May_19.AGE),May_19.ageAMT);
May_19ageAMT = unique(May_19ageAMTtable);
May_19ageAMT.Properties.VariableNames = {'연령대', 'MayAMT'};

Final.MayAMT = May_19ageAMT{:,2};

%201906

Jun_19age = categorical(Jun_19.AGE);
Jun_19AMTsum = grpstats(Jun_19.AMT, Jun_19age, @sum);
Jun_19.ageAMT =Jun_19AMTsum(Jun_19age);
Jun_19ageAMTtable = table((Jun_19.AGE),Jun_19.ageAMT);
Jun_19ageAMT = unique(Jun_19ageAMTtable);
Jun_19ageAMT.Properties.VariableNames = {'연령대', 'JunAMT'};

Final.JunAMT = Jun_19ageAMT{:,2};

%201907

Jul_19age = categorical(Jul_19.AGE);
Jul_19AMTsum = grpstats(Jul_19.AMT, Jul_19age, @sum);
Jul_19.ageAMT =Jul_19AMTsum(Jul_19age);
Jul_19ageAMTtable = table((Jul_19.AGE),Jul_19.ageAMT);
Jul_19ageAMT = unique(Jul_19ageAMTtable);
Jul_19ageAMT.Properties.VariableNames = {'연령대', 'JulAMT'};

Final.JulAMT = Jul_19ageAMT{:,2};

%201908

Aug_19age = categorical(Aug_19.AGE);
Aug_19AMTsum = grpstats(Aug_19.AMT, Aug_19age, @sum);
Aug_19.ageAMT =Aug_19AMTsum(Aug_19age);
Aug_19ageAMTtable = table((Aug_19.AGE),Aug_19.ageAMT);
Aug_19ageAMT = unique(Aug_19ageAMTtable);
Aug_19ageAMT.Properties.VariableNames = {'연령대', '매출'};

Final.AugAMT = Aug_19ageAMT{:,2};

%201909

Sep_19age = categorical(Sep_19.AGE);
Sep_19AMTsum = grpstats(Sep_19.AMT, Sep_19age, @sum);
Sep_19.ageAMT =Sep_19AMTsum(Sep_19age);
Sep_19ageAMTtable = table((Sep_19.AGE),Sep_19.ageAMT);
Sep_19ageAMT = unique(Sep_19ageAMTtable);
Sep_19ageAMT.Properties.VariableNames = {'연령대', '매출'};

Final.SepAMT = Sep_19ageAMT{:,2};

%201910

Oct_19age = categorical(Oct_19.AGE);
Oct_19AMTsum = grpstats(Oct_19.AMT, Oct_19age, @sum);
Oct_19.ageAMT =Oct_19AMTsum(Oct_19age);
Oct_19ageAMTtable = table((Oct_19.AGE),Oct_19.ageAMT);
Oct_19ageAMT = unique(Oct_19ageAMTtable);
Oct_19ageAMT.Properties.VariableNames = {'연령대', '매출'};

Final.OctAMT = Oct_19ageAMT{:,2};

%201911

Nov_19age = categorical(Nov_19.AGE);
Nov_19AMTsum = grpstats(Nov_19.AMT, Nov_19age, @sum);
Nov_19.ageAMT =Nov_19AMTsum(Nov_19age);
Nov_19ageAMTtable = table((Nov_19.AGE),Nov_19.ageAMT);
Nov_19ageAMT = unique(Nov_19ageAMTtable);
Nov_19ageAMT.Properties.VariableNames = {'연령대', '매출'};

Final.NovAMT = Nov_19ageAMT{:,2};

%201912

Dec_19age = categorical(Dec_19.AGE);
Dec_19AMTsum = grpstats(Dec_19.AMT, Dec_19age, @sum);
Dec_19.ageAMT =Dec_19AMTsum(Dec_19age);
Dec_19ageAMTtable = table((Dec_19.AGE),Dec_19.ageAMT);
Dec_19ageAMT = unique(Dec_19ageAMTtable);
Dec_19ageAMT.Properties.VariableNames = {'연령대', '매출'};

Final.DecAMT = Dec_19ageAMT{:,2};

%202001

Jan_20age = categorical(Jan_20.AGE);
Jan_20AMTsum = grpstats(Jan_20.AMT, Jan_20age, @sum);
Jan_20.ageAMT =Jan_20AMTsum(Jan_20age);
Jan_20ageAMTtable = table((Jan_20.AGE),Jan_20.ageAMT);
Jan_20ageAMT = unique(Jan_20ageAMTtable);
Jan_20ageAMT.Properties.VariableNames = {'연령대', '매출'};

Final.Jan20AMT = Jan_20ageAMT{:,2};

%202002

Feb_20age = categorical(Feb_20.AGE);
Feb_20AMTsum = grpstats(Feb_20.AMT, Feb_20age, @sum);
Feb_20.ageAMT =Feb_20AMTsum(Feb_20age);
Feb_20ageAMTtable = table((Feb_20.AGE),Feb_20.ageAMT);
Feb_20ageAMT = unique(Feb_20ageAMTtable);
Feb_20ageAMT.Properties.VariableNames = {'연령대', '매출'};

Final.Feb20AMT = Feb_20ageAMT{:,2};

%202003

Mar_20age = categorical(Mar_20.AGE);
Mar_20AMTsum = grpstats(Mar_20.AMT, Mar_20age, @sum);
Mar_20.ageAMT =Mar_20AMTsum(Mar_20age);
Mar_20ageAMTtable = table((Mar_20.AGE),Mar_20.ageAMT);
Mar_20ageAMT = unique(Mar_20ageAMTtable);
Mar_20ageAMT.Properties.VariableNames = {'연령대', '매출'};

Final.Mar20AMT = Mar_20ageAMT{:,2};

%% Save in csv

writetable(Final,'월별연령별매출.csv','Delimiter',',','QuoteStrings',true);

%% 시각화

date = grp2idx(data.REG_YYMM);
dateCNTsum = grpstats(data.CNT, date, @sum);
data.dateCNT = dateCNTsum(date);
dateCNTtable = table(data.REG_YYMM, data.dateCNT);
dateCNT = unique(dateCNTtable);


figure(1)
hold on;
plot(categorical(dateCNT{:,1}), Final{1:end, 2:end}, 'LineWidth', 2, 'Marker', 's', 'MarkerSize', 5);
legend(categorical(Final{1:end, 1}));
title('경기 월별 구매 매출');


%% Save in excel file
% 
% writetable(Jan_19ageAMT,'월별연령별매출.xlsx', 'Sheet', 1);
% writetable(Feb_19ageAMT,'월별연령별매출.xlsx', 'Sheet', 2);
% writetable(Mar_19ageAMT,'월별연령별매출.xlsx', 'Sheet', 3);
% writetable(Apr_19ageAMT,'월별연령별매출.xlsx', 'Sheet', 4);
% writetable(May_19ageAMT,'월별연령별매출.xlsx', 'Sheet', 5);
% writetable(Jun_19ageAMT,'월별연령별매출.xlsx', 'Sheet', 6);
% writetable(Jul_19ageAMT,'월별연령별매출.xlsx', 'Sheet', 7);
% writetable(Aug_19ageAMT,'월별연령별매출.xlsx', 'Sheet', 8);
% writetable(Sep_19ageAMT,'월별연령별매출.xlsx', 'Sheet', 9);
% writetable(Oct_19ageAMT,'월별연령별매출.xlsx', 'Sheet', 10);
% writetable(Nov_19ageAMT,'월별연령별매출.xlsx', 'Sheet', 11);
% writetable(Dec_19ageAMT,'월별연령별매출.xlsx', 'Sheet', 12);
% writetable(Jan_20ageAMT,'월별연령별매출.xlsx', 'Sheet', 13);
% writetable(Feb_20ageAMT,'월별연령별매출.xlsx', 'Sheet', 14);
% writetable(Mar_20ageAMT,'월별연령별매출.xlsx', 'Sheet', 15);







