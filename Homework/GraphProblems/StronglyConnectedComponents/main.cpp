#include<iostream>
#include<vector>
#include<algorithm>
using namespace std;
vector<bool> used;
vector<int> order, component;
vector<vector<int>> g,gr;
int n;

void printComponent(){
    int n=component.size();
    for(int i=0;i<n;++i)
        cout<<component[i]<<' ';
    cout<<endl;
}

void init(){
    cin>>n;
    g.assign(n,vector<int>());
    gr.assign(n,vector<int>());
    while(cin){
        int a,b;
        cin>>a>>b;
        if((a>=0&&b>=0)&&(a<n&&b<n)){
            g[a].push_back(b);
            gr[b].push_back(a);
        }else{
            break;
        }
    }
}

void dfs1(int v){
    used[v]=true;
    for(auto u:g[v])
        if(!used[u])
            dfs1(u);
    order.push_back(v);
}

void dfs2(int v){
    used[v]=true;
    component.push_back(v);
    for(auto u:gr[v])
        if(!used[u])
            dfs2(u);
}

void findComponents(){
    used.assign(n,false);
    order.clear();
    component.clear();

    for(int i=0;i<n;++i)
        if(!used[i])
            dfs1(i);

    used.assign(n,false);
    reverse(order.begin(),order.end());
    for(int i=0;i<n;++i){
        if(!used[order[i]]){
            dfs2(order[i]);
            printComponent();
            component.clear();
        }
    }
}

int main(){
    init();
    cout<<"Components:\n";
    findComponents();
    return 0;
}
/*
5
1 0
0 2
2 1
0 3
3 4
*/