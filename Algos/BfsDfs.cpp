#include<iostream>
#include<algorithm>
#include<vector>
#include<queue>
#include<climits>
using namespace std;
int n, dist[10000], p[10000];
vector<int> gr[10000];
bool used[10000];
void init(){
    cin>>n;
    
    for(int i=0;i<n;++i){
        p[i]=-1;
        dist[i]=INT_MAX;
    }

    while(cin){
        int a,b;
        cin>>a>>b;
        if((a<n&&b<n)&&(a>=0&&b>=0)){
            gr[a].push_back(b);
            gr[b].push_back(a);
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
                p[gr[node][i]]=node;
            }

        }
    }
}
int dfs_timer=0;
vector<int> time_in(10000), time_out(10000), color(10000);
void dfs(int start){
    color[start] = 1;
    time_in[start]=dfs_timer++;
    //printf("%d ",start);
    printf("(");
    for(int u:gr[start])
        if(color[u]==0)
            dfs(u);
    printf(")");
    time_out[start]=dfs_timer++;
    color[start]=2;
}

int main(){
    init();
    cout<<endl;
    bfs(0);
    cout<<endl;
    dfs(0);
    cout<<endl;
    for(int i=0;i<n;++i){
        if(dist[i]<INT_MAX)
            printf("Distance to %d is %d \n",i, dist[i]);
        else
            printf("Distance to %d is NAN \n",i);
    }
        

    //Restore path
    int node;
    cin>>node;
    if (!used[node]) {
        cout << "No path!";
    } else {
        vector<int> path;
        for (int v = node; v != -1; v = p[v])
            path.push_back(v);
        reverse(path.begin(), path.end());
        cout << "Path: ";
        for (int v : path)
            cout << v << " ";
    }
    cout<<endl;
    for(int i=0;i<n;++i){
        printf("Vertex %d TimeIn:%d TimeOut:%d \n",i,time_in[i],time_out[i]);
    }

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
*/
