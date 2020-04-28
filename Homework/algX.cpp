#include<iostream>
#include<vector>
using namespace std;

void algXSort(vector<int>& arr){
    int l=0,r=arr.size()-1;
    while(l<r){
        if(arr[l]>arr[r])
            swap(arr[l],arr[r]);
        ++l;--r;
    }
}

int main(){
    vector<int> arr = {9,7,6,5,4,2};
    algXSort(arr);
    for(int i=0;i<arr.size();++i)
        cout<<arr[i]<<endl;
    return 0;
}