## The code below constructs the set C_i = {(1,c-1,c)|(1,c-1,c) is obtained from Corollary 3.i and c<10^18}

C3=[]
for n in (1..10000):
	if cor3_3(n,1)[0] == 1:
		if cor3_3(n,1)[2]<10^18:
			for k in (1..30):
				if cor3_3(n,k)[2]<10^18:
					C3.append(cor3_3(n,k))

C4=[]
for m in (1..1000000):
	if carmichael_lambda(m)<60:
		for n in (1..1000):
			if n>1 and gcd(n,m) ==1 and cosocle(m)>radical(n) and n^carmichael_lambda(m)<10^18:
				if cor3_4(n,m,1)[0] == 1:
					if cor3_4(n,m,1)[2]<10^18:
						for k in (1..30):
							if cor3_4(n,m,k)[2]<10^18:
								C4.append(cor3_4(n,m,k))
## It remains to consider those n>1000 for which n^carmichael_lambda(m) < 10^18.
## In particular, carmichael_lambda(m) < 6
## 240 is the largest positive integer m for which carmichael_lambda(m)<6
## We now consider the set of (p,m) where p is a prime < 240 and m is the largest positive integer for which p^m<10^18
for n in (2..240):
	if n.is_prime():
		for m in (2..60):
			if n^m < 10^18 and n^(m+1)>10^18:
				P.append([n,m])
## Next, we construct the set of all n<10^18 for which radical(n)<240
P1=[]
for x in P:
	y=divisors(x[0]^x[1])
	n=len(y)
	for m in (0..n-1):
		P1.append(y[m])
P2=[]
for n in P1:
	for m in P1:
		if n*m != 1 and n*m<10^18 and radical(n*m) < 240:
			P2.append(n*m)
## The code below concludes the construction of C4. In particular, all abc triples (1,c-1,c) arising from Corollary 3.4 with c<10^18 are in C4
for m in (1..300):
	if carmichael_lambda(m)<6:
		for n in P2:
			if n>1 and gcd(n,m) ==1 and cosocle(m)>radical(n) and n^carmichael_lambda(m)<10^18:
				if cor3_4(n,m,1)[0] == 1:
					if cor3_4(n,m,1)[2]<10^18:
						for k in (1..6):
							if cor3_4(n,m,k)[2]<10^18:
								C4.append(cor3_4(n,m,k))

C5=[]
for n in (1..10000):
	for p in (2..50):
		if n>1 and p>radical(n) and is_prime(p):
			if cor3_5(n,p,1)[0] == 1:
				if cor3_5(n,p,1)[2]<10^18:
					for k in (1..30):
						if cor3_5(n,p,k)[2]<10^18:
							C5.append(cor3_5(n,p,k))

C6=[]
for n in (1..10000):
	for p in (2..75):
		if n>1 and p>radical(n) and is_prime(p):
			if cor3_6(n,p,1)[0] == 1:
				if cor3_6(n,p,1)[2]<10^18:
					for k in (1..40):
						if cor3_6(n,p,k)[2]<10^18:
							C6.append(cor3_6(n,p,k))

C7=[]
for n in (1..1000):
	if cor3_7(n,1)[0] == 1:
		if cor3_7(n,1)[2]<10^18:
			for k in (1..30):
				if cor3_7(n,k)[2]<10^18:
					C7.append(cor3_7(n,k))

C8=[]
for n in (1..1000):
	for k in (1..100):
		if n>1 and is_even((n+1)*k) and (n+1)*k<100:
			if cor3_8(n,k)[0] == 1:
				if cor3_8(n,k)[2]<10^18:
					C8.append(cor3_8(n,k))

C9=[]
for j in (2..100):
	if cor3_9(j,1)[0] == 1:
		if cor3_9(j,1)[2]<10^18:
			for k in (1..100):
				if cor3_9(j,k)[2]<10^18:
					C9.append(cor3_9(j,k))

C10=[]
for n in (3..1000):
	for j in (1..60):
		if is_even(n) and cor3_10(n,j,1)[2]<10^18:
			for k in (1..80):
				if cor3_10(n,j,k)[2]<10^18:
					C10.append(cor3_10(n,j,k))
		if is_odd(n) and cor3_10(n,j,2)[2]<10^18:
			for k in (2..80):
				if is_even(k) and cor3_10(n,j,k)[2]<10^18:
					C10.append(cor3_10(n,j,k))

C11=[]
for n in (1..1000):
	for k in (1..100):
		if is_even(n) and is_odd(k):
			if cor3_11(n,k)[2]<10^18:
				C11.append(cor3_11(n,k))

C12=[]
for n in (3..70):
	for j in (1..1000):
		if n>2 and is_odd(n):
			if cor3_12(n,j,1)[2]<10^18:
				for k in (1..100):
					if is_odd(k):
						if cor3_12(n,j,k)[2]<10^18:
							C12.append(cor3_12(n,j,k))

C3=sorted(Set(C3))
C4=sorted(Set(C4))
C5=sorted(Set(C5))
C6=sorted(Set(C6))
C7=sorted(Set(C7))
C8=sorted(Set(C8))
C9=sorted(Set(C9))
C10=sorted(Set(C10))
C11=sorted(Set(C11))
C12=sorted(Set(C12))