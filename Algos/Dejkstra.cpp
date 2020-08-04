#include<iostream>
#include<vector>
#include<climits>
#include<algorithm>
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
        int a,b,len;
        cin>>a>>b>>len;
        if(a<n&&b<n){
            adj[a].push_back(make_pair(b,len));
        }else{
            break;
        }
    }
}

void dijkstra(int s,vector<int>& d, vector<int>& p){
    d.assign(n,INFINITY);
    p.assign(n,-1);
    vector<bool> u(n,false);

    d[s]=0;

    for(int i=0;i<n;++i){
        int v=-1;
        for(int j=0;j<n;++j){
            if(!u[j]&&(v==-1||d[j]<d[v]))
                v=j;
        }

        if(d[v]==INFINITY) break;
        u[v]=true;

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

void getPath(int from, int to, vector<int> const& p, vector<int>& path){
    if(p[to]==-1){
        cout<<"No path!"<<endl;
        return;
    }
    for(int v=to;v!=from;v=p[v])
        path.push_back(v);
    path.push_back(from);
    reverse(path.begin(),path.end());
}

void printInfo(int s,int from, int to, vector<int>& path, vector<int>& d){
    cout<<"Dejkstra from "<<s<<endl;
    for(int i=0;i<n;++i){
        printf("Distance to %d is %d \n",i,d[i]);
    }
    printf("Path from %d to %d \n",from,to);
    for(int i=0;i<path.size();++i){
        cout<<path[i]<<' ';
    }
    cout<<endl;
}

int main(){
    init();
    int s;
    cout<<"s=";
    cin>>s;
    vector<int> p,d,path;
    dijkstra(s,d,p);
    cout<<"enter from and to"<<endl;
    int from,to;
    cin>>from>>to;
    getPath(from,to,p,path);
    printInfo(s,from,to,path,d);
    return 0;
}

/*
5
0 1 8
0 4 20
1 2 2
2 4 3
2 3 100
3 1 7
4 3 1
*/
