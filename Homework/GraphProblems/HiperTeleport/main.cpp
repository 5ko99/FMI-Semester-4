#include<iostream>
#include<vector>
#include<algorithm>
#include<queue>
#include<climits>
using namespace std;
#define N 1001
#define K 51
#define INF INT_MAX

int n,m,k;
vector<char[K]> data(N);

void init(){
    scanf("%d %d %d",&n,&m,&k);
    for(int i=0;i<n;++i){
       cin>>data[i];
    }
}

vector<pair<int,int>> gr[N],tree[N];
bool usedToCreateGraph[N][N];
void buildGraph(){
    for(int i=0;i<n;++i){
        for(int j=0;j<n;++j){
            if(i!=j&&usedToCreateGraph[i][j]==false&&usedToCreateGraph[j][i]==false){
                int count=0;
                int price=0;
                for(int l=0;l<k;++l){
                    if(count==m){
                        price=1;
                        break;
                    }
                    if(data[i][l]==data[j][l]){
                        ++count;
                    }else{
                        for(int p=m;p<k;++p){
                            if(data[i][p]!=data[j][p]) ++price;
                        }
                        price+=m;
                        break;
                    }
                }
                gr[i].push_back({j,price});
                gr[j].push_back({i,price});
            }
            usedToCreateGraph[i][j]=true;
            usedToCreateGraph[j][i]=true;
        }
    }
}

int dist[N],previous[N];
bool used[N];
void mst(int start=0){
    int minCost=0;
    priority_queue<pair<int,int>,vector<pair<int,int> >, greater<pair<int,int> > >toVisit;
    int node;

    fill(dist,dist+n,INF);
    dist[start]=0;
    previous[start]=-1;///we come from nowhere. This is the first node, not the end of an edge
    toVisit.push({0,start});

    while(!toVisit.empty()){
        node=toVisit.top().second;///take the node only. The distance can be found in the array
        toVisit.pop();

        if(used[node]) continue;
        used[node]=true;

        if(previous[node]!=-1){
            ///push the edge in both directions. important - the edge is previous[node] <-> node and the weight can be found in dist[node]
            ///since this is the minimal distance adding the vertice node to the graph
            tree[previous[node]].push_back({node,dist[node]});
            tree[node].push_back({previous[node],dist[node]});
            minCost+=dist[node];
        }

        for(auto edge:gr[node]){///for each of its neighbors (important! edge is a pair of ints here)
            if(!used[edge.first] && dist[edge.first]>edge.second){///if this edge adds the vertice edge.second to the graph with a smaller weight than we have previously found
                dist[edge.first]=edge.second;
                previous[edge.first]=node;///the edge that adds edge.first to the graph is node <-> edge.first
                toVisit.push({edge.second,edge.first});///push in queue
            }
        }
    }
    cout<<minCost<<endl;
}

int main(){
    init();
    buildGraph();
    mst();
    return 0;   
}

/*
5 3 8
alabalak
alamento 
alakonsd 
kefecmef 
liekcker

5 2 6
stanco
stavri
stamat
georgi
gencho
*/