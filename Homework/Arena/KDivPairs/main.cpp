#include <iostream>
#include <vector>
#include <unordered_map>
using namespace std;

int countKDivPairs(vector<int>& arr, int k){
    unordered_map<int,int> frequencies;
    int ans=0,rem,n=arr.size(),i;
    for(i=0;i<n;++i){
        rem=arr[i]%k;
        if(rem!=0)
            ans+=frequencies[k-rem];
        else
            ans+=frequencies[0];
        ++frequencies[rem];
    }
    return ans;
}

int main() {
    vector<int> arr={ 2, 2, 1, 7, 5, 3 };
    int k=4;
    cout<<countKDivPairs(arr,k)<<endl;
    return 0;
}
