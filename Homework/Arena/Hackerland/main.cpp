#include<iostream>
#include <cstdio>
#include<vector>
#include <algorithm>
using namespace std;


int task(vector<int>& x,int k){
    /* Key is to use greedy algorithm to always place the transmitter at the house furthest to the right possible
	 * to cover the range.
*/
    int n=x.size(), numOfTransmitters = 0, i=0, loc;
    while (i < n) {
        numOfTransmitters++;
        loc = x[i] + k; //let this i be i_orig go to right as far as we cover i_orig as well.
        while (i < n && x[i] <= loc) i++;
        loc = x[--i] + k;
        cout<<x[i]<<' '; //this is where we place the transmitter
        //now go to the right of x[i] by k because transmitter at x[i] covers houses to its right as well.
        while (i < n && x[i] <= loc) i++;
    }
    cout<<endl;
    return numOfTransmitters;
}

int main(){
    int n,k;
    scanf("%d %d",&n,&k);
    vector<int> arr(n);
    for(int i=0;i<n;++i){
        scanf("%d",&arr[i]);
    }
    sort(arr.begin(),arr.begin()+n);
    cout<<task(arr,k)<<endl;
    return 0;
}
