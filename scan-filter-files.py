import os

maxFileSize = 3 * 1024 * 1024 # 3MB
filterFileNames = set()
remainingFileSize = 0

for root, dirs, files in os.walk('termux-repositories-legacy/webroot/termux-packages/dists/stable/main'):
    for filename in files:
        size = os.path.getsize(os.path.join(root, filename))
        if maxFileSize <= size:
            filterFileNames.add(filename)
        else:
            remainingFileSize += size

for filename in filterFileNames:
    print(filename)

print(remainingFileSize, "{:.2f}MB".format(remainingFileSize / 1024. / 1024.), "{:.2f}GB".format(remainingFileSize / 1024. / 1024. / 1024.))