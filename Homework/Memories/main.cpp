#include <iostream>
#include <cstdio>
#include <algorithm>
using namespace std;
struct Interval{
    int start,end;
    bool operator<(Interval& x){
        if(start==x.start) return end > x.end;
        else return start<x.start;
    }
};
int n,res=0,i;
Interval arr[1000001];
bool used[1000001]={false};
void numOfOverlaps(){
    sort(arr,arr+n-1);
    int pre=0;
    for(i=1;i<n;++i){
        if(arr[i].end<=arr[pre].end){
            ++res;
            used[i]=true;
        }
        else {
            ++pre;
        }
    }
}
int main() {
    scanf("%d",&n);
    for(i=0;i<n;++i){
        scanf("%d %d",&arr[i].start,&arr[i].end);
    }
    numOfOverlaps();
    printf("%d \n",res);
    return 0;
}
/*
5
1 10
2 9
3 8
4 7
5 6

3
2 4
2 3
1 4

3
1 6
2 5
3 4

4
1 3
5 7
2 4
6 8
*/