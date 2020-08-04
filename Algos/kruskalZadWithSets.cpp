#include <iostream>
#include <algorithm>
using namespace std;
pair<int, pair<int, int> > a[1000000], b[1000000];
int d[10000], p[10000], n, m, x, y, z;

int root(int v)
{
    if(p[v] == v)
        return v;
    return p[v] = root(p[v]);
}

void unite(int from, int to)
{
    if(d[from] <= d[to])
        p[from] = to;
    else
        p[to] = from;
    if(d[from] == d[to])
        d[to] ++;
}

void initDSU()
{
    for(int i=0;i<n;++i)
    {
        p[i] = i;
        d[i] = 0;
    }
}

int main()
{
    cin>>n;
    cin>>m;
    int br1 = 0;
    int br2 = 0;
    for(int i=0;i<m;++i)
    {
        cin>>x>>y>>z;
        if(z == 1 || z == 3)
        {
            a[br1++] = {z, {x-1, y-1}};
        }
        if(z == 2 || z == 3)
        {
            b[br2++] = {z, {x-1, y-1}};
        }
    }
    sort(a, a+br1);
    sort(b, b+br2);

    initDSU();
    int ans = 0, edges1 = 0, edges2 = 0, duplicatedEdges = 0;

    for(int i=br1-1;i>=0;--i)
    {
        int from, to, type;
        from = a[i].second.first;
        to = a[i].second.second;
        if(root(from) != root(to))
        {
            unite(root(from), root(to));
            edges1++;
        }
    }

    initDSU();

    for(int i=br2-1;i>=0;--i)
    {
        int from, to, type;
        from = b[i].second.first;
        to = b[i].second.second;
        type = b[i].first;
        if(root(from) != root(to))
        {
            unite(root(from), root(to));
            if(type == 3)
                duplicatedEdges++;
            edges2++;
        }
    }
    if(edges1 != n-1 || edges2 != n-1)
        cout<<-1<<endl;
    else
        cout<<m-edges1-edges2+duplicatedEdges<<endl;
}

