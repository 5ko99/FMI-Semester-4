#include<iostream>
#include<vector>
#include<algorithm>
using namespace std;

vector<vector<int>> adj;
int n;
vector<int> color;
vector<int> parent;
int cycle_start, cycle_end;

void init(){
    cin>>n;
    adj.assign(n,vector<int>());
    while(cin){
        int a,b;
        cin>>a>>b;
        if((a>=0&&b>=0)&&(a<n&&b<n)){
            adj[a].push_back(b);
            //adj[b].push_back(a);
        }else{
            break;
        }
    }
}

bool dfs(int v){
    color[v]=1;
    for(auto u: adj[v]){
        if(color[u]==0){
            parent[u]=v;
            if(dfs(u))
                return true;
        }else if(color[u]==1){
            cycle_end=v;
            cycle_start=u;
            return true;
        }
    }
    color[v]=2;
    return false;
}

void findCycle(){
    color.assign(n,0);
    parent.assign(n,-1);
    cycle_start=-1;
    for(int v=0;v<n;++v){
        if(color[v]==0 && dfs(v)) break;
    }
    if(cycle_start==-1){
        cout<<"Acyclic"<<endl;
    }else{
        vector<int> cycle;
        cycle.push_back(cycle_start);
        for(auto v=cycle_end;v!=cycle_start;v=parent[v])
            cycle.push_back(v);
        cycle.push_back(cycle_start);
        reverse(cycle.begin(), cycle.end());

        cout<<"Cycle Found: ";
        for(auto v:cycle)
            cout<<v<<' ';
        cout<<endl;
    }
}


int main() {
    init();
    findCycle();
    return 0;
}