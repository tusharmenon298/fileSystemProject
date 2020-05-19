all: cd dd rd cut copy fileprop 

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
