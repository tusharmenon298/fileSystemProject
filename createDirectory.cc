#define _POSIX_SOURCE
#define _POSIX_C_SOURCE 199309L
#include <iostream>
#include <sys/stat.h>
#include <sys/types.h>
#include <cstring>

using namespace std;

//APIs used here- mkdir()
int main(int argc, char* argv[])
{
  //if no argument is given, then
  if(argc == 1){
    cerr<<"No path given. Can't create Directory"<<endl;
    return 1;
  }
  //Loops for all arguments
  for(int i=1;i<argc;i++)
  {
    if((mkdir(argv[i],0777))==-1)
    {
        cerr<<"Error:\t"<<strerror(errno)<<endl;
        return 1;
    }
    else
    {
        cout<<argv[i]<<" has been created"<<endl;
    }
  }


  return 0;
}
