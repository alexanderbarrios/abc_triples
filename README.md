# Code for abc triples of the form (1,c-1,c)
This repository contains the code that verifies some of the results of the paper *abc triples of the form (1,c-1,c)* by Elise Alvarez-Salazar, Alexander J. Barrios, Calvin Henaku, and Summer Soller.


This code was written on SageMath, and the repository consists of  files:

(1) definitions.sage

(2) construction_of_C.sage

(3) construction_of_D.sage

(4) section4.ipynb

(5) triples_for_thm1.csv

(6) triples_for_thm2.csv

Files (1), (2), and (3) contain the definitions that are called in (4)

File (4) provides the computations that are referenced in Section 4 of *abc triples of the form (1,c-1,c)*. We note, that file (4) makes reference to the file triples_below_1018.csv. This file can be downloaded through Bart de Smit's webpage: https://www.math.leidenuniv.nl/~desmit/abc/abctriples_below_1018.gz

File (5) contains the abc triples of the form (1,n^l-1,n^l) for some integer l>1 and n^l<10^18. The spreadsheet provides the value of n and l, as well as the least divisor m of n^l-1 for which cosocle(n^l-1)>rad(n). The quality of the abc triple is also given.

File (6) contains the abc triples of the form (1,n^l,n^l+1) for some odd integer l>1 and n^l+1<10^18. The spreadsheet provides the value of n and l, as well as the least divisor m of n^l+1 for which cosocle(n^l+1)>rad(n). The quality of the abc triple is also given.
