#include<cstdio>
#include<vector>
#include<queue>
#include<limits.h>

using namespace std;

vector<pair<int,int> >gr[1000],tree[1000];
int n,m,used[1000],dist[1000],previous[1000];

void init(){
    int from,to,weight;

    scanf("%d %d",&n,&m);

    for(int i=0;i<m;i++){
        scanf("%d %d %d",&from,&to,&weight);

        gr[from].push_back({to,weight});
        gr[to].push_back({from,weight});
    }
}

void prim(int start){
    priority_queue<pair<int,int>,vector<pair<int,int> >, greater<pair<int,int> > >toVisit;
    int node;

    fill(dist,dist+n,INT_MAX);
    dist[start]=0;
    previous[start]=-1;///we come from nowhere. This is the first node, not the end of an edge
    toVisit.push({0,start});

    while(!toVisit.empty()){
        node=toVisit.top().second;///take the node only. The distance can be found in the array
        toVisit.pop();

        if(used[node])continue;
        used[node]=1;

        if(previous[node]!=-1){
            ///push the edge in both directions. important - the edge is previous[node] <-> node and the weight can be found in dist[node]
            ///since this is the minimal distance adding the vertice node to the graph
            tree[previous[node]].push_back({node,dist[node]});
            tree[node].push_back({previous[node],dist[node]});
        }

        for(auto edge:gr[node]){///for each of its neighbors (important! edge is a pair of ints here)
            if(!used[edge.first] && dist[edge.first]>edge.second){///if this edge adds the vertice edge.second to the graph with a smaller weight than we have previously found
                dist[edge.first]=edge.second;
                previous[edge.first]=node;///the edge that adds edge.first to the graph is node <-> edge.first
                toVisit.push({edge.second,edge.first});///push in queue
            }
        }
    }
}

void print(){
    for(int i=0;i<n;i++){
        printf("neighbors of %d:",i);
        for(auto edge:tree[i]){
            printf("{%d,%d} ",edge.first,edge.second);
        }
        printf("\n");
    }
}

int main(){
    init();
    prim(0);
    print();
} 
