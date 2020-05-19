
#include <iostream>
#include <dirent.h>
#include <cstring>

using namespace std;

//APIs used here opendir(),readdir(),closedir()
int main(void)
{

    struct dirent *de;
    //opens current directory
    DIR *dr = opendir(".");

    if (dr == NULL)
    {
        cerr<<"Could not open directory"<<endl;
        return 1;
    }

    cout<<"Listing contents in current directory"<<endl;

    while ((de = readdir(dr)) != NULL)
    {
        //if statement checks if element is not a hidden file . & ..
        if(de->d_name[0]!='.')
            cout<<de->d_name<<endl;
    }



    closedir(dr);
    return 0;
}
