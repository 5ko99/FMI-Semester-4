#include<iostream>
#include<vector>
#include<algorithm>
#include<climits>
using namespace std;
#define MOD 1000000021
#define INF LONG_LONG_MAX

int n,m,q;
long long dist[556][556],paths[556][556];

void alt();

void init(){
    scanf("%d %d",&n,&m);

     for(int i=0;i<n;++i){
        for(int j=0;j<n;++j){
            if(i==j){
                paths[i][j]=1;
                dist[i][j]=0;
            }else{
                dist[i][j]=INF;
            }
        }
    }
    
    for(int i=0;i<m;++i){
        int a,b,cost;
        scanf("%d %d %d",&a,&b,&cost);
        dist[a-1][b-1]=cost;
        dist[b-1][a-1]=cost;
    }
    alt();
    scanf("%d",&q);
    vector<long long> res;
    for(int i=0;i<q;++i){
        int g1,g2;
        scanf("%d %d",&g1,&g2);
        res.push_back(paths[g1-1][g2-1]);
    }
    for(int i=0;i<q;++i){
        cout<<res[i]<<' ';
    }

   
}



void alt(){
    for(int k=0;k<n;++k){
        for(int i=0;i<n;++i){
            for(int j=0;j<n;++j){
                if(dist[i][k]<INF&&dist[k][j]<INF){
                    if(dist[i][k]+dist[k][j]<dist[i][j]){
                        dist[i][j]=dist[i][k]+dist[k][j];
                        paths[i][j]=(paths[i][k]*paths[k][j])%MOD;
                    } else if(dist[i][k]+dist[k][j]==dist[i][j]&&k!=i&&k!=j){
                            paths[i][j]=((paths[i][k]*paths[k][j])%MOD+paths[i][j])%MOD;
                        }
                    }
                }
            }
        }
    }


int main(){
    init();
    return 0;   
}

/*
7 7
1 2 10
1 4 7
2 3 15
2 5 20
3 6 5 
4 5 13
5 6 10
3
6 1
2 4
3 7

2 1
1 2 3
1
0 1

3 3
1 3 3
1 2 5
3 2 2
3
1 2
1 3
2 3
*/