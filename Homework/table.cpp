#include<iostream>
#include<vector>
using namespace std;

int paths(int n, int m, vector<vector<bool>>& cells){
    vector<vector<int>> value(n+1,vector<int>(m+1,0));
    for(int i=n;i>=0;--i){
        for(int j=m;j>=0;--j){
            if(i==n&&j==m){
                value[i][j]=1;
            } else{
            if(j==m){
                if(cells[i][j]==false)
                    value[i][j]=0;
                else 
                    value[i][j]=value[i+1][j];
            } else if(i==n){
                if(cells[i][j]==false)
                    value[i][j]=0;
                else 
                    value[i][j]=value[i][j+1];
            } else{
                if(cells[i][j]==0)
                    value[i][j]=0;
                else 
                    value[i][j]=value[i+1][j]+value[i][j+1];
                }
            }
        }
    }
    return value[0][0];
}

int main(){
    int m,n;
    cout<<"Enter n and m"<<endl;
    cin>>n>>m;
    vector<vector<bool>> cells(n+1,vector<bool>(m+1,true));
    while (cin) {
        int x,y;
        cin>>x>>y;
        if((x<=n&&y<=m)&&(x>=0&&y>=0)){
            cells[x][y]=false;
        } else{
            break;
        }
    }      
    cout<<"Paths:"<<paths(n,m,cells)<<endl; 
    return 0;
}
