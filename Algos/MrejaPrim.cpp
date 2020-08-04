#include<iostream>
#include<vector>
#include<algorithm>
#include<climits>
#include<queue>
using namespace std;
#define V 10000
#define INF INT_MAX



int n,m,dist[V],previous[V];
bool used[V];
vector<pair<int,int>> gr[V],tree[V];

void init(){
    scanf("%d %d",&n,&m);
    for(int i=0;i<m;++i){
        int a,b,cost;
        scanf("%d %d %d",&a,&b,&cost);
        gr[a-1].push_back({b-1,cost});
        gr[b-1].push_back({a-1,cost});
    }
}

void  solve(int start=0){
    int minCost=0;
    priority_queue<pair<int,int>,vector<pair<int,int> >, greater<pair<int,int> > >toVisit;
    int node;

    fill(dist,dist+n,INF);
    dist[start]=0;
    previous[start]=-1;
    toVisit.push({0,start});

    while(!toVisit.empty()){
        node=toVisit.top().second;
        toVisit.pop();

        if(used[node]) continue;
        used[node]=true;

        if(previous[node]!=-1){
            tree[previous[node]].push_back({node,dist[node]});
            tree[node].push_back({previous[node],dist[node]});
            minCost+=dist[node];
        }

        for(auto edge:gr[node]){
            if(!used[edge.first] && dist[edge.first]>edge.second){
                dist[edge.first]=edge.second;
                previous[edge.first]=node;
                toVisit.push({edge.second,edge.first});
            }
        }
    }
    cout<<minCost<<endl;
}

int main(){
    init();
    solve();
    
    return 0;   
}

/*
6 10
6 4 2
2 4 3
5 4 1
3 4 5
1 6 2
2 3 4
5 1 2
3 5 1
6 2 3
5 2 4
*/
