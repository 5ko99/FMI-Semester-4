#include<iostream>
#include<vector>
#include<algorithm>
#include<queue>
#include<climits>
using namespace std;
#define INF INT_MAX

struct Atr{
    int index;
    int data;
};

int n,m,k;
vector<int> gr[1001], dist(1001);
vector<Atr> atr(10001);
vector<bool> used(1001);
void init(){
    scanf("%d %d",&n,&m);
    for(int i=0;i<m;++i){
        int a,b;
        scanf("%d %d",&a,&b);
        gr[a].push_back(b);
    }
    scanf("%d",&k);
    for(int i=0;i<k;++i){
        atr[i].index=i;
        scanf("%d",&atr[i].data);
    }
}

void bfs(int start){
    queue<int> toVisit;

    toVisit.push(start);
    used[start]=true;
    dist[start]=0;

    while(!toVisit.empty()){
        int node = toVisit.front();
        toVisit.pop();
        for(auto next: gr[node]){
            if(!used[next]&&atr[]){
                toVisit.push(next);
                used[next]=true;
                dist[next] = dist[node]+1;  
            }
        }
    }
}
void solve(){
    int res=0;
    for(int i=0;i<k-1;++i){
        used.assign(n,false);
        dist.assign(n,INF);
        bfs(atr[i].data);
        if(dist[atr[i+1].data]<INF){
            res+=dist[atr[i+1].data];
        }
        else{
            printf("-1\n");
            return;
        }
    }
    printf("%d\n",res);
}



int main(){
    init();
    solve();
    
    return 0;   
}