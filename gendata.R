n <- 100000
df <- data.frame(id = seq(n))
df[['exposure']] <- sample(0:1, n, replace = TRUE, prob = c(0.9,0.1))
df[['age']] <- sample(16:25, n, replace = TRUE)
df[['race']] <- sample(0:1, n, replace = TRUE, prob = c(0.3,0.7))
df[['gender']] <- sample(0:1, n, replace = TRUE)
xs <- 100
x2 <- max(floor(xs * 0.15), 1)
x3 <- max(floor(xs * 0.05), 1)
x1 <- xs - x2 - x3
for(i in seq(x1)) {
    df[[paste0('x',i)]] <- sample(0:1, n, replace = TRUE, prob = c(0.9,0.1))
}
samp01 <- function(p) sample(0:1, 1, prob = c(p, 1 - p))
for(i in seq(x1 + 1, x1 + x2)) {
    p <- 0.9 - df[['exposure']] * 0.3
    df[[paste0('x',i)]] <- sapply(p, samp01)
}
for(i in seq(x1 + x2 + 1, xs)) {
    p <- 0.9 - df[['exposure']] * 0.6
    df[[paste0('x',i)]] <- sapply(p, samp01)
}

if(n < 10000) {
    save(df, file = 'exp-data-small.Rdata')
} else {
    save(df, file = 'exp-data-big.Rdata')
}
