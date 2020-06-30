#include<iostream>
#include<vector>
#include<algorithm>
#include<queue>
#include<climits>
#define INF INT_MAX
using namespace std;

vector<int> gr[10000], paths, dist;
vector<bool> used;
int n;

void init(){
    scanf("%d",&n);
    paths.assign(n,0);
    dist.assign(n,INF);
    used.assign(n,false);
    while(cin){
        int a,b;
        cin>>a>>b;
        if((a>=0&&a<n)&&(b>=0&&b<n)){
            gr[a].push_back(b);
            gr[b].push_back(a);
        }else{
            break;
        }
        
    }
}

void bfs(int start){
    queue<int> toVisit;

    paths[start]=1;
    used[start]=true;
    dist[start]=0;
    toVisit.push(start);
    
    while(!toVisit.empty()){
        int node = toVisit.front();
        toVisit.pop();

        for(auto next:gr[node]){
            if(dist[next]==dist[node]+1){
                paths[next]+=paths[node];
            }

            if(!used[next]){
                used[next]=true;
                dist[next]=dist[node]+1;
                paths[next]=paths[node];
                toVisit.push(next);
            }
        }
    }

}

int main(){
    init();
    int start;
    cin>>start;
    bfs(start);
    for(int i=0;i<n;++i){
        cout<<"Number of paths to "<<i<<": "<<paths[i]<<'\n';
    }
    cout<<endl;
    for(int i=0;i<n;++i){
        cout<<"Dist to "<<i<<": "<<dist[i]<<'\n';
    }
    cout<<endl;
    return 0;   
}

/**
10
9 8
0 1
1 3
0 2
1 7
4 5
3 6
3 8
1 8
-1 -1
0

4
0 1
0 3
1 2
2 3
-1 -1
0
*/
