#include <iostream>
using namespace std;

void siftUp(unsigned long arr[],int ind){
    while(ind!=0 && arr[ind] < arr[(ind - 1) / 2]){
        std::swap(arr[ind], arr[(ind - 1) / 2]);
        ind=(ind-1)/2;
    }
}
void siftDown(unsigned long arr[],int ind, int n){
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
void heapSort(unsigned long arr[], int n){
   auto *sorted = new unsigned long[n];
   int c=n;
   for(int i=n;i>=0;--i){
       siftUp(arr,i);
   }
   for(int i=0;i<n;++i){
       sorted[i]=arr[0];
       std::swap(arr[0],arr[c-1]);
       c--;
       siftDown(arr,0,c);
   }
   for(int i=0;i<n;++i){
        cout<<sorted[i]<<' ';
   }
   cout<<endl;
   delete[] sorted;
}
int main() {
    unsigned long arr[]={5,8,6,11,3,58,4,2,3,456};
    int n=sizeof(arr)/sizeof(arr[0]);
    heapSort(arr,n);
    //printArray(arr);
    return 0;
}
