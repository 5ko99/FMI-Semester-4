#include <iostream>
#include <vector>
using namespace std;
template <class T>
void siftUp(vector<T>& arr,int ind){
    while(ind!=0 && arr[ind] < arr[(ind - 1) / 2]){
        swap(arr[ind], arr[(ind - 1) / 2]);
        ind=(ind-1)/2;
    }
}
template <class T>
void siftDown(vector<T>& arr,int ind, unsigned long n){
    int left=ind*2+1;
    int right=ind*2+2;
    int indToChange=ind;
    if(left>=n) return;
    if(arr[ind] > arr[left]) indToChange=left;
    if(right<n && arr[indToChange] > arr[right]) indToChange=right;
    if(indToChange==ind) return;
    std::swap(arr[ind], arr[indToChange]);
    siftDown(arr,indToChange,n);
}
template <class T>
vector<T> heapSort(vector<T>& arr){
    long n = arr.size();
    vector<T> sorted(n);
    unsigned long c=n;
    for(long i=n-1;i>=0;--i){
        siftUp(arr,i);
    }
    for(int i=0;i<n;++i){
        sorted[i]=arr[0];
        swap(arr[0],arr[c-1]);
        c--;
        siftDown(arr,0,c);
    }
    return sorted;
}
template <class T>
void arrCin(vector<T>& arr, unsigned long n){
    for(auto i=0;i<n;++i)
        cin>>arr[i];
}
template <class T>
void printArr(vector<T>& arr){
    for(auto i:arr)
        cout<<i<<' ';
    cout<<'\n';
}
int main() {
    unsigned long n;
    cin>>n;
    vector<int> arr(n);
    arrCin(arr,n);
    arr=heapSort(arr);
    printArr(arr);
    return 0;
}
