#include<iostream>
#include<vector>
#include<algorithm>
#include<cstring>
using namespace std;
#define MOD 1000000007

//ww-uu m-nn
char word[300000];
long long dp[300000],n;
bool u[300000];

void init(){
    scanf("%s",&word);
    n=strlen(word);
}

void solve(){
    if(word[0]!='w'&&word[0]!='m'){
        dp[0]=1;
    }else{
        cout<<0<<endl;
        exit(0);
    }
    long long uPow=2,nPow=2;
    for(int i=1;i<n;++i){
        if(word[i]=='w'||word[i]=='m'){
            cout<<0<<endl;
            exit(0);
        }
        if(word[i]=='n'){
            if(word[i-1]=='n'){
                if(!u[i-1]){
                    dp[i]=(dp[i-1]*nPow)%MOD;
                }
                else 
                    dp[i]=(dp[i-1]+1)%MOD;
                nPow*=2;
                u[i]=true;
                continue;
            }
        }
        if(word[i]=='u'){
            if(word[i-1]=='u'){
                if(!u[i-1]){
                    dp[i]=(dp[i-1]*uPow)%MOD;
                }
                else
                    dp[i]=(dp[i-1]+1)%MOD;
                uPow*=2;
                u[i]=true;
                continue;
            }
        }
        dp[i]=dp[i-1];
    }
}

void solve2(){
    if(word[0]!='w'&&word[0]!='m'){
        dp[0]=1;
    }else{
        cout<<0<<endl;
        exit(0);
    }
    
    if(word[1]!='w'&&word[1]!='m'){
        if(word[1]=='n'&&word[0]=='n') {
            dp[1]=2;
        } else if(word[1]=='u'&&word[0]=='u') {
            dp[1]=2;
        } else {
            dp[1]=1;
        }
    }else{
        cout<<0<<endl;
        exit(0);
    }

    for(int i=2;i<n;++i){
        if(word[i]=='w'||word[i]=='m'){
            cout<<0<<endl;
            exit(0);
        }
        if(word[i]=='n'){
            if(word[i-1]=='n'){
                dp[i]=(dp[i-1]+dp[i-2])%MOD;
                continue;
            }
        }
        if(word[i]=='u'){
            if(word[i-1]=='u'){
                dp[i]=(dp[i-1]+dp[i-2])%MOD;
                continue;
            }
        }
        dp[i]=dp[i-1];
    }
}

int main(){
    init();
    solve2();
    cout<<dp[n-1]<<endl;;
    return 0;   
}
