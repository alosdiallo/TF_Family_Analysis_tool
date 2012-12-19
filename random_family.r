args   <- commandArgs(TRUE);
a <- scan(args[1]);
b <- scan(args[2]);
result <- sample(a, b, replace=F)
write.table(result, file="result.txt",sep = " \t",col.names = F, row.names = F)
#cat(format(result))