## 표 2.3
## p.44

housing.df <- read.csv("WestRoxbury.csv", header=TRUE)
class(housing.df)
dim(housing.df)
head(housing.df)
View(housing.df)

housing.df[1:10, 1]
housing.df[1:10, ]
housing.df[5, 1:10]
housing.df[5, c(1:2, 4, 8:10)]
housing.df[, 1]
housing.df$TOTAL.VALUE
housing.df$TOTAL.VALUE[1:10]
length(housing.df$TOTAL.VALUE)
mean(housing.df$TOTAL.VALUE)
summary(housing.df)



row.names(housing.df) 
# 관측치를 숫자로 나열

help(row.names)

x <- c(1, 3, 5, 9, 10, -2)

xx <- sample(x, 3)  # x에서 3개를 랜덤하게 뽑는다.
xx

s <- sample(row.names(housing.df), 5) 
# housing.df에서 5개의 행 숫자를 랜덤하게 sampling 함
s

housing.df[s, ] 
# 랜덤하게 추출된 5개 행의 데이터를 추출함.


# ex) housing.df[3, ] : 3번째 관측치를 출력하는 것.
#             [행, 열]


## 표 2.5

names(housing.df) # housing.df의 변수 알아보기
# name(housing.df) : error

t(t(names(housing.df)))

colnames(housing.df)[1] <- c("TOTAL_VALUE") 
# 첫번째 칼럼의 이름을 바꿔라.
# " " -> 문자형이기 때문에 붙임.

names(housing.df) # 이름 바뀐 것 확인.

# colnames(housing.df)[1] <- "TOTAL_VALUE" 
# 이것도 가능


housing.df$REMODEL # REMODEL 값 확인

class(housing.df$REMODEL) 
class(housing.df[, 14]) # same.

housing.df$REM1 <- as.factor(housing.df$REMODEL) 
# factor 형을 바꿔라. (REM1인 새로운 변수를 만드면서)


# housing.df$REMODEL <- as.factor(housing.df$REMODEL)
# 만약에 이렇게 한다면 REMODEL을 덮어 씌우는 것 (factor로 바뀜)


class(housing.df$REM1)
levels(housing.df$REM1) # levels 확인


class(housing.df$BEDROOMS) # 정수형

class(housing.df[,1]) # 실수형


## 표 2.7

rows.to.missing <- sample(row.names(housing.df), 10)
# housing.df에서 10개의 관측치 숫자를 랜덤하게 sampling 함
# (숫자가 10개 들어가있음.)
rows.to.missing

housing.df[rows.to.missing, ]$BEDROOMS <- NA

summary(housing.df$BEDROOMS)

# inputation : 대체 
housing.df[rows.to.missing, ]$BEDROOMS <- median(housing.df$BEDROOMS, na.rm=TRUE)

summary(housing.df$BEDROOMS)

a <- c(2, 5, 9, 10, 3)
sort(a)
median(a)

a2 <- c(2, 5, 9, 10, 3, 50)
sort(a2)
median(a2)

b <- c(2, 5, 9, 10, 3, NA)
median(b)

c <- c(2, 5, 9, 10, 3, NA)
median(c, na.rm=T)  # missing -> remove 해라

## 표 2.9

set.seed(1)

# training (60%) / validation (40%)
# randomly

dim(housing.df)
dim(housing.df)[1] # 첫 번째 위치
dim(housing.df)[2]

a <- c(1:10)

set.seed(1)  # 랜덤 -> sample 고정
b <- sample(a, 3)
b

train.rows <- sample(rownames(housing.df), dim(housing.df)[1]*0.6)
train.rows

train.data <- housing.df[train.rows, ]

# setdiff 함수 : 집합의 차집합 (a, b 집합)
valid.rows <- setdiff(rownames(housing.df), train.rows)
valid.rows # 행 모으기

valid.data <- housing.df[valid.rows, ]


help(setdiff)
x <- c(sort(sample(1:20, 9)), NA)
x
y <- c(sort(sample(3:23, 7)), NA)
y
setdiff(x, y) # 차집합 (x에서 y 값을 뺀 것)


# training 50% , validation 30%, test 20%
train.rows <- sample(rownames(housing.df), dim(housing.df)[1]*0.5)

# rownames(housing.df)에서 train.rows를 뺀 다음 -> 여기서 30프로를 랜덤하게 뽑는다.
valid.rows <- sample( setdiff(rownames(housing.df), train.rows),
                      dim(housing.df)[1]*0.3 )

# rownames(housing.df)에서 train.rows, valid.rows를 합한것을 뺀다.
test.rows <- setdiff(rownames(housing.df), union(train.rows, valid.rows))
test.rows  # 행의 번호들 


# 데이터 프레임 만들기
train.data <- housing.df[train.rows, ]
valid.data <- housing.df[valid.rows, ]
test.data <- housing.df[test.rows, ]
  


