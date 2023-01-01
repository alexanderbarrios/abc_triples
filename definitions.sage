from sage.crypto.util import carmichael_lambda
def vp(n,p):  ## returns the p-adic valuation of a rational number n
	return log(1/Qp(p)(n).abs(),p)
def vps(n):   ## returns the set of exponents occuring in the unique prime factorization of n
	T=n.prime_factors()
	Q=[vp(n,p) for p in T]
	return Q
def cosocle(n): ## returns the cosocle of a positive integer n
	return n/radical(n)
def find_gcd(x, y): ## returns the gcd of numbers x and y
	while(y):
		x, y = y, x % y
	return x
def GCDs(X):  ## returns the gcd of the elements of a subset of the natural numbers. Note that if the set X={a} has one element, then GCDs(X)=a
	if len(X) ==1:
		return X[0]
	else:
		num1 = X[0]
		num2 = X[1]
		G = find_gcd(num1, num2)
		for i in range(2, len(X)):
			G = find_gcd(G, X[i])
		return G
def Quality(a,b):  ## returns the quality of an abc triple (a,b,c)
	a=ZZ(a)
	b=ZZ(b)
	if gcd(a,b)>1:
		return 'triple not relatively prime'
	else:
		return (log(max(abs(a),abs(b),abs(a+b)),10)/log(a.radical()*b.radical()*(a+b).radical(),10)).numerical_approx()
def prod(D,N):  ## For some positive integers d and n, prod(d,n) returns the product of p^v_p(n), where p ranges through the divisors of d
	T=D.prime_factors()
	return product(p^vp(N,p) for p in T)
def cor3_3(n,k):  ## This outputs an abc triple corresponding to Corollary 3.3. Note that if n and k don't satisfy the assumptions of Corollary 3.3, then this outputs 'not applicable'
	t=euler_phi(n)
	d=gcd(n^t-1,t)
	T=d.prime_factors()
	m=product(p^vp(n^t-1,p) for p in T)
	if n>1 and cosocle(m)>radical(n):
		return (1,n^(t*k)-1,n^(t*k))
	else:
		return 'not applicable'
def cor3_4(n,m,k):   ## This outputs an abc triple corresponding to Corollary 3.4. Note that if n, m, and k don't satisfy the assumptions of Corollary 3.4, then this outputs 'not applicable'
	if n>1 and cosocle(m)>radical(n) and gcd(n,m) ==1:
		c=n^(carmichael_lambda(m))
		return (1,c^k-1,c^k)
	else:
		return 'not applicable'
def cor3_5(n,p,k):  ## This outputs an abc triple corresponding to Corollary 3.5. Note that if n, p, and k don't satisfy the assumptions of Corollary 3.5, then this outputs 'not applicable'
	if n>1 and p>radical(n) and is_prime(p):
		c=n^(p*(p-1))
		return (1,c^k-1,c^k)
	else:
		return 'not applicable'
def cor3_6(n,p,k):  ## This outputs an abc triple corresponding to Corollary 3.6. Note that if n, p, and k don't satisfy the assumptions of Corollary 3.6, then this outputs 'not applicable'
	if n>1 and p>radical(n) and is_prime(p):
		op = ZZ(mod(n,p).multiplicative_order())
		c=n^(p*op)
		return (1,c^k-1,c^k)
	else:
		return 'not applicable'
def cor3_7(n,k):  ## This outputs an abc triple corresponding to Corollary 3.7. Note that if n and k don't satisfy the assumptions of Corollary 3.7, then this outputs 'not applicable'
	if is_even(n) and is_squarefree(n):
		return 'not applicable'
	if n==1:
		return 'not applicable'
	else:
		c=n^(n-1)
		return (1,c^k-1,c^k)
def cor3_8(n,k):  ## This outputs an abc triple corresponding to Corollary 3.8. Note that if n and k don't satisfy the assumptions of Corollary 3.8, then this outputs 'not applicable'
	if n>1 and is_even((n+1)*k):
		c=n^(n+1)
		return (1,c^k-1,c^k)
	else:
		return 'not applicable'
def cor3_9(j,k):  ## This outputs an abc triple corresponding to Corollary 3.9. Note that if j and k don't satisfy the assumptions of Corollary 3.9, then this outputs 'not applicable'
	if j>1:
		c=(2^j-1)^2
		return (1,c^k-1,c^k)
	else:
		return 'not applicable'
def cor3_10(n,j,k):  ## This outputs an abc triple corresponding to Corollary 3.10. Note that if n, j, and k don't satisfy the assumptions of Corollary 3.10, then this outputs 'not applicable'
	if n>2 and is_odd(n) and is_even(k):
		c=(n^j-1)^(n)
		return (1,c^k-1,c^k)
	if n>2 and is_even(n):
		c=(n^j-1)^(n)
		return (1,c^k-1,c^k)
	else:
		return 'not applicable'
def cor3_11(n,k):   ## This outputs an abc triple corresponding to Corollary 3.11. Note that if n and k don't satisfy the assumptions of Corollary 3.11, then this outputs 'not applicable'
	if is_even(n) and is_odd(k):
		b=n^(n+1)
		return (1,b^k,b^k + 1)
	else:
		return 'not applicable'
def cor3_12(n,j,k):    ## This outputs an abc triple corresponding to Corollary 3.12. Note that if n, j, and k don't satisfy the assumptions of Corollary 3.12, then this outputs 'not applicable'
	if n>2 and is_odd(n) and is_odd(k):
		b=(n^j-1)^n
		return (1,b^k,b^k + 1)
	else:
		return 'not applicable'
def transfer1(c):   ## Given an abc triple (1,c-1,c), transfer1(c) outputs the abc triple obtained from the first equation in Proposition 4.1
	a,b = 1, c-1
	return (a^3,b^3,c*(b^2-a*b+a^2))
def transfer2(c):    ## Given an abc triple (1,c-1,c), transfer2(c) outputs the abc triple obtained from the second equation in Proposition 4.1
	a,b = 1, c-1
	return (a^2,c*(b-a),b^2)

def den(X,Y,n):    ## This corresponds to the function \delta_{X,Y}(n) that appears in the paper
	A1=[]
	for x in X:
		if x[2]<n+1:
			A1.append(x)
	A2=[]
	for y in Y:
		if y[2]<n+1:
			A2.append(y)
	return numerical_approx(Set(A1).cardinality()/Set(A2).cardinality()*100,digits=3)

def prodcosocle(D):  ## For some positive integer d, prodcosocle(d) returns the product of p^v_p(d), where p ranges through the divisors of cosocle(d)
	T=ZZ(cosocle(D)).prime_factors()
	return product(p^(vp(D,p)) for p in T)