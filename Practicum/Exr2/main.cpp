#include <iostream>
using namespace std;
int tree[10000];
int last;
void siftUp(int ind){
    while(ind!=0 && tree[ind]<tree[(ind-1)/2]){
        swap(tree[ind],tree[(ind-1)/2]);
        ind=(ind-1)/2;
    }
}
void siftDown(int ind){
    int left=ind*2+1;
    int right=ind*2+2;
    int indToChange=ind;
    if(left>last) return;
    if(tree[ind]>tree[left]) indToChange=left;
    if(right<=last && tree[indToChange]>tree[right]) indToChange=right;
    if(indToChange==ind) return;
    swap(tree[ind],tree[indToChange]);
    siftDown(indToChange);
}
int main() {

    return 0;
}
