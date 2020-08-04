#include<iostream>
#include<vector>
#include<algorithm>
#include<climits>
using namespace std;
#define INF INT_MAX
#define V 10000

int n,m, adj[V][V]; // adjacency matrix of graph

struct Edge {
    int w = INF, to = -1;
};

void init(){
    cin>>n>>m;
    for(int i=0;i<n;++i)
        for(int j=0;j<n;++j){
            if(i==j){
                adj[i][i]=0;
            }else{
                adj[i][j]=INF;
            }
        }
    for(int i=0;i<m;++i){
        int a,b,cost;
        cin>>a>>b>>cost;
        adj[a][b]=cost;
        adj[b][a]=cost;
    }
    cout<<endl;
}

void prim(){
    int totalWeight=0;
    vector<bool> selected(n,false);
    vector<Edge> min_e(n);
    min_e[0].w=0;

    for(int i=0;i<n;++i){
        int v = -1;
        for(int j=0;j<n;++j){
            if(!selected[j]&&(v==-1||min_e[j].w<min_e[v].w))
                v=j;
        }

        if(min_e[v].w==INF){
            cout<<"No MST"<<endl;
            return;
        }

        selected[v]=true;
        totalWeight+=min_e[v].w;

        if(min_e[v].to!=-1)
            cout<<v<<' '<<min_e[v].to<<endl;
        
        for(int to=0;to<n;to++){
            if(adj[v][to]<min_e[to].w)
                min_e[to]={adj[v][to],v};
        }
    }
    cout<<endl;
    cout<<totalWeight<<endl;

}

int main(){
    init();
    prim();
    
    return 0;   
}

/*
5 7
0 1 8
0 4 20
1 2 2
2 4 3
2 3 100
3 1 7
4 3 1
*/
