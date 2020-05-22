#include<iostream>
#include<vector>
#include<algorithm>
using namespace std;

long long Ackermann(long long m, long long n){
    if(m==0){
        return n+1;
    } else if(m>0&&n==0){
        return Ackermann(m-1,1);
    }else if(m>0&&n>0){
        return Ackermann(m-1,Ackermann(m,n-1));
    }
}


int main(){
    int m,n;
    cin>>m>>n;
    cout<<Ackermann(m,n);
    return 0;   
}
