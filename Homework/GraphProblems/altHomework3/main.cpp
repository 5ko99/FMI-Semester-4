#include<iostream>
#include<vector>
#include<algorithm>
#include<climits>
using namespace std;
#define INF INT_MAX

struct Edge{
    int from,to,price,time;

    bool operator<(const Edge& e) const{
        if(price==e.price)
            return time<e.time;
        return price<e.price;
    }
};

vector<Edge> e;
int n,m,k,s,f;
void init(){
    int from,to,price,time;
    scanf("%d %d %d",&n,&m,&k);
    for(int i=0;i<m;++i){
        scanf("%d %d %d %d",&from,&to,&price,&time);
        e.push_back({from-1,to-1,price,time});
    }
    s=0;
    f=n-1;
}

vector<int> prices,times,p;
void ford(){
    prices.assign(100000,INF);
    times.assign(100000,-1);
    prices[s]=0;
    times[s]=0;
    bool any=true;
    while(any){
        any=false;
        for (int j=0; j<m; ++j){
            if(prices[e[j].from]<INF){
                if(times[e[j].from]+e[j].time<k){
                    if(prices[e[j].to]>prices[e[j].from]+e[j].price){
                        prices[e[j].to]=prices[e[j].from]+e[j].price;
                        times[e[j].to]=times[e[j].from]+e[j].time;
                        any=true;
                    }else if(times[e[j].from]+e[j].time<times[e[j].to]){
                        times[e[j].to]=times[e[j].from]+e[j].time;
                        any=true;
                    }
                }
            }
        }
    }
}

int main(){
    init();
    sort(e.begin(),e.end());
    ford();
    cout<<times[f]<<endl;
    return 0;   
}

/* 
7 11 42
1 3 7 11
3 1 7 13
1 2 3 3
1 4 13 1
6 1 14 8
4 6 1 7
2 4 1 13
2 6 4 20
3 5 2 5
5 6 6 4
6 7 5 20

2 2 3                                                                  
1 2 3 5
1 2 1 9

*/