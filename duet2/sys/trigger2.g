if state.status == "paused"
	echo "Resuming print"
	M24 ; resume print
elif {(job.file.fileName == null) & (job.lastFileName != null)}  ; state.status shows as "busy" during the macro 
	echo "Repeat print: ", {job.lastFileName}
	M32 {job.lastFileName}  ; select and print file
else
	echo "Current status: ", {state.status}
	echo "last file: ", {job.lastFileName}
	echo "current file: ", {job.file.fileName}
