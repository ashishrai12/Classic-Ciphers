#include<stdio.h>
#include<ctype.h>
#include<string.h>
int main(int count, string val[])
{
    if(count==2) //Check whether or not only one non negative command line arguement is given
    {
    int k=atoi(val[1]);
    string s=GetString();
    if(s!=NULL) // avoid garbage values
    {
    
    int n=strlen(s);
    int s1[n];
    
    for(int i=0;i<n;i++)
    {
        int h=s[i];
        if(123>h && h>96) //Check if in lowercase
        {
        h=h-97;       
        h=((h+k)%26);
        s1[i]=h+97;
        }
        else if(91>h && h>64) //Check if in uppercase
        {
        h=h-65;
        h=((h+k)%26);
        s1[i]=h+65;
        }
        else
        {
        s1[i]=h;
        }
    } 
      
    for(int i=0;i<n;i++)
    {
        printf("%c",s1[i]);
    }
    printf("\n");
    return 0;
    }
    }
    else
    printf("Error");
    return 1; // 1 for error
}

