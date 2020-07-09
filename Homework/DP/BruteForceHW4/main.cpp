#include<iostream>
#include<vector>
#include<algorithm>
#include<string>
using namespace std;

string str;
int n;

bool oddLet(string str){
    int n = str.length();
    if(n==0||n==1) return true;
    int freq[26]={0};
    for(int i=0;i<n;++i){
        ++freq[str[i]-'a'];
    }
    for(int i=0;i<26;++i){
        if(freq[i]!=0&&freq[i]%2==0) return false;
    }
    return true;
}

string substr(int s, int e){
    string res;
    for(int i=s;i<=e;++i){
        res.push_back(str[i]);
    }
    return res;
}

void solve(){
    bool dp[n][n]={false};
    
    for(int i=0;i<n;++i){
        for(int j=i;j<n;++j){
            dp[i][j] = oddLet(substr(i,j));
        }
    }

    int count=0;
    for(int k=1;k<n;++k){
        int len=0;
        for(int i=0;i<n;++i){
            for(int j=i;j<n;++j){
                for(int l=0;l<k;++l){
                    if()
                }
            }
        }
    }
}

int main(){
    cin>>str;
    n=str.length();
    solve();
    return 0;   
}
