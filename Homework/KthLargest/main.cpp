#include<iostream>
#include<algorithm>
#include<climits>
using namespace std;

//called only over arrays with size 5
int findMedian(int arr[], int n){
    sort(arr,arr+n);
    return arr[n/2];
}

int part(int arr[], int l, int r, int x){
    int i,j;
    for(i=l;i<r;++i)
        if(arr[i]==x)
            break;
    swap(arr[i],arr[r]);//put pivot to the end
    i=l;
    for(j=l;j<r;++j){
        if(arr[j]<=x){
            swap(arr[i],arr[j]);
            ++i;
        }
    }
    swap(arr[r],arr[i]);
    return i;
}

int kthSmallest(int arr[], int l, int r, int k){
    if(k>0&&k<=r-l+1){
        int n=r-l+1,i;
        int median[(n+4)/5];
        for(i=0;i<n/5;++i){
            median[i]=findMedian(arr+l+i*5,5);
        }
        if(i*5<n){//if there are any left
            median[i]=findMedian(arr+l+i*5,n%5);
            ++i;
        }
        // Find median of all medians using recursive call.
        // If median[] has only one element, then no need
        // of recursive call
        int medOfMed=(i==1)? median[i-1]: kthSmallest(median,0,i-1,i/2);
        int pos=part(arr,l,r,medOfMed);

        if(pos-l==k-1) {
            return arr[pos];
        } else if(pos-l>k-1) {
            return kthSmallest(arr, l, pos - 1, k);
        } else {
            return kthSmallest(arr, pos + 1, r, k - pos + l - 1);
        }
    }
    return INT_MAX;
}

int main(){
    int n,k;
    cin>>n>>k;
    int *arr = new int[n];
    for(int i=0;i<n;++i)
        cin>>arr[i];
    cout<<kthSmallest(arr,0,n-1,k)<<endl;
    delete [] arr;
    return 0;
}
