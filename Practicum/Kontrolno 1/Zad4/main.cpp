#include<iostream>
#include<vector>
#include<algorithm>
using namespace std;

struct record{
    int data;
    int index;

    bool operator<(const record& r) const{
        if(data==r.data){
            return index<r.index;
        }
        return data<r.data;
    }
};

int n,k;
vector<int> arr(300003); 
vector<record> sortedArr(300003);



void init(){
    scanf("%d %d",&n,&k);
    for(int i=0;i<n;++i){
        scanf("%d",&arr[i]);
    }
}

bool comp(const record& r1, const record& r2){
    return r1.index>r2.index;
}

struct rec{
    int index;
    int res;
};

bool comp2(const rec& r1, const rec& r2){
    return r1.index<r2.index;
}
vector<record> res(300003);

void recu(int l, int r,int data, int index, int i) {
    if(l>r){
        return;
    }
    int mid = l + (r-l)/2;
        if(sortedArr[mid].index<index&&sortedArr[mid].data<data&&data-sortedArr[mid].data<=k){
            if(res[i].index<sortedArr[mid].index)
                res[i]={sortedArr[mid].data,sortedArr[mid].index};
        }
        if(sortedArr[mid].data>=data)
            recu(l,mid-1,data,index,i);
        if(sortedArr[mid].data<data){
            if(data-sortedArr[mid].data>k)
                recu(mid+1,r,data,index, i);
            else{
                recu(mid+1,r,data,index, i);
                recu(l,mid-1,data,index, i);
            }

}
}

void solve(){
    //res.assign(n,{-1,-1});
    for(int i=0;i<n;++i){
        sortedArr[i].data=arr[i];
        sortedArr[i].index = i;
    }
    sort(sortedArr.begin(),sortedArr.begin()+n);
    for(int i=0;i<n;++i){
        int data = sortedArr[i].data;
        int index= sortedArr[i].index;
        int l=0,r=n-1;
        recu(l,r,data,index, i);
    }

    vector<rec> resInOrder(300003);
    for(int i=0;i<n;++i){
        if(res[i].data==0&&res[i].index==0)
            resInOrder[sortedArr[i].index] = {sortedArr[i].index,-1};
        else
            resInOrder[sortedArr[i].index]={sortedArr[i].index,res[i].index};
    }
    sort(resInOrder.begin(),resInOrder.begin()+n,comp2);
    

    for(int i=0;i<n;++i){
        // if(res[i].empty())
        //     printf("For index %d is index -1 \n",sortedArr[i].index);
        // else
        //     printf("For index %d is index %d \n",sortedArr[i].index,res[i][0].index);
        //printf("For index %d is index %d \n",i,resInOrder[i].res);
        printf("%d ",resInOrder[i].res);
    }
    printf("\n");
}

int main(){
    init();
    solve();
    return 0;   
}
