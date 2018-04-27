#!/bin/bash
Rscript primes2.R 1 100000 2> errors.txt 1> primes.txt &
Rscript primes2.R 100001 200000 2>> errors.txt 1>> primes.txt &
Rscript primes2.R 200001 300000 2>> errors.txt 1>> primes.txt &
Rscript primes2.R 300001 400000 2>> errors.txt 1>> primes.txt &
Rscript primes2.R 400001 500000 2>> errors.txt 1>> primes.txt &
