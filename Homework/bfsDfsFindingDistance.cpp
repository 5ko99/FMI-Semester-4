#include<iostream>
#include<vector>
#include<queue>
using namespace std;
int n, dist[10000];
vector<int> gr[10000];
bool used[10000];
void init(){
    cin>>n;
    while(cin){
        int a,b;
        cin>>a>>b;
        if(a<n&&b<n){
            gr[a].push_back(b);
        }else{
            break;
        }
    }
}

void bfs(int start){
    queue<int> toVisit;
    int node;

    toVisit.push(start);
    used[start]=true;
    dist[start]=0;

    while(!toVisit.empty()){
        node = toVisit.front();
        toVisit.pop();
        printf("%d ",node);

        for(int i=0;i<gr[node].size();++i){
            if(!used[gr[node][i]]){
                toVisit.push(gr[node][i]);
                used[gr[node][i]]=true;
                dist[gr[node][i]] = dist[node]+1;
            }

        }
    }
}

void dfs(int start){
    used[start] = true;
    printf("%d ",start);
    for(int u:gr[start])
        if(!used[u])
            dfs(u);
}

int main(){
    init();
    cout<<endl;
    //bfs(0);
    dfs(0);
    cout<<endl;
    for(int i=0;i<n;++i)
        printf("Distance to %d is %d \n",i, dist[i]);
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
*/
