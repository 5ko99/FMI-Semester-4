#include<iostream>
#include<vector>
#include<algorithm>
#include<cstring>
#include<climits>
#include<set>
#include<stack>
using namespace std;

struct rec{
    char c;
    int pos;

    bool operator=(const rec& r) const{
        return c==r.c;
    }

    bool operator<(const rec& r) const{
        return c<r.c;
    }
};

char str[3002];
int size, dp[3002];

void init(){
    scanf("%s",str);
    size = strlen(str);
}

int oddTimesLet(int to, char let){//false = odd true = even
    int times=0;
    for(int i=0;i<to;++i){
        if(str[i]==let) ++times;
    }
    return times;
}


void solve(){
    dp[0]=1;
    set<rec> problem;
    char lastChar=str[0];
    int lastChance;
    for(int i=1;i<size;++i){
        int times = oddTimesLet(i,str[i]);
        set<rec>::iterator tr = problem.find({str[i],0});
        char c =tr->c;int pos=tr->pos;
        if(times%2==0&&times!=0){
           problem.erase({str[i],i});
           if(problem.empty())
                dp[i]=1;
            else{
               dp[i]=dp[i-1];
            } 
                
        }else if(times==0){
            dp[i]=dp[i-1];
        }
        else{
           if(problem.empty()){
               dp[i]=dp[i-1]+1;
           }else{
                dp[i]=dp[i-1];
           }
           problem.insert({str[i],i});
        }
        lastChar = str[i];
    }
}



int main(){
    init();
    solve();
    cout<<dp[size-1]<<endl;
    return 0;   
}

/*
    abbacc

    zxcvbnzxxccvvbbnn

    asssffgfhfdgdgsshfghgffjfff
*/
