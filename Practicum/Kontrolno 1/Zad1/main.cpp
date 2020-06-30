#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

struct Student{
    char name[6];
    int fn;
    int points;
    bool operator<(const Student& s) const{
        if(points<s.points){
            return true;
        }else if(points==s.points){
            return fn<s.fn;
        }else{
            return false;
        }
    }
};

int n,q;
vector<Student> arr(100000);
vector<int> pointsArr(100000);

void init(){
    scanf("%d %d",&n,&q);
    for(int i=0;i<n;++i){
        scanf("%s %d %d",&arr[i].name,&arr[i].fn,&arr[i].points);
    }
    
    for(int i=0;i<q;++i){
        scanf("%d",&pointsArr[i]);
    }
}

void solve(){
    sort(arr.begin(),arr.begin()+n);
    for(int i=0;i<q;++i){
        int points=pointsArr[i];
        int l=0,r=n-1;
        int res=-1;
        while(l<=r){
            int mid=l+(r-l)/2;
            if(arr[mid].points>=points){
                res=mid;
                r=mid-1;
            }else{
                l=mid+1;
            }
        }
        printf("%s %d\n",arr[res].name,arr[res].fn);
    }
}

int main(){
    init();
    solve();
    return 0;   
}
