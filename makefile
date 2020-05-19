all: cd dd rd cut copy fileprop rfc rmfile

cd: createDirectory.cc
	g++ createDirectory.cc -o cd

dd: deleteDirectory.cc
	g++ deleteDirectory.cc -o dd

rd: readDirectory.cc
	g++ readDirectory.cc -o rd

cut: cutcmd.cc
	g++ cutcmd.cc -o cut

copy: copycmd.cc
	g++ copycmd.cc -o copy

fileprop: fileprop.cc
	g++ fileprop.cc -o fileprop

rfc: regularFileCreate.cc
	g++ regularFileCreate.cc -o rfc

rmfile: removeFiles.cc
	g++ removeFiles.cc -o rmfile
