#define _POSIX_SOURCE
#define _POSIX_C_SOURCE 199309L
#include<unistd.h>
#include<stdio.h>
#include<iostream>
#include<fcntl.h>
#include <cstring>
using namespace std;

//APIs used here-open(),close()
int main(int argc, char *argv[])
{
    int d ,n;
    char buffer[200];
    if(argc<2)
    {
        cerr<<"There are no argument"<<endl;
        return 1;
    }
    for(int i=1;i<argc;i++)
    {
        d=open(argv[i],O_CREAT,0777);
        if(d==-1)
        {
            cerr<<"Error:\t"<<strerror(errno)<<endl;
        }
        else
        {
            cout<<argv[i]<<" has been created"<<endl;
        }
        close(d);
    }
    return(0);
}
