#include<iostream>
#include<vector>
#include<algorithm>
#include<climits>
using namespace std;
#define V 10000
#define INF INT_MAX

int dist[V][V],p[V][V], n, m;

void init(){
    cin>>n>>m;
    for(int i=0;i<n;++i){
        for(int j=0;j<n;++j){
            if(i==j){
                dist[i][j]=0;
                p[i][j]=i;
            }else{
                dist[i][j]=INF;
                p[i][j]=-1;
            }
        }
    }
    for(int i=0;i<m;++i){
        int a,b,cost;
        cin>>a>>b>>cost;
        dist[a][b]=cost;
    }
}

void floyd(){
    for(int k=0;k<n;++k){
        for(int i=0;i<n;++i){
            for(int j=0;j<n;++j){
                if(dist[i][k]<INF&&dist[k][j]<INF&&dist[i][j]>dist[i][k]+dist[k][j]){
                    dist[i][j]=dist[i][k]+dist[k][j];
                    p[i][j]=k;
                }
            }
        }
    }
}

void print(){
    cout<<endl;
    for(int i=0;i<n;++i){
        for(int j=0;j<n;++j){
            if(dist[i][j]<INF)
                cout<<dist[i][j]<<' ';
            else 
                cout<<"INF"<<' ';
        }
        cout<<endl;
    }
    cout<<endl;
}

int main(){
    init();
    floyd();
    print();
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