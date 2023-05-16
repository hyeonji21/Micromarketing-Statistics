# Chapter3. 데이터분석을 위한 연장챙기기

# 변수 만들기와 변수로 연산하기
## 화살표 기호는 변수에 값을 할당(assignment)
## 화살표(<-) 기호 대신에 =, < <- 를 사용해도 됨.
## 변수명을 생성할 때는 알파벳, 숫자, 마침표(.), undescore(_) 등을 조합하여 만듬
## 모든 이름의 시작은 알파벳 또는 마침표로 함.
## 여러 명령어를 한줄에 입력할 때는 세미콜론(;) 사용
## 주석(comment)은 #를 이용함.

a <- 1
a

b <- 2
b

c <- 3
c

d <- 3.5
d

a+b
a+b+c
4/b
5*b

# c()
var1 <- c(1, 2, 5, 7, 8)
var1

var2 <- c(1:5)
var2

# seq()
var3 <- seq(1, 5)
var3

var4 <- seq(1, 10, by=2)
var4

var5 <- seq(1, 10, by=3)
var5

## 연속값 변수로 연산하기
var1
var1+2
var1
var2
var1+var2

## 문자로 된 변수 만들기
str1 <- "a"
str1

str2 <- "text"
str2

str3 <- "Hello World!"
str3

str4 <- c("a", "b", "c")
str4

str5 <- c("Hello!", "World", "is", "good!")
str5

# error) str1+2


# 함수꾸러미, 패키지(package -> function, data set) 이해하기
## 패키지
## 함수가 여러 개 들어 있는 꾸러미 
## 하나의 패키지 안에 다양한 함수가 들어있음
## 함수를 사용하려면 패키지 설치를 먼저 해야함 (install)
## 패키지를 로드(load)하는 작업은 R 스튜디오를 새로 시작할때마다 반복해야함.

## 패키지 설치하기 -> 패키지 로드하기 -> 함수 사용하기

## 설치할때는 패키지 이름의 앞뒤에 반드시 따옴표를 넣어야 함.
## 패지지는 서버에서 다운로드 하기 때문에 인터넷에 접속이 되어 있어야 함.
## 설치가 완료되면, R에서 함수를 사용할 수 있도록 패키지를 로드(load) 해야 함.
## 패키지를 로드하고 난 후에, 패키지에 들어 있는 다양한 함수를 이용할 수 있음.

# ggplot2 패키지 설치하기,로드하기
install.packages("ggplot2")
library(ggplot2)

# 함수 사용하기
# 여러 문자로 구성된 변수 생성
x <- c("a", "a", "b", "c")
x

# 빈도 그래프 출력
qplot(x)



# Chapter4. 데이터프레임의 세계로

## 데이터프레임(data frame) : 가장 많이 사용하는 데이터 형태
## 행(관측치 - 개체의 정보)과 열(변수)로 구성된 사각형 모양
# 개체 => 사람, 사물, 국가, 지역, 세대 등 다양할 수 있다.

# 한 개체에 대한 데이터는 가로 한줄에 나열
# "데이터가 크다"는 것은 행이 많거나 혹은 열이 많거나.

## 4.2 데이터 프레임 만들기

english <- c(90, 80, 60, 70) # 영어 점수 변수 생성
english

math <- c(50, 60, 100, 20) # 수학 점수 변수 생성
math 

(m <- c(5, 6, 10, 2))

# english, math로 데이터 프레임 생성해서 df_midterm에 할당
df_midterm <- data.frame(english, math)
df_midterm


class <- c(1, 1, 2, 2)
class

df_midterm <- data.frame(english, math, class)
df_midterm
 
mean(df_midterm$english) # df_midterm의 english로 평균 산출

mean(df_midterm$math) # df_midterm의 math로 평균 산출

df_midterm <- data.frame(english=c(90, 80, 60, 70),
                         math=c(50, 60, 100, 20),
                         class=c(1, 1, 2, 2))
df_midterm

abc <- data.frame(aa=c(1, 2, 3), bb=c(2, 4, 7))

mean(aa) #error
mean(abc$aa)
mean(bb) #error

## 4.3 외부데이터 이용하기

# 1) 엑셀파일 불러오기
#   1. 프로젝트 폴더에 엑셀 파일 삽입하기
#   2. readxl패키지 설치하고 로드하기


install.packages("readxl")
library(readxl)
df_exam <- read_excel("excel_exam.xlsx")
# df_exam <- read_excel("c:/../excel_exam.xlsx") => 직접 경로 지정
df_exam

#   3. 분석하기
mean(df_exam$english)
mean(df_exam$science)

## 엑셀파일 첫번째 행이 변수명이 아니라면?
df_exam_novar <- read_excel("excel_exam_novar.xlsx", col_names=F)
df_exam_novar

## 엑셀파일에 시트가 여러 개가 있다면?
df_exam_sheet <- read_excel("excel_exam_sheet.xlsx", sheet=3)
df_exam_sheet


# 2) csv파일 불러오기
# - 범용 데이터 형식
# - 값 사이를 쉼표(,)로 구분
# - 용량 작음, 다양한 소프트웨어에서 사용

df_csv_exam <- read.csv("csv_exam.csv")
df_csv_exam

## 문자가 들어 있는 파일을 불러올때는 stringAsFactors=F()
## 문자를 factor로 보지 말라는 것.
## 암기
df_csv_exam <- read.csv("csv_exam.csv", stringsAsFactors = F)


# 3) 데이터 프레임을 csv파일로 저장

df_midterm <- data.frame(english = c(90, 80, 60, 70),
                         math = c(50, 60, 100, 20),
                         class = c(1, 1, 2, 2))
df_midterm

## 암기
write.csv(df_midterm, file = "df_midterm.csv")
getwd()



# Chapter15. R 내장 함수, 변수 타입과 데이터 구조

## 변수
##  1) 연속변수 - numeric
##  2) 범주변수 - factor

## 15.2 변수 타입


var1 <- c(1, 2, 3, 1, 2)  # numeric 변수 생성
var2 <- factor(c(1, 2, 3, 1, 2))  # factor 변수 생성

var1  # numeric 변수 출력 
var2  # factor 변수 출력
 
var1+2  # numeric 변수로 연산
var2+2  # factor 변수로 연산

# 변수타입 알아보기

class(var1)
class(var2)

levels(var1)
levels(var2)

var3 <- c("a", "b", "b", "c")
var4 <- factor(c("a", "b", "b", "c"))

var3
var4

class(var3)
class(var4)

mean(var1)
mean(var2)

var2 <- as.numeric(var2)
mean(var2)

class(var2)
levels(var2)

# 추가 ++) -----------------------

a1 <- 1
class(a1)

b1 <- 1L
class(b1)

b2 <- 23L
class(b2)

c1 <- 3+2i
class(c1)

d1 <- "maale"
class(d1)

d2 <- "%FEMAL#"
class(d2)

d3 <- "123"
class(d3)

e1 <- TRUE
class(e1)

e2 <- FALSE
class(e2)

e3 <- T
class(e3)

e4 <- F
class(e4)

e5 <- t
class(e5)

e6 <- f
class(e6)

f1 <- factor(c(1, 2, 3, 1, 3))
f1
class(f1)
levels(f1)

f2 <- factor(c(A, B, B, A, B))
f2
class(f2)
levels(f2)

f3 <- factor(c("A", "B", "B", "A", "B"))
f3
class(f3)
levels(f3)

## 15.3 데이터 구조
## 1) 변수

# 벡터 만들기
a <- 1
a
b <- "hello"
b

# 데이터 구조 확인
class(a)
class(b)

## 2) 데이터프레임

# 데이터 프레임 만들기
x1 <- data.frame(var1 = c(1, 2, 3),
                 var2 = c("a", "b", "c"))
x1

# 데이터 구조 확인
class(x1)

## 3) 행렬

# 매트릭스 만들기 - 1~12로 2열
x2 <- matrix(c(1:12), ncol=2)
x2

# 데이터 구조 확인
class(x2)

## 4) array

# array 만들기 - 1~20으로 2행 x 5열 x 2차원
x3 <- array(1:20, dim=c(2, 5, 2))
x3

## 5) 리스트

# 리스트 생성 - 앞에서 생성한 데이터 구조 활용
x4 <- list(f1 = a,
           f2 = x1,
           f3 = x2,
           f4 = x3)
x4

# 데이터 구조 확인
class(x4)


mpg <- ggplot2::mpg
x <- boxplot(mpg$cty)
x

x$stats[,1]     # 요약 통계량 추출
x$stats[,1][3]  # 중앙값 추출
x$stats[,1][2]  # 1분위수 추출


# +추가)

c(1, 2, 3, 4) + c(1, 2)

(1:10) ^ c(1, 2)

2 + c(1, 2, 3)

2 * c(1, 2, 3)

(1:10) ^ 2

c(1, 2, 3) + c(1, 2)



