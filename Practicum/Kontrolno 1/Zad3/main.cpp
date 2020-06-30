#include<iostream>
#include<vector>
#include<algorithm>
using namespace std;

//n-size
//k-ships
//a-size of each ship
//q-shots

vector<int> shots(200000), field(200000);
int n,k,a,q;

struct node{
    int data;
    int pos;
    node *left;
    node *right;
    node(int _data=0,int _pos=0,node* _left=nullptr,node* _right = nullptr):data(_data),pos(_pos),left(_left),right(_right){}
};

void init(){
    scanf("%d %d %d",&n,&k,&a);
    scanf("%d",&q);
    field.assign(n,-1);
    for(int i=0;i<q;++i){
        scanf("%d",&shots[i]);
    }
}

bool rec(node* root, int shot){
    if(root==nullptr){
        return true;
    }
    if(shot>root->pos){//right subtree
        int data= (n-shot-1)/a;
        node* right = new node(data,shot);
        root->right = right;
    }else{//left subtree
        int data=shot/a;
        node* left = new node(data,shot);
        root->left = left;
    }
    return 
}

void solve(){
    node* root = new node(n/a);
    for(int i=0;i<q;++i){
        int shot= shots[i]-1;
        node* left = new node(shot/a);
        node* right = new node((n-shot-1)/a);
        root->left=left;root->right=right;
    }
}

int main(){
    init();
    solve();
    return 0;   
}
