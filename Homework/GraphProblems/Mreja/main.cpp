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
    previous[start]=-1;///we come from nowhere. This is the first node, not the end of an edge
    toVisit.push({0,start});

    while(!toVisit.empty()){
        node=toVisit.top().second;///take the node only. The distance can be found in the array
        toVisit.pop();

        if(used[node]) continue;
        used[node]=true;

        if(previous[node]!=-1){
            ///push the edge in both directions. important - the edge is previous[node] <-> node and the weight can be found in dist[node]
            ///since this is the minimal distance adding the vertice node to the graph
            tree[previous[node]].push_back({node,dist[node]});
            tree[node].push_back({previous[node],dist[node]});
            minCost+=dist[node];
        }

        for(auto edge:gr[node]){///for each of its neighbors (important! edge is a pair of ints here)
            if(!used[edge.first] && dist[edge.first]>edge.second){///if this edge adds the vertice edge.second to the graph with a smaller weight than we have previously found
                dist[edge.first]=edge.second;
                previous[edge.first]=node;///the edge that adds edge.first to the graph is node <-> edge.first
                toVisit.push({edge.second,edge.first});///push in queue
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