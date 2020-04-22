#include<iostream>
#include<vector>
using namespace std;
vector<bool> used;
vector<int> order, component;

void dfs1(vector<int> g[],int v){
    used[v]=true;
    for(int i=0;i<g[v].size();++i)
        if(!used[g[v][i]])
            dfs1(g,g[v][i]);
    order.push_back(v);
}

void dfs2(vector<int> gr[],int v){
    used[v] = true;
    component.push_back(v);
    for(int i=0;i<gr[v].size();++i)
        if(!used[gr[v][i]])
            dfs2(gr,gr[v][i]);
}

void printComponent(){
    int n=component.size();
    for(int i=0;i<n;++i)
        cout<<component[i]<<' ';
    cout<<endl;
}

int main(){
    int n,a,b;
    cin>>n;
    vector<int> g[n],gr[n];
    while(cin){
        cin>>a>>b;
        if(a<n&&b<n){
            g[a].push_back(b);
            gr[b].push_back(a);
        }else{
            break;
        }
    }
    cout<<"\nComponents: \n";
    used.assign(n,false);
    for(int i=0;i<n;++i)
        if(!used[i])
            dfs1(g,i);
    used.assign(n,false);

    //reverse order
    for(int i=0;i<n;++i){
        int v=order[n-1-i];
        if(!used[v]){
            dfs2(gr,v);
            printComponent();
            component.clear();
        }
    }
    return 0;
}
