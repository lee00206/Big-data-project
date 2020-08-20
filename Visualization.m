clear;
close all;

%load data
data = readtable('2019.csv');

%% 지역, 이용건수
city = categorical(data.CARD_SIDO_NM);
CNTsum = grpstats(data.CNT, city, @sum);
cityindices = grp2idx(data.CARD_SIDO_NM);
data.cityCNT = CNTsum(cityindices);
cityCNTtable = table((data.CARD_SIDO_NM), data.cityCNT);
cityCNT = unique(cityCNTtable);

figure(1)
bar(categorical(cityCNT{:,1}), cityCNT{:,2});
title('지역별 이용건수');

%% 업종 수
BusinessTypeCategory = categorical(data.STD_CLSS_NM);
BusinessType = unique(BusinessTypeCategory);

%% 월별 이용건수

date = grp2idx(data.REG_YYMM);
dateCNTsum = grpstats(data.CNT, date, @sum);
data.dateCNT = dateCNTsum(date);
dateCNTtable = table(data.REG_YYMM, data.dateCNT);
dateCNT = unique(dateCNTtable);

figure(19)
plot(categorical(dateCNT{:,1}), dateCNT{:,2}, 'LineWidth', 2, 'Marker', 's', 'MarkerSize', 5);
title('월별 이용건수');

%% 월별 이용금액

date = grp2idx(data.REG_YYMM);
dateAMTsum = grpstats(data.AMT, date, @sum);
data.dateAMT = dateAMTsum(date);
dateAMTtable = table(data.REG_YYMM, data.dateAMT);
dateAMT = unique(dateAMTtable);

figure(20)
plot(categorical(dateAMT{:,1}), dateAMT{:,2}, 'LineWidth', 2, 'Marker', 's', 'MarkerSize', 5);
title('월별 이용금액');

%% 월별 이용금액, 이용건수

figure(21)
hold on;
plot(categorical(dateCNT{:,1}), dateCNT{:,2}, 'LineWidth', 2, 'Marker', 's', 'MarkerSize', 5);
ylabel('이용건수');
yyaxis right;
plot(categorical(dateAMT{:,1}), dateAMT{:,2}, 'LineWidth', 2, 'Marker', 's', 'MarkerSize', 5);
ylabel('이용금액');
title('월별 이용금액과 이용건수');

%% 월별 타지역, 지역

AreaIDX = cellfun(@isequal, data.CARD_SIDO_NM, data.HOM_SIDO_NM);

FromOtherArea = data(~AreaIDX, :);
FromSameArea = data(AreaIDX, :);

FromOtherAreaDate = grp2idx(FromOtherArea.REG_YYMM);
FromOtherAreaDateCNTsum = grpstats(FromOtherArea.CNT, FromOtherAreaDate, @sum);
FromOtherArea.dateCNT = FromOtherAreaDateCNTsum(FromOtherAreaDate);
FromOtherAreaDateCNTtable = table(FromOtherArea.REG_YYMM, FromOtherArea.dateCNT);
FromOtherAreaDateCNT = unique(FromOtherAreaDateCNTtable);

FromSameAreaDate = grp2idx(FromSameArea.REG_YYMM);
FromSameAreaDateCNTsum = grpstats(FromSameArea.CNT, FromSameAreaDate, @sum);
FromSameArea.dateCNT = FromSameAreaDateCNTsum(FromSameAreaDate);
FromSameAreaDateCNTtable = table(FromSameArea.REG_YYMM, FromSameArea.dateCNT);
FromSameAreaDateCNT = unique(FromSameAreaDateCNTtable);

AreaY = [FromOtherAreaDateCNT{:,2},FromSameAreaDateCNT{:,2}];
%% 

figure(22)
bar(categorical(FromOtherAreaDateCNT{:, 1}), AreaY);
title('같은 지역 구매 고객과 타지역 구매 고객 이용건수 월별 그래프');
legend('타지역', '같은 지역');

%% 

figure(24)
hold on;
plot(categorical(FromOtherAreaDateCNT{:, 1}), FromOtherAreaDateCNT{:, 2},'LineWidth', 2, 'Marker', 's', 'MarkerSize', 5);
ylabel('타지역 이용건수');
yyaxis right;
plot(categorical(FromSameAreaDateCNT{:, 1}), FromSameAreaDateCNT{:, 2},'LineWidth', 2, 'Marker', 's', 'MarkerSize', 5);
ylabel('같은 지역 이용건수');
title('같은 지역 구매 고객과 타지역 구매 고객 이용건수 월별 그래프');

%% 같은 지역 - 타지역

DifferenceAreaCNT = FromSameAreaDateCNT{:,2} - FromOtherAreaDateCNT{:,2};

figure(23)
plot(categorical(FromOtherAreaDateCNT{:, 1}), DifferenceAreaCNT, 'LineWidth', 2, 'Marker', 's', 'MarkerSize', 5);
title('같은 지역 구매 고객과 타지역 구매 고객 이용건수 차이 추이');

%% 같은 지역 차이


%% 지역별 테이블 split

Gangwon = data(data.CARD_SIDO_NM == "강원", :);
%writetable(Gangwon,'강원.csv','Delimiter',',','QuoteStrings',true)

Gyeonggi = data(data.CARD_SIDO_NM == "경기", :);
%writetable(Gyeonggi,'경기.csv','Delimiter',',','QuoteStrings',true)

Gyeongnam = data(data.CARD_SIDO_NM == "경남", :);
%writetable(Gyeongnam,'경남.csv','Delimiter',',','QuoteStrings',true)

Gyeongbuk = data(data.CARD_SIDO_NM == "경북", :);
%writetable(Gyeongbuk,'경북.csv','Delimiter',',','QuoteStrings',true)

Gwangju = data(data.CARD_SIDO_NM == "광주", :);
%writetable(Gwangju,'광주.csv','Delimiter',',','QuoteStrings',true)

Daegu = data(data.CARD_SIDO_NM == "대구", :);
%writetable(Daegu,'대구.csv','Delimiter',',','QuoteStrings',true)

Daejeon = data(data.CARD_SIDO_NM == "대전", :);
%writetable(Daejeon,'대전.csv','Delimiter',',','QuoteStrings',true)

Busan = data(data.CARD_SIDO_NM == "부산", :);
%writetable(Busan,'부산.csv','Delimiter',',','QuoteStrings',true)

Seoul = data(data.CARD_SIDO_NM == "서울", :);
%writetable(Seoul,'서울.csv','Delimiter',',','QuoteStrings',true)

Sejong = data(data.CARD_SIDO_NM == "세종", :);
%writetable(Sejong,'세종.csv','Delimiter',',','QuoteStrings',true)

Ulsan = data(data.CARD_SIDO_NM == "울산", :);
%writetable(Ulsan,'울산.csv','Delimiter',',','QuoteStrings',true)

Incheon = data(data.CARD_SIDO_NM == "인천", :);
%writetable(Incheon,'인천.csv','Delimiter',',','QuoteStrings',true)

Jeonnam = data(data.CARD_SIDO_NM == "전남", :);
%writetable(Jeonnam,'전남.csv','Delimiter',',','QuoteStrings',true)

Jeonbuk = data(data.CARD_SIDO_NM == "전북", :);
%writetable(Jeonbuk,'전북.csv','Delimiter',',','QuoteStrings',true)

Jeju = data(data.CARD_SIDO_NM == "제주", :);
%writetable(Jeju,'제주.csv','Delimiter',',','QuoteStrings',true)

Chungnam = data(data.CARD_SIDO_NM == "충남", :);
%writetable(Chungnam,'충남.csv','Delimiter',',','QuoteStrings',true)

Chungbuk = data(data.CARD_SIDO_NM == "충북", :);
%writetable(Chungbuk,'충북.csv','Delimiter',',','QuoteStrings',true)

%% 지역별 업종

%%강원
%업종별
GangwonBusiness = categorical(Gangwon.STD_CLSS_NM);
GangwonBusinessCNTsum = grpstats(Gangwon.CNT, GangwonBusiness, @sum);
GangwonBusinessIndices = grp2idx(Gangwon.STD_CLSS_NM);
Gangwon.BusinessCNT = GangwonBusinessCNTsum(GangwonBusinessIndices);
GangwonBusinessCNTtable = table((Gangwon.STD_CLSS_NM), Gangwon.BusinessCNT);
GangwonBusinessCNT = unique(GangwonBusinessCNTtable);

%월별
GangwonDate = grp2idx(Gangwon.REG_YYMM);
GangwonDateCNTsum = grpstats(Gangwon.CNT, GangwonDate, @sum);
% Gangwon.DateCNT

%경기
GyeonggiBusiness = categorical(Gyeonggi.STD_CLSS_NM);
GyeonggiBusinessCNTsum = grpstats(Gyeonggi.CNT, GyeonggiBusiness, @sum);
GyeonggiBusinessIndices = grp2idx(Gyeonggi.STD_CLSS_NM);
Gyeonggi.BusinessCNT = GyeonggiBusinessCNTsum(GyeonggiBusinessIndices);
GyeonggiBusinessCNTtable = table((Gyeonggi.STD_CLSS_NM), Gyeonggi.BusinessCNT);
GyeonggiBusinessCNT = unique(GyeonggiBusinessCNTtable);

%경남
GyeongnamBusiness = categorical(Gyeongnam.STD_CLSS_NM);
GyeongnamBusinessCNTsum = grpstats(Gyeongnam.CNT, GyeongnamBusiness, @sum);
GyeongnamBusinessIndices = grp2idx(Gyeongnam.STD_CLSS_NM);
Gyeongnam.BusinessCNT = GyeongnamBusinessCNTsum(GyeongnamBusinessIndices);
GyeongnamBusinessCNTtable = table((Gyeongnam.STD_CLSS_NM), Gyeongnam.BusinessCNT);
GyeongnamBusinessCNT = unique(GyeongnamBusinessCNTtable);

%경북
GyeongbukBusiness = categorical(Gyeongbuk.STD_CLSS_NM);
GyeongbukBusinessCNTsum = grpstats(Gyeongbuk.CNT, GyeongbukBusiness, @sum);
GyeongbukBusinessIndices = grp2idx(Gyeongbuk.STD_CLSS_NM);
Gyeongbuk.BusinessCNT = GyeongbukBusinessCNTsum(GyeongbukBusinessIndices);
GyeongbukBusinessCNTtable = table((Gyeongbuk.STD_CLSS_NM), Gyeongbuk.BusinessCNT);
GyeongbukBusinessCNT = unique(GyeongbukBusinessCNTtable);

%광주
GwangjuBusiness = categorical(Gwangju.STD_CLSS_NM);
GwangjuBusinessCNTsum = grpstats(Gwangju.CNT, GwangjuBusiness, @sum);
GwangjuBusinessIndices = grp2idx(Gwangju.STD_CLSS_NM);
Gwangju.BusinessCNT = GwangjuBusinessCNTsum(GwangjuBusinessIndices);
GwangjuBusinessCNTtable = table((Gwangju.STD_CLSS_NM), Gwangju.BusinessCNT);
GwangjuBusinessCNT = unique(GwangjuBusinessCNTtable);

%대구
DaeguBusiness = categorical(Daegu.STD_CLSS_NM);
DaeguBusinessCNTsum = grpstats(Daegu.CNT, DaeguBusiness, @sum);
DaeguBusinessIndices = grp2idx(Daegu.STD_CLSS_NM);
Daegu.BusinessCNT = DaeguBusinessCNTsum(DaeguBusinessIndices);
DaeguBusinessCNTtable = table((Daegu.STD_CLSS_NM), Daegu.BusinessCNT);
DaeguBusinessCNT = unique(DaeguBusinessCNTtable);

%대전
DaejeonBusiness = categorical(Daejeon.STD_CLSS_NM);
DaejeonBusinessCNTsum = grpstats(Daejeon.CNT, DaejeonBusiness, @sum);
DaejeonBusinessIndices = grp2idx(Daejeon.STD_CLSS_NM);
Daejeon.BusinessCNT = DaejeonBusinessCNTsum(DaejeonBusinessIndices);
DaejeonBusinessCNTtable = table((Daejeon.STD_CLSS_NM), Daejeon.BusinessCNT);
DaejeonBusinessCNT = unique(DaejeonBusinessCNTtable);

%부산
BusanBusiness = categorical(Busan.STD_CLSS_NM);
BusanBusinessCNTsum = grpstats(Busan.CNT, BusanBusiness, @sum);
BusanBusinessIndices = grp2idx(Busan.STD_CLSS_NM);
Busan.BusinessCNT = BusanBusinessCNTsum(BusanBusinessIndices);
BusanBusinessCNTtable = table((Busan.STD_CLSS_NM), Busan.BusinessCNT);
BusanBusinessCNT = unique(BusanBusinessCNTtable);

%서울
SeoulBusiness = categorical(Seoul.STD_CLSS_NM);
SeoulBusinessCNTsum = grpstats(Seoul.CNT, SeoulBusiness, @sum);
SeoulBusinessIndices = grp2idx(Seoul.STD_CLSS_NM);
Seoul.BusinessCNT = SeoulBusinessCNTsum(SeoulBusinessIndices);
SeoulBusinessCNTtable = table((Seoul.STD_CLSS_NM), Seoul.BusinessCNT);
SeoulBusinessCNT = unique(SeoulBusinessCNTtable);

%세종
SejongBusiness = categorical(Sejong.STD_CLSS_NM);
SejongBusinessCNTsum = grpstats(Sejong.CNT, SejongBusiness, @sum);
SejongBusinessIndices = grp2idx(Sejong.STD_CLSS_NM);
Sejong.BusinessCNT = GangwonBusinessCNTsum(SejongBusinessIndices);
SejongBusinessCNTtable = table((Sejong.STD_CLSS_NM), Sejong.BusinessCNT);
SejongBusinessCNT = unique(SejongBusinessCNTtable);

%울산
UlsanBusiness = categorical(Ulsan.STD_CLSS_NM);
UlsanBusinessCNTsum = grpstats(Ulsan.CNT, UlsanBusiness, @sum);
UlsanBusinessIndices = grp2idx(Ulsan.STD_CLSS_NM);
Ulsan.BusinessCNT = UlsanBusinessCNTsum(UlsanBusinessIndices);
UlsanBusinessCNTtable = table((Ulsan.STD_CLSS_NM), Ulsan.BusinessCNT);
UlsanBusinessCNT = unique(UlsanBusinessCNTtable);

%인천
IncheonBusiness = categorical(Incheon.STD_CLSS_NM);
IncheonBusinessCNTsum = grpstats(Incheon.CNT, IncheonBusiness, @sum);
IncheonBusinessIndices = grp2idx(Incheon.STD_CLSS_NM);
Incheon.BusinessCNT = IncheonBusinessCNTsum(IncheonBusinessIndices);
IncheonBusinessCNTtable = table((Incheon.STD_CLSS_NM), Incheon.BusinessCNT);
IncheonBusinessCNT = unique(IncheonBusinessCNTtable);

%전남
JeonnamBusiness = categorical(Jeonnam.STD_CLSS_NM);
JeonnamBusinessCNTsum = grpstats(Jeonnam.CNT, JeonnamBusiness, @sum);
JeonnamBusinessIndices = grp2idx(Jeonnam.STD_CLSS_NM);
Jeonnam.BusinessCNT = JeonnamBusinessCNTsum(JeonnamBusinessIndices);
JeonnamBusinessCNTtable = table((Jeonnam.STD_CLSS_NM), Jeonnam.BusinessCNT);
JeonnamBusinessCNT = unique(JeonnamBusinessCNTtable);

%전북
JeonbukBusiness = categorical(Jeonbuk.STD_CLSS_NM);
JeonbukBusinessCNTsum = grpstats(Jeonbuk.CNT, JeonbukBusiness, @sum);
JeonbukBusinessIndices = grp2idx(Jeonbuk.STD_CLSS_NM);
Jeonbuk.BusinessCNT = JeonbukBusinessCNTsum(JeonbukBusinessIndices);
JeonbukBusinessCNTtable = table((Jeonbuk.STD_CLSS_NM), Jeonbuk.BusinessCNT);
JeonbukBusinessCNT = unique(JeonbukBusinessCNTtable);

%제주
JejuBusiness = categorical(Jeju.STD_CLSS_NM);
JejuBusinessCNTsum = grpstats(Jeju.CNT, JejuBusiness, @sum);
JejuBusinessIndices = grp2idx(Jeju.STD_CLSS_NM);
Jeju.BusinessCNT = JejuBusinessCNTsum(JejuBusinessIndices);
JejuBusinessCNTtable = table((Jeju.STD_CLSS_NM), Jeju.BusinessCNT);
JejuBusinessCNT = unique(JejuBusinessCNTtable);

%충남
ChungnamBusiness = categorical(Chungnam.STD_CLSS_NM);
ChungnamBusinessCNTsum = grpstats(Chungnam.CNT, ChungnamBusiness, @sum);
ChungnamBusinessIndices = grp2idx(Chungnam.STD_CLSS_NM);
Chungnam.BusinessCNT = ChungnamBusinessCNTsum(ChungnamBusinessIndices);
ChungnamBusinessCNTtable = table((Chungnam.STD_CLSS_NM), Chungnam.BusinessCNT);
ChungnamBusinessCNT = unique(ChungnamBusinessCNTtable);

%충북
ChungbukBusiness = categorical(Chungbuk.STD_CLSS_NM);
ChungbukBusinessCNTsum = grpstats(Chungbuk.CNT, ChungbukBusiness, @sum);
ChungbukBusinessIndices = grp2idx(Chungbuk.STD_CLSS_NM);
Chungbuk.BusinessCNT = ChungbukBusinessCNTsum(ChungbukBusinessIndices);
ChungbukBusinessCNTtable = table((Chungbuk.STD_CLSS_NM), Chungbuk.BusinessCNT);
ChungbukBusinessCNT = unique(ChungbukBusinessCNTtable);

%% 지역별 업종별 그래프

figure(2)
bar(categorical(GangwonBusinessCNT{:,1}), GangwonBusinessCNT{:,2});
title('강원 업종별 이용건수');

figure(3)
bar(categorical(GyeonggiBusinessCNT{:,1}), GyeonggiBusinessCNT{:,2});
title('경기 업종별 이용건수');

figure(4)
bar(categorical(GyeongnamBusinessCNT{:,1}), GyeongnamBusinessCNT{:,2});
title('경남 업종별 이용건수');

figure(5)
bar(categorical(GyeongbukBusinessCNT{:,1}), GyeongbukBusinessCNT{:,2});
title('경북 업종별 이용건수');

figure(6)
bar(categorical(GwangjuBusinessCNT{:,1}), GwangjuBusinessCNT{:,2});
title('광주 업종별 이용건수');

figure(7)
bar(categorical(DaeguBusinessCNT{:,1}), DaeguBusinessCNT{:,2});
title('대구 업종별 이용건수');

figure(8)
bar(categorical(DaejeonBusinessCNT{:,1}), DaejeonBusinessCNT{:,2});
title('대전 업종별 이용건수');

figure(9)
bar(categorical(BusanBusinessCNT{:,1}), BusanBusinessCNT{:,2});
title('부산 업종별 이용건수');

figure(10)
bar(categorical(SeoulBusinessCNT{:,1}), SeoulBusinessCNT{:,2});
title('서울 업종별 이용건수');

figure(11)
bar(categorical(SejongBusinessCNT{:,1}), SejongBusinessCNT{:,2});
title('세종 업종별 이용건수');

figure(12)
bar(categorical(UlsanBusinessCNT{:,1}), UlsanBusinessCNT{:,2});
title('울산 업종별 이용건수');

figure(13)
bar(categorical(IncheonBusinessCNT{:,1}), IncheonBusinessCNT{:,2});
title('인천 업종별 이용건수');

figure(14)
bar(categorical(JeonnamBusinessCNT{:,1}), JeonnamBusinessCNT{:,2});
title('전남 업종별 이용건수');

figure(15)
bar(categorical(JeonbukBusinessCNT{:,1}), JeonbukBusinessCNT{:,2});
title('전북 업종별 이용건수');

figure(16)
bar(categorical(JejuBusinessCNT{:,1}), JejuBusinessCNT{:,2});
title('제주 업종별 이용건수');

figure(17)
bar(categorical(ChungnamBusinessCNT{:,1}), ChungnamBusinessCNT{:,2});
title('충남 업종별 이용건수');

figure(18)
bar(categorical(ChungbukBusinessCNT{:,1}), ChungbukBusinessCNT{:,2});
title('충북 업종별 이용건수');

