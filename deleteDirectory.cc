#define _POSIX_SOURCE
#define _POSIX_C_SOURCE 199309L
#include <iostream>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#include <cstring>

using namespace std;

int main(int argc, char* argv[])
{
  //If no argument is given
  if(argc == 1){
    cerr<<"No arguments given. Nothing to delete"<<endl;
    return 1;
  }
  //loops through all arguments
  for(int i=1;i<argc;i++)
  {
    if(( rmdir(argv[i]))!=0)
    {
        cerr<<"Error:\t"<<strerror(errno)<<endl;
        return 1;
    }
    else
    {
        cout<<argv[i]<<" has been deleted"<<endl;
    }
  }


  return 0;
}
