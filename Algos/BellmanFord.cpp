#include<iostream>
#include<vector>
#include<algorithm>
#include<climits>
using namespace std;
#define INF INT_MAX

struct Edge{
    int from,to,cost;
};

int n, m, d[10000],v,t;
vector<Edge> e;

void init(){
    cin>>n>>m;
    for(int i=0;i<m;++i){
        int a,b,cost;
        cin>>a>>b>>cost;
        e.push_back({a,b,cost});
    }
    cin>>v>>t;
}

void solve()
{
    vector<int> d (n, INF);
    d[v] = 0;
    vector<int> p (n, -1);
    bool any;
    do{
        any = false;
        for (int j = 0; j < m; ++j)
            if (d[e[j].from] < INF)
                if (d[e[j].to] > d[e[j].from] + e[j].cost)
                {
                    d[e[j].to] = d[e[j].from] + e[j].cost;
                    p[e[j].to] = e[j].from;
                    any = true;
                }
    }while(any);

    if (d[t] == INF)
        cout << "No path from " << v << " to " << t << ".";
    else
    {
        vector<int> path;
        for (int cur = t; cur != -1; cur = p[cur])
            path.push_back (cur);
        reverse (path.begin(), path.end());

        cout << "Path from " << v << " to " << t << ": ";
        for (size_t i=0; i<path.size(); ++i)
            cout << path[i] << ' ';
    }
}

int main(){
    init();
    solve();
    
    return 0;   
}
