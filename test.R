function (X, AccountCount, AvgOrderSize, CustomerCnt, Row, clusterGroup)
{
data = data.frame(X = X, AccountCount = AccountCount, AvgOrderSize = AvgOrderSize, CustomerCnt = CustomerCnt, Row = Row)
cleanData <- subset(data, select = -c(X))
fit <- kmeans(cleanData, clusterGroup)
aggregate(cleanData, by = list(fit$cluster), FUN = mean)
cleanData <- data.frame(cleanData, fit$cluster)
cleanData <- subset(cleanData, select = c(Row, fit.cluster))
cleanData <- merge(x = data, y = cleanData, by = "Row", all.x = TRUE)
cleanData <- subset(cleanData, select = -c(Row))
return(cleanData)
}
