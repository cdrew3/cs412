
def getVectors(theFile):
	f = open(theFile, 'r')
	lines = f.readlines()
	A = [int(x.rstrip()) for x in lines[1].split('\t')[1:]]
	B = [int(x.rstrip()) for x in lines[2].split('\t')[1:]]

	return A, B

def minkDist(A, B, h):
	innerTotal = 0
	for x in range(len(A)):
		innerTotal += abs(A[x] - B[x])**h
	
	return innerTotal**(1/h)

vectorFile = "data/vectors.txt"
A, B = getVectors(vectorFile)

print("##### ##### 2d1 ##### #####")
h = 2
mDist_2 = minkDist(A, B, h)
print(str.format("Minkowski Distance where h = {0}: {1:.3f}", h, mDist_2))
print("----- -----")

print("##### ##### 2d2 ##### #####")
h = 3
mDist_3 = minkDist(A, B, h)
print(str.format("Minkowski Distance where h = {0}: {1:.3f}", h, mDist_3))
print("----- -----")
