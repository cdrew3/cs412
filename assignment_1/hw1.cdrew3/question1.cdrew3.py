def getQuartile(theArray, theQuartile):
	qIndex = int(len(theArray) * theQuartile/4)
	qElement = theArray[qIndex]
	return qElement

def getMedian(theArray):
	theMedian = 0
	midpoint = int(len(theArray)/2)
	if midpoint % 2 == 0:
		theMedian = (theArray[midpoint] + theArray[midpoint+1])/2
	else:
		theMedian = theArray[int(midpoint+.5)]

	return theMedian

def getMean(theArray):
	return sum(theArray)/len(theArray)

def getMode(theArray):
	vals = {}
	theModeValue = -1
	theMode = -1
	for i in theArray:
		if i in vals:
			vals[i] += 1
		else:
			vals[i] = 1
		
		if vals[i] > theModeValue:
			theModeValue = vals[i]
			theMode = i

	return theMode 

def getData(theDataFile):
	theData = []
	f = open(theDataFile, 'r')
	for l in f.readlines():
		theData.append(int(l.rstrip().split('\t')[2]))
	theData.sort()
	return theData

dataFile = "../data/data.online.scores"
finalScores = getData(dataFile)

print("##### ##### 1A ##### #####")
q1 = getQuartile(finalScores, 1)
print("Q1:", q1)

theMedian = getMedian(finalScores)
print("Median:", theMedian)

q3 = getQuartile(finalScores, 3)
print("Q3:", q3)
print("----- -----")

print("##### ##### 1B ##### #####")
theMean = getMean(finalScores)
print(str.format("Mean: {0:.3f}", theMean))
print("----- -----")

print("##### ##### 1C ##### #####")
theMode = getMode(finalScores)
print(str.format("Mode: {0:.3f}", theMode))
print("----- -----")

print("##### ##### 1D ##### #####")
print('''The data is positively skewed.  The is because mean < median < mode.\n87.011 < 89 < 95''')
print("----- -----")

