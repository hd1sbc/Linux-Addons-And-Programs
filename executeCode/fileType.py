import sys
fileName = sys.argv[1]
isPeriod = 0
fileType = ""
for c in fileName:
	if(isPeriod == 1):
		fileType += c
	if(c == '.'):
		isPeriod = 1
print(fileType)
