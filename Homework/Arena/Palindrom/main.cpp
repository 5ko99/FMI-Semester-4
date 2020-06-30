#include <cstdio>
char s[1000000];
void isPalindrom(){
    int i=0;
    unsigned alf[26];
    for(auto& j : alf)
        j=0;
    char c=s[i];
    while(c!='\0'){
        alf[c-'a']++;
        ++i;
        c=s[i];
    }
    unsigned numberOfOdd=0;
    char pal[1000000];
    pal[i-1]='\0';
    int indexOfOdd=-1;
    for(int j=0;j<26;++j){
        if(alf[j]%2==1){
            ++numberOfOdd;
            indexOfOdd=j;
            //pal[indexOfOdd]=s[indexOfOdd];
            pal[i/2]=(char)('a'+j);
        }
        if(numberOfOdd>1){
            printf("%s","IMPOSSIBLE\n");
            return;
        }
    }
    int beg=0,end=i-1;
//    if(indexOfOdd!=-1){
//        pal[end/2]=(char)('a'+alf[indexOfOdd]);
//    }
    for(int j=0;j<26;++j){
        if(j!=indexOfOdd){
            for(int k=0;k<alf[j]/2;++k){
                pal[beg++]=(char)('a'+j);
                pal[end--]=(char)('a'+j);
            }
        }
    }
    printf("%s \n",pal);
}
int main() {
    scanf("%s\n",s);
    isPalindrom();
    return 0;
}

/*
    abaaba
    pop
    ab
*/