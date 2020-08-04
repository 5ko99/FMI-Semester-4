#include<cstdio>
#include<vector>
#include<algorithm>

using namespace std;

struct Edge{
    int from,to,weight;

    bool operator < (const Edge &target)const{
        return this->weight < target.weight;
    }
}

edges[100000];

int m,n;
int dsuParent[10000];
vector<pair<int,int> >mst[10000];

void init(){
    scanf("%d %d",&n,&m);
    for(int i=0;i<m;i++){
        scanf("%d %d %d",&edges[i].from,&edges[i].to,&edges[i].weight);
    }
    for(int i=0;i<n;i++){
        dsuParent[i]=i;
    }
}

int getRoot(int node){
    if(node==dsuParent[node])return node;

    return dsuParent[node]=getRoot(dsuParent[node]);
}


void mstUnite(int root1, int root2){
    dsuParent[root1]=root2;
}

void Kruskal(){
    sort(edges,edges+m);

    for(int i=0;i<m;i++){
        int root1 = getRoot(edges[i].from);
        int root2 = getRoot(edges[i].to);

        if(root1 == root2)continue;

        mst[edges[i].from].push_back({edges[i].to,edges[i].weight});
        mst[edges[i].to].push_back({edges[i].from,edges[i].weight});

        mstUnite(root1,root2);
    }
}

void print(){
    for(int i=0;i<n;i++){
        printf("neighbors of %d: ",i);
        for(int j=0;j<mst[i].size();j++){
            printf("%d ",mst[i][j].first);
        }
        printf("\n");
    }
}

int main(){
    init();
    Kruskal();
    print();
} 
