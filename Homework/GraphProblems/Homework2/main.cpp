#include<iostream>
#include<vector>
#include<queue>
#include<climits>
#include<algorithm>
using namespace std;
#define NINF INT_MIN

struct Node{
    int to,time;
};

vector<Node> graph[10000];
int n,m,startV,endV;
void init(){
    int from,to, time;
    scanf("%d %d",&n,&m);
    for(int i=0;i<m;++i){   
        scanf("%d %d %d",&from,&to,&time);
        graph[from].push_back({to,time});
    }
    scanf("%d %d",&startV,&endV);
}

vector<bool> visited(10000,false);
vector<int> ans;

void dfs(int v) {
    visited[v] = true;
    for (auto u : graph[v]) {
        if (!visited[u.to])
            dfs(u.to);
    }
    ans.push_back(v);
}

void topological_sort() {
    ans.clear();
    for (int i = 0; i < n; ++i) {
        if (!visited[i])
            dfs(i);
    }
    reverse(ans.begin(),ans.end());
}

vector<int> dist(10000,NINF);
vector<int> p(10000,0);
void num(){
    dist[startV]=0;
    for(auto u:ans){
        for(auto v:graph[u]){
            if(dist[v.to]<=dist[u]+v.time){
                // if(dist[v.to]==dist[u]+v.time||p[v.to]==0)
                //     p[v.to]++;
                dist[v.to]=dist[u]+v.time;
            }
        }
    }
}

vector<int> dist2(10000,NINF);
void num2(){
    dist2[startV]=0;
    for(auto u:ans){
        for(auto v:graph[u]){
            if(dist2[v.to]<=dist2[u]+v.time){
                dist2[v.to]=dist2[u]+v.time;
                if(dist2[v.to]==dist[v.to]&&dist[v.to]!=NINF){
                    ++p[v.to];
                }
            } 
            
        }
    }
}

int main(){
    init();
    topological_sort();
    num();
    num2();
    printf("%d %d \n",dist[endV],p[endV]);
    return 0;   
}

/*
6 8
3 4 2
3 0 1
0 2 1
3 2 4
4 2 2
1 3 5
0 5 1
5 2 2
3 2

4 5
0 1 5
1 2 5
0 2 10
0 3 1
3 2 1
0 2

3 3
0 1 4
0 2 3
1 2 4
0 2
*/
