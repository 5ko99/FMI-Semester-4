#include<iostream>
#include<vector>
#include<climits>
#include<algorithm>
using namespace std;
#define INF INT_MAX

struct Box{
    unsigned index;
    unsigned count;

    bool operator<(const Box& b) const {
        return count<b.count;
    }
};

int n,s;
vector<Box> box(100000);

void init(){
    scanf("%d %d",&n,&s);
    
    for(int i=0;i<n;++i){
        int x,y;
        scanf("%d %d",&x,&y);
        box[i].index=i;
        box[i].count=x+y;
    }
}

void solve(){
    sort(box.begin(),box.begin()+n);
    unsigned min=INF;
    int l=0,r=n-1;
    unsigned box1=-1, box2=-1;
    while(l<r){
        int tmp = box[l].count+box[r].count;
        if(abs(s-tmp)<min){
            min = abs(s-tmp);
            box1=box[l].index;
            box2=box[r].index;
        }
        if(tmp>s) --r;
        if(tmp<s) ++l;
        if(tmp==s) break; 
    }
    if(box1>box2) swap(box1,box2);
    printf("%d\n%d %d\n",min,box1,box2);
}


int main(){
    init();
    solve();
    return 0;   
}

/*
8 35
3 4
13 3
3 0
3 15
0 12
9 2
5 8
10 10
*/