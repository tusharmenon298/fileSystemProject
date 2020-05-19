#define _POSIX_SOURCE
#define _POSIX_C_SOURCE 199309L
#include<unistd.h>
#include<stdio.h>
#include<iostream>
#include<fcntl.h>
using namespace std;
int main(int argc, char *argv[])
{
    int d1,d2,n;
    char buffer[200];
    if(argc>3){
        cerr<<"Too many arguments"<<endl;
        return 1;
    }
    if(argc<3){
        cerr<<"Not enough argument"<<endl;
        return 1;
    }
    d1=open(argv[1],O_RDONLY);
    if(d1==-1)
    {
        cerr<<argv[1]<<" doesn't exist"<<endl;
    }
    else
    {
        d2=open(argv[2],O_RDWR|O_CREAT,0777);
        while((n=read(d1,buffer,200))>0)
        {
            write(d2,buffer,n);
        }
        cout<<argv[1]<<" has been copied to "<<argv[2]<<endl;
    }
    close(d1);
    close(d2);
    return(0);
}
