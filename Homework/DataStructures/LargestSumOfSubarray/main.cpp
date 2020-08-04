#include <iostream>
#include <vector>
#include <unordered_map>
using namespace std;
int maxLen(vector<int>& arr){
    unordered_map<int,int> preSum;
    int sum=0,maxLen=0,n=arr.size(),i;
    for(i=0;i<n;++i){
        sum+=arr[i];
        if(arr[i]==0&& maxLen==0) maxLen=1;
        if(sum==0) maxLen=i+1;
        if(preSum.find(sum)==preSum.end()){
            maxLen=max(maxLen,i-preSum[sum]);
        } else{
            preSum[sum]=i;
        }
    }
    return maxLen;
}
int maxLenForBool(vector<bool>& arr){
    unordered_map<int,int> preSum;
    int sum=0,maxLen=0,n=arr.size(),i;
    for(i=0;i<n;++i){
        (arr[i])? sum++ : sum--;
        if(sum==0) maxLen=i+1;
        if(preSum.find(sum)==preSum.end()){
            maxLen=max(maxLen,i-preSum[sum]);
        } else{
            preSum[sum]=i;
        }
    }
    return maxLen;
}
int main() {
    vector<int> arr={ 15, -2, 2, -8, 1, 7, 10, 23 };
    cout<<"Length of the longest 0 sum subarray is "<<maxLen(arr)<<endl;
    vector<bool> arr2={true, false, false, true, false, true, true};
    cout<<"Length of largest subarray with equal number of 0s and 1s is "<<maxLenForBool(arr2)<<endl;
    return 0;
}
