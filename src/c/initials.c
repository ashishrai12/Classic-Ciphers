#include<stdio.h>
#include<string.h>
#include<ctype.h>


int main(void)
{
string s=GetString(); //Initialise s and store the string in it
int n=strlen(s);
s[0]=toupper(s[0]);
printf("%c",s[0]);
for(int i=0;i<n;i++)
    {
    if((int)s[i]==32)
    {
        i=i+1;
        s[i]=toupper(s[i]);
        printf("%c",s[i]);
    }
    }
    printf("\n");
    return 0;       
        
}
