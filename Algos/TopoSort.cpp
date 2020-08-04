#include<iostream>
#include<vector>
#include<algorithm>
using namespace std;
int n;//number of vertices
vector<int> adj[10000];
vector<bool> visited;
vector<int> ans;

void dfs(int v){
    visited[v] = true;
    for(int u:adj[v])
        if(!visited[u])
            dfs(u);
    ans.push_back(v);
}

void topologicalSort(){
    visited.assign(n,false);
    ans.clear();
    for(int i=0;i<n;++i)
        if(!visited[i])
            dfs(i);
    reverse(ans.begin(),ans.end());
}

void init(){
   cin>>n;
    while(cin){
        int a,b;
        cin>>a>>b;
        if(a<n&&b<n){
            adj[a].push_back(b);
        }else{
            break;
        }
    }
}

int main(){
    init();
    topologicalSort();
    for(int i=0;i<ans.size();++i)
        cout<<ans[i]<<' ';
    cout<<endl;
    return 0;
}
