#include <iostream>
#include<vector>
using namespace std;
int binarySearch(vector<int>& arr, int l, int r, int x){
    while(l<=r){
        int m=l+(r-l)/2;
        if(arr[m]==x)
            return m;
        if(x>arr[m])
            l=m+1;
        else
            r=m-1;
    }
    return -1;
}
int leftMostOccurrence(int* arr, int n, int x)
{
    int left = 0, right = n-1, result = -1;
    while(left <= right)
    {
        int mid = (left + right)/2;
        if(x == arr[mid])
        {
            result = mid;
            right = mid - 1;
        }
        else if(x < arr[mid])
        {
            right = mid - 1;
        }
        else
        {
            left = mid + 1;
        }
    }
    return result;
}
int main() {
    vector<int> arr={1,2,3,4,5,6,7,8,9,10};
    cout<<binarySearch(arr,0,9,10)<<endl;
    return 0;
}
