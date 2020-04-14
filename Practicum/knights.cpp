#include <iostream>
#include <queue>
#include <cstdio>
#include <stack>
#include <vector>
using namespace std;

int n, m, k, obsX[2000], obsY[2000], knightX[2000], knightY[2000], dist[2000][2000], prX, prY;
bool used[2001][2001];
pair<int, int> p[2000][2000];
queue < pair <int, int> > q;

void traverse(int x, int y, int z, int t)
{
    if(z >= 0 && z <n && t >= 0 && t < n)
    {
        if(!used[z][t])
        {
            dist[z][t] = dist[x][y] + 1;
            p[z][t] = {x, y};
            used[z][t] = 1;
            q.push({z, t});
        }
    }
}

void bfs(int startX, int startY)
{
    used[startX][startY] = 1;
    q.push({startX, startY});
    while(!q.empty())
    {
        pair<int, int> cur = q.front();
        int x = cur.first, y = cur.second;
        q.pop();
        traverse(x, y, x-1, y-2);
        traverse(x, y, x-1, y+2);
        traverse(x, y, x+1, y-2);
        traverse(x, y, x+1, y+2);
        traverse(x, y, x-2, y-1);
        traverse(x, y, x-2, y+1);
        traverse(x, y, x+2, y-1);
        traverse(x, y, x+2, y+1);
    }
}

int main()
{
    cin>>n>>m>>k;
    for(int i=0;i<m;++i)
    {
        scanf("%d %d", &obsX[i], &obsY[i]);
        used[obsX[i]][obsY[i]] = 1;
    }
    for(int i=0;i<k;++i)
    {
        scanf("%d %d", &knightX[i], &knightY[i]);
    }
    scanf("%d %d", &prX, &prY);
    bfs(prX, prY);
    int ans = 0, maxDist = 0;
    for(int i=0;i<k;++i)
    {
        if(used[knightX[i]][knightY[i]])
        {
            ans++;
            if(dist[knightX[i]][knightY[i]] > maxDist)
                maxDist = dist[knightX[i]][knightY[i]];
        }
    }
    cout<<ans<<" "<<maxDist<<endl;
}
