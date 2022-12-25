## The code below constructs the set C_i = {(1,c-1,c)|(1,c-1,c) is obtained from Corollary 3.i and c<10^18}

C3=[]
for n in (1..10000):
	if cor3_3(n,1)[0] == 1:
		if cor3_3(n,1)[2]<10^18:
			for k in (1..30):
				if cor3_3(n,k)[2]<10^18:
					C3.append(cor3_3(n,k))

C4=[]
for n in (1..10000):
	for m in (1..1000):
		if n>1 and gcd(n,m) ==1 and cosocle(m)>radical(n):
			if cor3_4(n,m,1)[0] == 1:
				if cor3_4(n,m,1)[2]<10^18:
					for k in (1..30):
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
	if cor3_6(n,1)[0] == 1:
		if cor3_6(n,1)[2]<10^18:
			for k in (1..30):
				if cor3_6(n,k)[2]<10^18:
					C6.append(cor3_6(n,k))

C7=[]
for n in (1..10000):
	for k in (1..1000):
		if n>1 and is_even((n+1)*k) and (n+1)*k<100:
			if cor3_7(n,k)[0] == 1:
				if cor3_7(n,k)[2]<10^18:
					C7.append(cor3_7(n,k))

C8=[]
for j in (2..100):
	if cor3_8(j,1)[0] == 1:
		if cor3_8(j,1)[2]<10^18:
			for k in (1..100):
				if cor3_8(j,k)[2]<10^18:
					C8.append(cor3_8(j,k))

C9=[]
for n in (3..1000):
	for j in (1..60):
		if is_even(n) and cor3_9(n,j,1)[2]<10^18:
			for k in (1..80):
				if cor3_9(n,j,k)[2]<10^18:
					C9.append(cor3_9(n,j,k))
		if is_odd(n) and cor3_9(n,j,2)[2]<10^18:
			for k in (2..80):
				if is_even(k) and cor3_9(n,j,k)[2]<10^18:
					C9.append(cor3_9(n,j,k))

C10=[]
for n in (1..1000):
	for k in (1..100):
		if is_even(n) and is_odd(k):
			if cor3_10(n,k)[2]<10^18:
				C10.append(cor3_10(n,k))

C11=[]
for n in (3..70):
	for j in (1..1000):
		if n>2 and is_odd(n):
			if cor3_11(n,j,1)[2]<10^18:
				for k in (1..100):
					if is_odd(k):
						if cor3_11(n,j,k)[2]<10^18:
							C11.append(cor3_11(n,j,k))

C3=sorted(Set(C3))
C4=sorted(Set(C4))
C5=sorted(Set(C5))
C6=sorted(Set(C6))
C7=sorted(Set(C7))
C8=sorted(Set(C8))
C9=sorted(Set(C9))
C10=sorted(Set(C10))
C11=sorted(Set(C11))