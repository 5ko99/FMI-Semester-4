#include <iostream>
using namespace std;

#define MOD 1000000007
#define WEEK 10080
int n;
long long dp[WEEK+1];


int main(){
    int a[10000],ans=0;
    cin>>n;
    dp[0]=1;
    for(int i=0;i<n;++i){
        cin>>a[i];
        for(int j=WEEK;j>=0;--j){
            if(a[i]+j<=WEEK){
                dp[a[i]+j]=(dp[a[i]+j]+dp[j])%MOD;
            }
        }
    }
    for(int i=0;i<=WEEK;++i){
        ans = (ans+dp[i])%MOD;
    }
    cout<<ans<<endl;
    
    return 0;   
}
