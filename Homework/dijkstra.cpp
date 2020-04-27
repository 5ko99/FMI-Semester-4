#include<iostream>
#include<vector>
#include<algorithm>
#include<climits>
using namespace std;
#define INFINITY INT_MAX
vector<vector<pair<int,int>>> adj;
int n;
void init(){
    cin>>n;
    for(int i=0;i<n;++i){
        vector<pair<int,int>> v;
        adj.push_back(v);
    }
    while(cin){
        int a,b, weight;
        cin>>a>>b>>weight;
        if(a<n&&b<n){
            adj[a].push_back(make_pair(b,weight));
        }else{
            break;
        }
    }
}

void dijkstra(int s,vector<int>& d, vector<int>& p){
    d.assign(n, INFINITY);
    p.assign(n,-1);
    vector<bool> u(n,false);
    d[s]=0;

    for(int i=0;i<n;++i){
        int v=-1;
        //Find Vertex with smallest distance
        for(int j=0;j<n;++j)
            if(!u[j]&&(v==-1||d[j]<d[v]))
                v=j;
        //if smallest distance is infinity then end
        if(d[v]==INFINITY)
            break;
        //mark smallest distance vertex as used
        u[v]=true;
        //relax
        for(auto edge:adj[v]){
            int to=edge.first;
            int len=edge.second;
            if(d[v]+len<d[to]){
                d[to]=d[v]+len;
                p[to]=v;
            }
        }

    }
}

void restore_path(int s, int t, vector<int> const& p, vector<int>& path) {
    for (int v = t; v != s; v = p[v])
        path.push_back(v);
    path.push_back(s);

    reverse(path.begin(), path.end());
}

int main(){
    init();
    vector<int> d,p;
    dijkstra(0,d,p);
    for(int i=0;i<n;++i){
        cout<<i<<": "<<d[i]<<endl;
    }
    int from,to;
    cin>>from>>to;
    vector<int> path;
    restore_path(from, to, p,path);
    cout<<"Path from "<<from<<" to "<<to<<": "<<endl;
    for(int i=0;i<path.size();++i){
        cout<<path[i]<<' ';
    }
    cout<<endl;
    return 0;
}
/*
5
0 1 8
0 4 20
1 2 2
2 3 100
2 4 3
4 3 1
3 1 7
*/
