#include<iostream>
#include<vector>
#include<algorithm>
using namespace std;

vector<vector<int>> adj;
vector<bool> visited;
int n;
vector<int> component;

void init(){
    cin>>n;
    adj.assign(n,vector<int>());
    while(cin){
        int a,b;
        cin>>a>>b;
        if((a>=0&&b>=0)&&(a<n&&b<n)){
            adj[a].push_back(b);
            adj[b].push_back(a);
        }else{
            break;
        }
    }
}

void dfs(int v){
    visited[v]=true;
    component.push_back(v);
    for(auto u:adj[v]){
        if(!visited[u])
            dfs(u);
    }
}

void find_components(){
    visited.assign(n,false);
    for(int i=0;i<n;++i){
        if(!visited[i]){
            component.clear();
            dfs(i);
            cout<<"Component:";
            for(auto i:component)
                cout<<' '<<i;
            cout<<endl;
        }
    }
}

int main(){
    init();
    find_components();
    return 0;   
}
