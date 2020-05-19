#include <iostream>
#include <cstring>
using namespace std;

//APIs used here-remove()
int main(int argc, char *argv[])
{
    if(argc<2)
    {
        cerr<<"Not enough arguments"<<endl;
        return 1;
    }

    for(int i=1;i<argc;i++)
    {

        if(remove(argv[i]) == -1)
        {
            cerr<<"Error:\t"<<strerror(errno)<<endl;
            return 1;
        }
        else
        {
            cout<<argv[i]<<" deleted successfully"<<endl;
        }
    }




    return 0;
}
