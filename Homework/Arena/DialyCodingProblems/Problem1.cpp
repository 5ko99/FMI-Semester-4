#include<iostream>
#include<unordered_set>
#include<vector>
using namespace std;

//Без повтарящи се числа!
bool add_up_to_k(vector<int>& arr, int k){
    int n=arr.size(), dif, i;
    unordered_set<int> nums;
    for(i=0;i<n;++i)
        nums.insert(arr[i]);

    for(i=0;i<n;++i){
        dif=k-arr[i];
        if(nums.find(dif)!=nums.end()){
            return true;
        }
        nums.insert(arr[i]);
    }
    return false;
}

int main(){
    int n,k,i;
    scanf("%d %d",&n,&k);
    vector<int> arr(n);
    for(i=0;i<n;++i)
        scanf("%d",&arr[i]);
    printf("%s\n", add_up_to_k(arr,k)?"TRUE":"FALSE");
    return 0;
}

/*
    4 17
    10 15 3 7

    4 15
    10 15 3 7

    4 20
    10 15 3 10

    4 20
    10 15 3 7
 */
