#include<iostream>
#include<vector>
using namespace std;
vector<vector<int>> adj;
int n;

vector<bool> visited;
vector<int> tin,low;
int timer;

void init(){
    cin>>n;
    adj.assign(n,vector<int>());
    while(cin){
        int a,b;
        cin>>a>>b;
        if(a<n&&b<n){
            adj[a].push_back(b);
            adj[b].push_back(a);
        }else{
            break;
        }
    }
}

void isBridge(int a, int b){
    printf("Bridge from %d to %d \n",a,b);
}

void dfs(int v, int p=-1){
    visited[v]=true;
    tin[v]=low[v]=timer++;
    for(auto to:adj[v]){
        if(to==p) continue; //if we're going to parrent
        if(visited[to]){
            low[v]=min(low[v],tin[to]);//if we alredy visited this vertex then low[v] is the min of low[v] and the in time of vertex to
        }else{
            dfs(to,v);
            low[v]=min(low[v],low[to]);//after we visited this vertex we update low[v] with the min of low[v] and low[to]
            if(low[to]>tin[v])//if low[to] is greather then tin[v] so this is bridge!
                isBridge(v,to);
        }
    }
}

void findBridges(){
    timer=0;
    visited.assign(n,false);
    tin.assign(n,-1);
    low.assign(n,-1);
    for(int i=0;i<n;++i)
        if(!visited[i])
            dfs(i);
}

int main(){
    init();
    findBridges();
    return 0;
}