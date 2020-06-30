#include<iostream>
#include<vector>
#include<algorithm>
#include<climits>
using namespace std;

vector<vector<int>> p;
int n;

void init(vector<vector<int>>& dist){
    cin>>n;
    dist.assign(n,vector<int>(n,INT_MAX));
    p.assign(n,vector<int>(n,-1));
    for(int i=0;i<n;++i)
        dist[i][i]=0;
    while (true){
        int a,b,distance;
        cin>>a>>b>>distance;
        if((a<n&&b<n)&&(a>=0&&b>=0)){
            dist[a][b]=distance;
            dist[b][a]=distance;
        }else{
            break;
        }
        
    }
    
}

void floyd(vector<vector<int>>& dist){
    for(int k=0;k<n;++k){
        for(int i=0;i<n;++i){
            for(int j=0;j<n;++j){
                if(dist[i][j]>dist[i][k]+dist[k][j] && dist[i][k] < INT_MAX && dist[k][j] < INT_MAX){
                    dist[i][j]=dist[i][k]+dist[k][j];
                    p[i][j]=k;
                }
            }
        }
    }
}

void print(vector<vector<int>>& dist){
    for(int i=0;i<n;++i){
        for(int j=0;j<n;++j){
            cout<<dist[i][j]<<' ';
        }
        cout<<endl;
    }
    cout<<endl;
}

int main(){
    vector<vector<int>> dist;
    init(dist);
    floyd(dist);
    cout<<endl;
    print(dist);
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