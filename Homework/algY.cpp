#include<iostream>
#include<vector>
using namespace std;

int calculateH(vector<int>& arr){
    int n=arr.size();
    vector<unsigned int> c(n,0);
    for(int i=0;i<n;++i){
        if(arr[i]>n-1)
            ++c[n-1];
        else
            ++c[arr[i]];
    }
    int s=0,h=n;
    for(auto i:c)
        cout<<i<<endl;
    while (h>s){
        --h;
        s+=c[h];
    }
    return h;
}

int main(){
    int n;
    cin>>n;
    vector<int> arr(n);
    for(int i=0;i<n;++i)
        cin>>arr[i];
    cout<<calculateH(arr)<<endl;
    return 0;
}