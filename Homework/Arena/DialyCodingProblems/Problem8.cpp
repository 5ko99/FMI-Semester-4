#include<iostream>
using namespace std;
struct node{
    node *left, *right;
    char data;
    node(char _data='a', node *_left=nullptr, node *_right=nullptr):data(_data),left(_left),right(_right){}
};

bool unival_helper(node* root, char data){
    if(root==nullptr)
        return true;
    if(root->data==data)
        return unival_helper(root->left,data)&&unival_helper(root->right,data);
    else
        return false;
}

bool is_unival(node* root){
    return unival_helper(root,root->data);
}

int count_unival_subtrees(node* root){
    if(root==nullptr)
        return 0;
    int left=count_unival_subtrees(root->left);
    int right=count_unival_subtrees(root->right);
    if(is_unival(root))
        return 1+left+right;
    else
        return left+right;
}


int main(){
    node root('a'), left1('c'),right1('b'),left2('b'),right2('b'),right3('b');
    root.left=&left1;root.right=&right1;right1.left=&left2;right1.right=&right2;right2.right=&right3;
    cout<<count_unival_subtrees(&root);
    return 0;
}
