import os, sys
#md5hash recovery folder to create a file to compare with current non encrypted file hashes text file currentmd5.txt
print "Generating MD5hash values now..."
md5dir = 'md5deep /root/recoveredfiles/* > recoveredfilesmd5.txt'
os.system(md5dir)
print "MD5 hash values finished, output file recoveredfilesmd5.txt"
for line in open( "recoveredfilesmd5.txt", "r" ).readlines():
	value = line[:32]
	fullvalue = line
	for line in open( "currentmd5.txt", "r" ).readlines():
		value2 = line[:32]
		fullvalue2 = line
		if value2 == value:
			filerm = fullvalue[32:]
			print "Removing found duplicate file "+ filerm
			cmd = 'rm'+filerm
			os.system(cmd)
