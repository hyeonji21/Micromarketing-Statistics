# 표 2.7

rows.to.missing <- sample(row.names(housing.df), 10)
housing.df[rows.to.missing,]$BEDROOMS <- NA
summary(housing.df$BEDROOMS)

# 결측치 대치
housing.df[rows.to.missing,]$BEDROOMS <- median(housing.df$BEDROOMS, na.rm=TRUE)

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
median(c, na.rm=T) 


# 표 2.9










