## The code below constructs the set D of abc triples in T with the property that an element of D is in C or can be obtained from an abc triple in C after successive applications of Proposition 4.1. Note that the code below constructs a nested chain of sets D_i, which contain C. The sets D_i are obtained by applying Proposition 4.1 and Corollary 2.4 to each element of D_{i-1}

F1=[]
for x in C:
	if transfer1(ZZ(x[2]))[2]<10^18:
		F1.append(transfer1(ZZ(x[2])))
F2=[]
for x in C:
	if transfer2(ZZ(x[2]))[2]<10^18:
		F2.append(transfer2(ZZ(x[2])))
D1=Set(C).union(Set(Set(F1).union(Set(F2))))
D2=[]
for x in D1:
	for k in (1..45):
		c=x[2]
		if c^k < 10^18:
			D2.append((1,c^k-1,c^k))
		b=x[1]
		if b^k+1 < 10^18 and is_odd(k):
			D2.append((1,b^k,b^k+1))
F3=[]
for x in D2:
	if transfer1(ZZ(x[2]))[2]<10^18:
		F3.append(transfer1(ZZ(x[2])))
F4=[]
for x in D2:
	if transfer2(ZZ(x[2]))[2]<10^18:
		F4.append(transfer2(ZZ(x[2])))
D3=Set(D2).union(Set(Set(F3).union(Set(F4))))
D4=[]
for x in D3:
	for k in (1..45):
		c=x[2]
		if c^k < 10^18:
			D4.append((1,c^k-1,c^k))
		b=x[1]
		if b^k+1 < 10^18 and is_odd(k):
			D4.append((1,b^k,b^k+1))
F5=[]
for x in D4:
	if transfer1(ZZ(x[2]))[2]<10^18:
		F5.append(transfer1(ZZ(x[2])))
F6=[]
for x in D4:
	if transfer2(ZZ(x[2]))[2]<10^18:
		F6.append(transfer2(ZZ(x[2])))
D5=Set(D4).union(Set(Set(F5).union(Set(F6))))
D6=[]
for x in D5:
	for k in (1..30):
		c=x[2]
		if c^k < 10^18:
			D6.append((1,c^k-1,c^k))
F7=[]
for x in D6:
	if transfer1(ZZ(x[2]))[2]<10^18:
		F7.append(transfer1(ZZ(x[2])))
F8=[]
for x in D6:
	if transfer2(ZZ(x[2]))[2]<10^18:
		F8.append(transfer2(ZZ(x[2])))
D7=Set(D6).union(Set(Set(F7).union(Set(F8))))
D8=[]
for x in D7:
	for k in (1..45):
		c=x[2]
		if c^k < 10^18:
			D8.append((1,c^k-1,c^k))
		b=x[1]
		if b^k+1 < 10^18 and is_odd(k):
			D8.append((1,b^k,b^k+1))