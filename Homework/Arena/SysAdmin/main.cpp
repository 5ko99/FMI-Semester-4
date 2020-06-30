#include <iostream>
using namespace std;

int n, k,parts[10009],left=1,right=-1;
void init(){
    scanf("%d %d",&n,&k);
    for(int i=0;i<n;i++){
        scanf("%d",&parts[i]);
        if(parts[i]>right) right = parts[i];
    }
}
bool checkForLen(int len){
    int partsN=0;
    for(int i=0;i<n;++i){
        partsN+=(parts[i]/len);
    }
    return partsN>=k;
}
int binSearch(){
    int ans=-1;
    while(left<=right){
        int mid= left+(right-left)/2;
        if(checkForLen(mid)){
            ans=mid;
            left=mid+1;
        }else{
            right = mid-1;
        }
    }
    return ans;
}
int main() {
    init();
    printf("%d\n",binSearch());
    return 0;
}
