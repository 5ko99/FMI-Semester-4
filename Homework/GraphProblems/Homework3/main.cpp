#include<iostream>
#include<vector>
#include<algorithm>
#include<climits>
using namespace std;
#define INF INT_MAX

struct Node{
    int to,price,time;
};

vector<Node> graph[100000];
int n,m,k,s,f;

void init(){
    int from,to,price,time;
    scanf("%d %d %d",&n,&m,&k);
    for(int i=0;i<m;++i){
        scanf("%d %d %d %d",&from,&to,&price,&time);
        graph[from-1].push_back({to-1,price,time});
    }
    s=0;
    f=n-1;
}

vector<int> prices,times,p;
void dijkstra(){
    prices.assign(100000,INF);
    times.assign(100000,-1);
    p.assign(100000,-1);
    vector<bool> u(100000,false);

    prices[s]=0;
    times[s]=0;

    for(int i=0;i<n;++i){
        int v=-1;
        for(int j=0;j<n;++j){
            if(!u[j]&&(v==-1||prices[j]<prices[v]))
                v=j;
        }

        if(prices[v]==INF) break;
        u[v]=true;

        for(auto edge:graph[v]){
            int to=edge.to;
            int price=edge.price;
            int time=edge.time;
             if (prices[v] + price < prices[to]) {
                prices[to] = prices[v] + price;
                times[to]= times[v]+time;
                p[to]=v;
            }
        }
    }
}


int main(){
    init();
    dijkstra();
    // for(int i=0;i<n;++i)
    //     for(auto edge:graph[i])
    //         printf("%d to %d with price:%d and time:%d \n",i,edge.to,edge.price,edge.time);
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