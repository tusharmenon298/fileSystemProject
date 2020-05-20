#define _POSIX_SOURCE
#define _POSIX_C_SOURCE 199309L
#include<unistd.h>
#include<sys/stat.h>
#include<stdio.h>
#include<iostream>
#include<fcntl.h>
#include<pwd.h>
#include<grp.h>
#include<ctime>
using namespace std;

//APIs used stat
int main(int argc, char *argv[])
{
    struct stat s;
    cout<<endl<<"File path=\t\t"<<argv[1]<<endl;
    if(stat(argv[1],&s)==0)
    {
        mode_t fp=s.st_mode;
        //For File Permissions
        cout<<"File Permissions=\t";
        if(fp & R_OK)
            cout<<"r ";
        if(fp & W_OK)
            cout<<"w ";
        if(fp & X_OK)
            cout<<"x ";
        cout<<endl;
        //For File User and Groups
        struct passwd *p=getpwuid(s.st_uid);
        struct group *g=getgrgid(s.st_gid);
        cout<<"User name=\t\t"<<p->pw_name<<endl;
        cout<<"User id=\t\t"<<s.st_uid<<endl;
        cout<<"Group name=\t\t"<<g->gr_name<<endl;
        cout<<"Group id is\t\t"<<s.st_gid<<endl;
        //Find file type and if regular file
        cout<<"File Type=\t\t";
        if(S_ISREG(fp))
            cout<<"Regular file "<<endl;
        else if(S_ISDIR(fp))
            cout<<"Directory "<<endl;
        else if(S_ISCHR(fp))
            cout<<"Character Special file "<<endl;
        else if(S_ISBLK(fp))
            cout<<"Block Special file "<<endl;
        else if(S_ISFIFO(fp))
            cout<<"Pipe or FIFO "<<endl;
        else if(S_ISLNK(fp))
            cout<<"Symbolic Link "<<endl;
        else if(S_ISSOCK(fp))
            cout<<"Socket "<<endl;
        else
            cout<<"Can't determine "<<endl;

        //Print size
        cout<<"File Size=\t\t"<<s.st_size<<" bytes"<<endl;
        struct tm dt;
        //Creation time
        dt = *(gmtime(&s.st_ctime));
        cout<<"Creation time\t\t"<<dt.tm_mday<<"/"<<dt.tm_mon<<"/"<<dt.tm_year + 1900<<" "<<dt.tm_hour<<":"<<dt.tm_min<<":"<<dt.tm_sec<<endl;
        //Modification time
        dt = *(gmtime(&s.st_mtime));
        cout<<"Modification time\t"<<dt.tm_mday<<"/"<<dt.tm_mon<<"/"<<dt.tm_year + 1900<<" "<<dt.tm_hour<<":"<<dt.tm_min<<":"<<dt.tm_sec<<endl;
    }
    else
        cerr<<"Unable to locate file"<<endl<<"Check if file exists or the path is right"<<endl;
    return 0;
}
