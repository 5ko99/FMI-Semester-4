//solution taht useses more time and less memory
#include<iostream>
#include<vector>
#include<algorithm>
#include<climits>
using namespace std;
#define INF INT_MAX
#define NINF INT_MIN

struct Edge{
    int from,to,price,time;
};

vector<Edge> e;
int n,m,k,s,f,low=INF,high=NINF;
void init(){
    int from,to,price,time;
    scanf("%d %d %d",&n,&m,&k);
    for(int i=0;i<m;++i){
        scanf("%d %d %d %d",&from,&to,&price,&time);
        if(low>price)
            low=price;
        if(high<price)
            high=price;
        e.push_back({from-1,to-1,price,time});
    }
    s=0;
    f=n-1;
}

vector<int> times;
void ford(int maxPrice){
    times.assign(100000,INF);
    times[s]=0;
    bool any=true;
    while(any){
        any=false;
        for (int j=0; j<m; ++j){
            if(e[j].price<=maxPrice&&times[e[j].from]<INF){
                    if(times[e[j].to]>times[e[j].from]+e[j].time){
                        times[e[j].to]=times[e[j].from]+e[j].time;
                        any=true;
                    }
            }
        }
    }
}

void binSearch(int l, int h){
    int best=INF;
    while(l<=h){
        int mid=l+(h-l)/2;

        ford(mid);
        if(times[f]<=k){
            best=mid;
            h=mid-1;
        }

        if(times[f]>k){
            l=mid+1;
        }
    }
    if(best==INF)
        printf("-1 \n");
    else
        printf("%d \n",best);
}

int main(){
    init();
    binSearch(low,high);
    return 0;   
}

/* 
7 11 42
1 3 7 11
3 1 7 13
1 2 3 3
1 4 13 1
6 1 14 8
4 6 1 7
2 4 1 13
2 6 4 20
3 5 2 5
5 6 6 4
6 7 5 20

2 2 3                                                                  
1 2 3 5
1 2 1 9

*/
