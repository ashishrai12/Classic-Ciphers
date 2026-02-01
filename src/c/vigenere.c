#include<stdio.h>
#include<ctype.h>
#include<string.h>
int main(int count, string val[])
{
    if(count==2) 
    {
    string key=val[1];
    
    int nk=strlen(key); //Find key length
    int keyi[nk],c=0;
    
    for(int i=0;i<nk;i++) //Loop to convert all lower case to upper case
    {
    if(isalpha(key[i]))
    {
    c=c+1; //Counter used for cheking whether purely alphabetic key
    }
    
    if(islower(key[i]))
    {
    
    key[i]=toupper(key[i]);       
    }
    keyi[i]=key[i]-65; 
    }
    
    while(c==nk) //condition to check alphabetical keys
    {
    string s=GetString(); // Get input from user
    int ns=strlen(s),s1[ns];
    for(int i=0,j=0;i<ns;i++,j++)
    {
        if (j>=nk) // A technique better than mod warping :D
        {
        j=0;
        }
        int h=s[i];
        if(123>h && h>96) //Check if in lowercase
        {
        h=h-97; 
        h=((h+keyi[j])%26);
        s1[i]=h+97;
        }
        else if(91>h && h>64) //Check if in uppercase
        {
        h=h-65;
        h=((h+keyi[j])%26);
        s1[i]=h+65;
        }
        else
        {
        s1[i]=h;
        j=j-1;
        }
            
    }
    for(int i=0;i<ns;i++)
    {
        printf("%c",s1[i]);
    }
    printf("\n"); 
    
    return 0;
    }
    }
    
    {
    printf("Error");
    return 1;
    }
    printf("Error");
    return 1;  //Error
}

