#include<iostream>
#include<vector>
#include<algorithm>
#include<climits>
using namespace std;
#define INF INT_MAX

/*
    0 - NO friends & NO study
    1 - NO friends & study
    2-  friends & NO study
    3- friends & study

    dp1 - брой почивни дни ако на i-тия ден Гошо учи
    dp2 - брой почивни дни ако на i-тия ден Гошо излиза
    dp3 - брой почивни дни ако на i-тия ден Гошо си почива
*/

int n,a,dp1,dp2,dp3,newDp1,newDp2,newDp3;

void init(){
    scanf("%d",&n);
    for(int i=0;i<n;++i){
        scanf("%d",&a);

        if(a==1||a==3){//he can study
            newDp1 = min(dp2,dp3);//min of previous day friends or rest
        }else{
            newDp1=INF;//if he can't study then INF mark this
        }
        if(a==2||a==3){//he can go out with firends
            newDp2=min(dp1,dp3);//min of previous day study or rest
        }else{
            newDp2=INF;// if he can't go out with friends then INF mark this
        }
        newDp3=min(dp1,min(dp2,dp3))+1;//he can always rest, no matter the previos day. So min of previous day +1

        dp1=newDp1;
        dp2=newDp2;
        dp3=newDp3;
    }
    printf("%d\n",min(dp1,min(dp2,dp3)));
}


int main(){
    init();
    return 0;   
}

/*
4
1 3 2 0

2
0 0

2
3 3
*/
