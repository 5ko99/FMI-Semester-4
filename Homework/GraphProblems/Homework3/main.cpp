//Solution that uses more memory and less time
#include<iostream>
#include<vector>
#include<algorithm>
#include<climits>
#include<queue>
using namespace std;
#define INF INT_MAX
#define MINF INT_MIN

struct Node{
    int to,price,time;
};

vector<Node> graph[100000];
int n,m,k,s,f,low=INF,high=MINF;

void init(){
    int from,to,price,time;
    scanf("%d %d %d",&n,&m,&k);
    for(int i=0;i<m;++i){
        scanf("%d %d %d %d",&from,&to,&price,&time);
        if(low>price)
            low=price;
        if(high<price)
            high=price;
        graph[from-1].push_back({to-1,price,time});
    }
    s=0;
    f=n-1;
}


vector<int> times,p;
void ford(int maxPrice){
    times.assign(100000,INF);
    times[s]=0;

    vector<bool> inqueue(100000, false);
    queue<int> q;
    
    q.push(s);
    inqueue[s]=true;

    while(!q.empty()){
        int v=q.front();
        q.pop();
        inqueue[v]=false;
        for(auto edge:graph[v]){
            if(edge.price<=maxPrice){
                    if(times[edge.to]>times[v]+edge.time){
                        times[edge.to]=times[v]+edge.time;
                        if(!inqueue[edge.to]){
                            q.push(edge.to);
                            inqueue[edge.to]=true;
                        }
                    }
            }
        }
    }
}

void binSearch(int l, int h){
     int best=INF;
    while(l<=h){
        int mid=l+(h-l)/2;

        ford(mid);
        if(times[f]<=k){
            best=mid;
            h=mid-1;
        }

        if(times[f]>k){
            l=mid+1;
        }
    }
    if(best==INF)
        printf("-1 \n");
    else
        printf("%d \n",best);
}

int main(){
    init();
    binSearch(low,high);
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