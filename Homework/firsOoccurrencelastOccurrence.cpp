#include<iostream>
#include<vector>
using namespace std;
int leftMostOccurrence(vector<int>& arr, int x){
    int left=0,right=arr.size()-1, result = -1;
    while (left<=right){
        int mid=left+(right-left)/2;
        if(arr[mid]==x){
            result=mid;
            right=mid-1;
        } else if(x<arr[mid]){
            right=mid-1;
        }else{
            left=mid+1;
        }
    } 
    return result;
}

int rightMostOccurrence(vector<int>& arr, int x){
    int left=0,right=arr.size()-1, result = -1;
    while (left<=right)
    {
        int mid=left+(right-left)/2;
        if(x==arr[mid]){
            result=mid;
            left=mid+1;
        }else if(x<arr[mid]){
            right=mid-1;
        }else{
            left=mid+1;
        }
    } 
    return result;
}

int main(){
    vector<int> arr={5,5,5,5,6,8,13,18,18,18,667,1000,1001,204};
    cout<<leftMostOccurrence(arr,5)<<' '<<rightMostOccurrence(arr,18)<<endl;
    cout<<leftMostOccurrence(arr,18)<<' '<<rightMostOccurrence(arr,5)<<endl;
    return 0;
}
