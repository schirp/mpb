charFilter <- function(userchar, realworld) {
  # Left merge default and realworld dataframe
  mergedData <- left_join(userchar, realworld, by = c("character"))
  # if the word contains 2 characters.
  # then we calculate its MPMI(Modified Point Mutual Infomation)
  # else
  if (length(strsplit(as.character(userchar$character[1]),"")[[1]]) == 2) {
    mergedData <- mergedData[complete.cases(mergedData), ]
    mergedData$log <- with(mergedData, test_log/real_log)
    mergedData <- mergedData[c("character", "log")]
    mergedData <- mergedData[order(mergedData$log, decreasing = T),]
  }
  rownames(mergedData) <- NULL
  return(mergedData)
}
