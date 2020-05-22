#include<cstdio>
#include<vector>
using namespace std;

struct Node{
    int to,time;
};

vector<Node> graph[10000];
int n,m,startV,endV;
void init(){
    int from,to, time;
    scanf("%d %d",&n,&m);
    for(int i=0;i<m;++i){   
        scanf("%d %d %d",&from,&to,&time);
        graph[from].push_back({to,time});
    }
    scanf("%d %d",&startV,&endV);
}

vector<int> paths;
void countPaths(int u,int d,int curr=0) { 
    if (u == d){
       paths.push_back(curr);
    } else { 
        for(auto edge:graph[u]){
            countPaths(edge.to, d,curr+edge.time); 
        }           
    } 
}

int maxLen, numOfMaxLen=0;
void findMaxDistAndCount(){
    int c=paths.size();
    maxLen=paths[0];
    for(int i=1;i<c;++i)
        if(paths[i]>maxLen)
            maxLen=paths[i];
    for(int i=0;i<c;++i)
        if(paths[i]==maxLen)
            ++numOfMaxLen;
}

int main(){
    init();
    countPaths(startV,endV);
    findMaxDistAndCount();
    printf("%d %d \n",maxLen,numOfMaxLen);
    return 0;   
}

/*
6 8
3 4 2
3 0 1
0 2 1
3 2 4
4 2 2
1 3 5
0 5 1
5 2 2
3 2
*/