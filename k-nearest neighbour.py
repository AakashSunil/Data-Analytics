import csv
import random
import math
import operator 

def loadDataset(filename, split, trainingSet=[] , testSet=[]):
	with open(filename, 'r') as csvfile:
	    lines = csv.reader(csvfile)
	    dataset = list(lines)
	    for x in range(len(dataset)-1):
	        for y in range(4):
	            dataset[x][y] = float(dataset[x][y])
	        if random.random() < split:
	            trainingSet.append(dataset[x])
	        else:
	            testSet.append(dataset[x])

'''def euclideanDistance(instance1, instance2, length):
	distance = 0
	for x in range(length):
		distance += pow((instance1[x] - instance2[x]), 2)
	return math.sqrt(distance)'''

def manhattanDistance(instance1, instance2, length):
        distance = 0
        for x in range(length):
            distance += abs(instance1[x]-instance2[x])
        return distance
    
'''def getNeighborsED(trainingSet, testDataset, k):
	distances = []
	length = len(testDataset)-1
	for x in range(len(trainingSet)):
		dist = euclideanDistance(testDataset, trainingSet[x], length)
		distances.append((trainingSet[x], dist))
	distances.sort(key=operator.itemgetter(1))
	neighbors = []
	for x in range(k):
		neighbors.append(distances[x][0])
	return neighbors'''

def getNeighborsMD(trainingSet, testDataset, k):
	distances = []
	length = len(testDataset)-1
	for x in range(len(trainingSet)):
		dist = manhattanDistance(testDataset, trainingSet[x], length)
		distances.append((trainingSet[x], dist))
	distances.sort(key=operator.itemgetter(1))
	neighbors = []
	for x in range(k):
		neighbors.append(distances[x][0])
	return neighbors

'''def getClassED(neighbors):
	classVotes = {}
	for x in range(len(neighbors)):
		neighbor = neighbors[x][-1]
		if neighbor in classVotes:
			classVotes[neighbor] += 1
		else:
			classVotes[neighbor] = 1
	sortedVotes = sorted(classVotes.items(), key=operator.itemgetter(1), reverse=True)
	return sortedVotes[0][0]'''

def getClassMD(neighbors):
	classVotes = {}
	for x in range(len(neighbors)):
		neighbor = neighbors[x][-1]
		if neighbor in classVotes:
			classVotes[neighbor] += 1
		else:
			classVotes[neighbor] = 1
	sortedVotes = sorted(classVotes.items(), key=operator.itemgetter(1), reverse=True)
	return sortedVotes[0][0]

'''def getAccuracyED(testSet, predictions):
	correct = 0
	for x in range(len(testSet)):
		if testSet[x][-1] == predictions[x]:
			correct += 1
	return (correct/float(len(testSet))) * 100.0'''

def getAccuracyMD(testSet, predictions):
	correct = 0
	for x in range(len(testSet)):
		if testSet[x][-1] == predictions[x]:
			correct += 1
	return (correct/float(len(testSet))) * 100.0

def main():
	# prepare data
	trainingSet=[]
	testSet=[]
	split = 0.66
	loadDataset('iris.csv', 0.66, trainingSet, testSet)
	print ('Train set: ' , (len(trainingSet)))
	print ('Test set: ' , (len(testSet)))
	# generate predictions
	'''predictionsED=[]'''
	predictionsMD=[]
	k = 4
	for x in range(len(testSet)):
		'''neighborsED = getNeighborsED(trainingSet, testSet[x], k)'''
		neighborsMD = getNeighborsMD(trainingSet, testSet[x], k)
		'''resultED = getClassED(neighborsED)'''
		resultMD = getClassMD(neighborsMD)
		'''predictionsED.append(resultED)'''
		predictionsMD.append(resultMD)
		'''if resultED == testSet[x][-1]:
			print('E> predicted=' + repr(resultED) + ', actual=' + repr(testSet[x][-1]))
		else:
                        print('E> predicted=' + repr(resultED) + ', actual=' + repr(testSet[x][-1])+"Wrong classification")'''
		if resultMD == testSet[x][-1]:
			print('M> predicted=' + repr(resultMD) + ', actual=' + repr(testSet[x][-1]))
		else:
			print('M> predicted=' + repr(resultMD) + ', actual=' + repr(testSet[x][-1])+"Wrong classification")
	'''accuracyED = getAccuracyED(testSet, predictionsED)
	print('AccuracyED: '+repr(accuracyED) + '%')'''
	accuracyMD = getAccuracyMD(testSet, predictionsMD)
	print('AccuracyMD: '+repr(accuracyMD) + '%')

main()
