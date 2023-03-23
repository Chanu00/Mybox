
library(ggplot2)
library(dplyr)

#dim : 데이터가 몇 행, 몇 열로 구성되어있는지, dimension
#View : 대략적으로 데이터를 보여준다.
#str : 속성 파악하기
#summary : 요약 통계량 산출하기

#print(str(mpg))
#print(summary(head(mpg, 10)))

#가공할 수 있는 raw data 뽑기
mpg_raw <- as.data.frame(ggplot2::mpg)
mpg_new <- mpg_raw
print(head(mpg_new, 20))

# 변수명 수정 
mpg_new <- rename(mpg_new, highway = hwy, city = cty)
print(head(mpg_new, 15))

#파생변수 만들기
mpg_new$total <- (mpg_new$city + mpg_new$highway) / 2
print(head(mpg_new, 10))
print(mean(mpg_new$total))

#조건문을 통한 파생변수
mpg_new$test <- ifelse(mpg_new$total >= 20, "pass", "fail")
print(mpg_new$test)
print(table(mpg_new$test))
#barplot(table(mpg_new$test), col = c("red", "purple"))
#hist(mpg_new$total) , hist의 경우 비율별 막대그래프를 보여준다.

# 데이터 전처리(data processing) - 원하는 형태로 가공하기
#Dplyr 함수로 보통 가공을 진행 

#filter() : 열을 추출
# & 과 | 를 통하여 중복 조건을 붙힐 수 있다.
print(head(mpg_new %>% filter(test == "pass"), 10))
print(head(mpg_new %>% filter(total < 20 & class == "suv")))
