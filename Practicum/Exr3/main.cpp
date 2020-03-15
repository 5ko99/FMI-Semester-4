#include <iostream>

int n, k,parts[10009];
void init(){
    scanf("%d %d",&n,&k);
    for(int i=0;i<n;i++){
        scanf("%d",&parts[i]);
    }
}
bool checkForLen(int len){
    long long sum=0;
    for(int i=0;i<n;++i){
        sum+=(parts[i]/len);
    }
    return sum>=k;
}
int binSearch(){
    int left=1,right=100000000,mid;
    int ans=-1;
    while(left<=right){
        mid=(left+right)/2;
        if(!checkForLen(mid)) right= mid - 1;
        else{
            ans=mid;
            left=mid+1;
        }
    }
    return ans;
}
int main() {
    init();
    printf("%d\n",binSearch());
    return 0;
}
