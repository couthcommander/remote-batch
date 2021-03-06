args <- commandArgs(TRUE)
if(length(args) != 2) stop('bad input')
a <- as.integer(args[1])
b <- as.integer(args[2])

is_prime <- function(x) {
    if(x %in% c(0,2,3,5,7)) return(TRUE)
    if(x <= 1) return(NA)
    if(x %% 2 == 0) return(FALSE)
    sum((x %% seq(3, floor(sqrt(x)))) == 0) == 0
}

cat(Filter(is_prime, seq.int(a, b)), file = 'prime_numbers.txt')
