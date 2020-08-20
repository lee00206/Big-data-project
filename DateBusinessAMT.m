clear;
close all;

%load data
data = readtable('충북.csv');

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
Jan_19business = categorical(Jan_19.STD_CLSS_NM);
Jan_19AMTsum = grpstats(Jan_19.AMT, Jan_19business, @sum);
Jan_19.businessAMT = Jan_19AMTsum(Jan_19business);
Jan_19businessAMTtable = table((Jan_19.STD_CLSS_NM), Jan_19.businessAMT);
Jan_19businessAMT = unique(Jan_19businessAMTtable);
Jan_19businessAMT.Properties.VariableNames = {'201901 직종','201901 매출'};

writetable(Jan_19businessAMT,'201901직종별매출.csv','Delimiter',',','QuoteStrings',true)

%201902

Feb_19business = categorical(Feb_19.STD_CLSS_NM);
Feb_19AMTsum = grpstats(Feb_19.AMT, Feb_19business, @sum);
Feb_19.businessAMT = Feb_19AMTsum(Feb_19business);
Feb_19businessAMTtable = table((Feb_19.STD_CLSS_NM), Feb_19.businessAMT);
Feb_19businessAMT = unique(Feb_19businessAMTtable);
Feb_19businessAMT.Properties.VariableNames = {'201902 직종','201902 매출'};

writetable(Feb_19businessAMT,'201902직종별매출.csv','Delimiter',',','QuoteStrings',true)

%201903

Mar_19business = categorical(Mar_19.STD_CLSS_NM);
Mar_19AMTsum = grpstats(Mar_19.AMT, Mar_19business, @sum);
Mar_19.businessAMT = Mar_19AMTsum(Mar_19business);
Mar_19businessAMTtable = table((Mar_19.STD_CLSS_NM), Mar_19.businessAMT);
Mar_19businessAMT = unique(Mar_19businessAMTtable);
Mar_19businessAMT.Properties.VariableNames = {'201903 직종','201903 매출'};

writetable(Mar_19businessAMT,'201903직종별매출.csv','Delimiter',',','QuoteStrings',true)

%201904

Apr_19business = categorical(Apr_19.STD_CLSS_NM);
Apr_19AMTsum = grpstats(Apr_19.AMT, Apr_19business, @sum);
Apr_19.businessAMT = Apr_19AMTsum(Apr_19business);
Apr_19businessAMTtable = table((Apr_19.STD_CLSS_NM), Apr_19.businessAMT);
Apr_19businessAMT = unique(Apr_19businessAMTtable);
Apr_19businessAMT.Properties.VariableNames = {'201904 직종','201904 매출'};

writetable(Apr_19businessAMT,'201904직종별매출.csv','Delimiter',',','QuoteStrings',true)

%201905

May_19business = categorical(May_19.STD_CLSS_NM);
May_19AMTsum = grpstats(May_19.AMT, May_19business, @sum);
May_19.businessAMT = May_19AMTsum(May_19business);
May_19businessAMTtable = table((May_19.STD_CLSS_NM), May_19.businessAMT);
May_19businessAMT = unique(May_19businessAMTtable);
May_19businessAMT.Properties.VariableNames = {'201905 직종','201905 매출'};

writetable(May_19businessAMT,'201905직종별매출.csv','Delimiter',',','QuoteStrings',true)

%201906

Jun_19business = categorical(Jun_19.STD_CLSS_NM);
Jun_19AMTsum = grpstats(Jun_19.AMT, Jun_19business, @sum);
Jun_19.businessAMT = Jun_19AMTsum(Jun_19business);
Jun_19businessAMTtable = table((Jun_19.STD_CLSS_NM), Jun_19.businessAMT);
Jun_19businessAMT = unique(Jun_19businessAMTtable);
Jun_19businessAMT.Properties.VariableNames = {'201906 직종','201906 매출'};

writetable(Jun_19businessAMT,'201906직종별매출.csv','Delimiter',',','QuoteStrings',true)

%201907

Jul_19business = categorical(Jul_19.STD_CLSS_NM);
Jul_19AMTsum = grpstats(Jul_19.AMT, Jul_19business, @sum);
Jul_19.businessAMT = Jul_19AMTsum(Jul_19business);
Jul_19businessAMTtable = table((Jul_19.STD_CLSS_NM), Jul_19.businessAMT);
Jul_19businessAMT = unique(Jul_19businessAMTtable);
Jul_19businessAMT.Properties.VariableNames = {'201907 직종','201907 매출'};

writetable(Jul_19businessAMT,'201907직종별매출.csv','Delimiter',',','QuoteStrings',true)

%201908

Aug_19business = categorical(Aug_19.STD_CLSS_NM);
Aug_19AMTsum = grpstats(Aug_19.AMT, Aug_19business, @sum);
Aug_19.businessAMT = Aug_19AMTsum(Aug_19business);
Aug_19businessAMTtable = table((Aug_19.STD_CLSS_NM), Aug_19.businessAMT);
Aug_19businessAMT = unique(Aug_19businessAMTtable);
Aug_19businessAMT.Properties.VariableNames = {'201908 직종','201908 매출'};

writetable(Aug_19businessAMT,'201908직종별매출.csv','Delimiter',',','QuoteStrings',true)

%201909

Sep_19business = categorical(Sep_19.STD_CLSS_NM);
Sep_19AMTsum = grpstats(Sep_19.AMT, Sep_19business, @sum);
Sep_19.businessAMT = Sep_19AMTsum(Sep_19business);
Sep_19businessAMTtable = table((Sep_19.STD_CLSS_NM), Sep_19.businessAMT);
Sep_19businessAMT = unique(Sep_19businessAMTtable);
Sep_19businessAMT.Properties.VariableNames = {'201909 직종','201909 매출'};

writetable(Sep_19businessAMT,'201909직종별매출.csv','Delimiter',',','QuoteStrings',true)

%201910

Oct_19business = categorical(Oct_19.STD_CLSS_NM);
Oct_19AMTsum = grpstats(Oct_19.AMT, Oct_19business, @sum);
Oct_19.businessAMT = Oct_19AMTsum(Oct_19business);
Oct_19businessAMTtable = table((Oct_19.STD_CLSS_NM), Oct_19.businessAMT);
Oct_19businessAMT = unique(Oct_19businessAMTtable);
Oct_19businessAMT.Properties.VariableNames = {'201910 직종','201910 매출'};

writetable(Oct_19businessAMT,'201910직종별매출.csv','Delimiter',',','QuoteStrings',true)

%201911

Nov_19business = categorical(Nov_19.STD_CLSS_NM);
Nov_19AMTsum = grpstats(Nov_19.AMT, Nov_19business, @sum);
Nov_19.businessAMT = Nov_19AMTsum(Nov_19business);
Nov_19businessAMTtable = table((Nov_19.STD_CLSS_NM), Nov_19.businessAMT);
Nov_19businessAMT = unique(Nov_19businessAMTtable);
Nov_19businessAMT.Properties.VariableNames = {'201911 직종','201911 매출'};

writetable(Nov_19businessAMT,'201911직종별매출.csv','Delimiter',',','QuoteStrings',true)

%201912

Dec_19business = categorical(Dec_19.STD_CLSS_NM);
Dec_19AMTsum = grpstats(Dec_19.AMT, Dec_19business, @sum);
Dec_19.businessAMT = Dec_19AMTsum(Dec_19business);
Dec_19businessAMTtable = table((Dec_19.STD_CLSS_NM), Dec_19.businessAMT);
Dec_19businessAMT = unique(Dec_19businessAMTtable);
Dec_19businessAMT.Properties.VariableNames = {'201912 직종','201912 매출'};

writetable(Dec_19businessAMT,'201912직종별매출.csv','Delimiter',',','QuoteStrings',true)

%202001

Jan_20business = categorical(Jan_20.STD_CLSS_NM);
Jan_20AMTsum = grpstats(Jan_20.AMT, Jan_20business, @sum);
Jan_20.businessAMT = Jan_20AMTsum(Jan_20business);
Jan_20businessAMTtable = table((Jan_20.STD_CLSS_NM), Jan_20.businessAMT);
Jan_20businessAMT = unique(Jan_20businessAMTtable);
Jan_20businessAMT.Properties.VariableNames = {'202001 직종','202001 매출'};

writetable(Jan_20businessAMT,'202001직종별매출.csv','Delimiter',',','QuoteStrings',true)

%202002

Feb_20business = categorical(Feb_20.STD_CLSS_NM);
Feb_20AMTsum = grpstats(Feb_20.AMT, Feb_20business, @sum);
Feb_20.businessAMT = Feb_20AMTsum(Feb_20business);
Feb_20businessAMTtable = table((Feb_20.STD_CLSS_NM), Feb_20.businessAMT);
Feb_20businessAMT = unique(Feb_20businessAMTtable);
Feb_20businessAMT.Properties.VariableNames = {'202002 직종','202002 매출'};

writetable(Feb_20businessAMT,'202002직종별매출.csv','Delimiter',',','QuoteStrings',true)

%202003

Mar_20business = categorical(Mar_20.STD_CLSS_NM);
Mar_20AMTsum = grpstats(Mar_20.AMT, Mar_20business, @sum);
Mar_20.businessAMT = Mar_20AMTsum(Mar_20business);
Mar_20businessAMTtable = table((Mar_20.STD_CLSS_NM), Mar_20.businessAMT);
Mar_20businessAMT = unique(Mar_20businessAMTtable);
Mar_20businessAMT.Properties.VariableNames = {'202003 직종','202003 매출'};

writetable(Mar_20businessAMT,'202003직종별매출.csv','Delimiter',',','QuoteStrings',true)






