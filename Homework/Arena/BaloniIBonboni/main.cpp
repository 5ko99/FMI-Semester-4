#include<iostream>
#include<vector>
#include<algorithm>
using namespace std;

struct C{
    int day;
    int n;
    bool operator<(const C& c) const{
        return n<c.n;
    }
};

int n,m;
vector<C> baloni(100003), bonboni(100003); 
vector<int> result(100003);
void init(){
    scanf("%d %d",&n,&m);
    for(int i=0;i<n;++i){
        baloni[i].day=i+1;
        scanf("%d",&baloni[i].n);
    }
    for(int i=0;i<n;++i){
        bonboni[i].day=i+1;
        scanf("%d",&bonboni[i].n);
    }
}

void solve(){
    //sort(baloni.begin(),baloni.begin()+n);
    vector<C> inOrderBonboni = bonboni;
    sort(bonboni.begin(),bonboni.begin()+n);
    for(int i=n-1;i>=0;--i){
        int day = bonboni[i].day;
        if(m-baloni[day].n>=0){
            m-=baloni[day].n;
            baloni[day].n=0;
        }else{
            baloni[day].n-=m;
            m=0;
        }
        if(m==0) break;
    }
    
    for(int i=0;i<n;++i){
        result[i] = baloni[i].n*inOrderBonboni[i].n;
    }
    int max=result[0];
    for(int i=1;i<n;++i){
        if(max<result[i])
            max=result[i];
    }
    printf("%d\n",max);
}

int main(){
    init();
    solve();
    return 0;   
}

/*
5 3
1 2 3 4 5
1 2 3 4 5

*/