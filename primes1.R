is_prime <- function(x) {
    if(x %in% c(0,2,3,5,7)) return(TRUE)
    if(x <= 1) return(NA)
    if(x %% 2 == 0) return(FALSE)
    sum((x %% seq(3, floor(sqrt(x)))) == 0) == 0
}

Filter(is_prime, seq.int(100))
