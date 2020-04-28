#include <iostream>
#include <vector>
using namespace std;

template <class T>
unsigned long merge(vector<T>& arr, unsigned long l, unsigned long m, unsigned long r){
    unsigned long i,j,k;
    unsigned long n1=m-l+1;
    unsigned long n2=r-m;
    unsigned long invCount=0;
    vector<T> L(n1),R(n2);
    for(i=0;i<n1;++i)
        L[i]=arr[l+i];
    for(i=0;i<n2;++i)
        R[i]=arr[m+1+i];
    i=0;j=0;k=l;
    while(i<n1&&j<n2){
        if(L[i]<=R[j]){
            arr[k++]=L[i++];
        }else{
            arr[k++]=R[j++];
            invCount+=n1-i;
        }
    }
    while(i<n1)
        arr[k++]=L[i++];
    
    while(j<n2)
        arr[k++]=R[j++];
    
    return invCount;
}
template <class T>
unsigned long mergeSort(vector<T>& arr, unsigned long l, unsigned long r){
    unsigned long invCount=0;
    if(l<r){
        unsigned long m=(l+r)/2;
        invCount+=mergeSort(arr,l,m);
        invCount+=mergeSort(arr,m+1,r);
        invCount+=merge(arr,l,m,r);
    }
    return invCount;
}

template <class T>
void printArr(const vector<T>& arr){
    for(auto i:arr){
        cout<<i<<' ';
    }
    cout<<'\n';
}

void cinArr(vector<long>& arr, unsigned long n){
    for(auto i=0;i<n;++i){
        scanf("%li",&arr[i]);
    }
}
int main() {
    unsigned long n;
    scanf("%li",&n);
    vector<long> arr(n);
    cinArr(arr,n);
    cout<<mergeSort(arr,0,arr.size()-1)<<endl;
    //mergeSort(arr,0,arr.size()-1);
    printArr(arr);
    return 0;
}
