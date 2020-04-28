#include <iostream>
void siftUp(unsigned long arr[],int ind){
    while(ind!=0 && arr[ind] > arr[(ind - 1) / 2]){
        std::swap(arr[ind], arr[(ind - 1) / 2]);
        ind=(ind-1)/2;
    }
}
void siftDown(unsigned long arr[],int ind, int n){
    int left=ind*2+1;
    int right=ind*2+2;
    int indToChange=ind;
    if(left>=n) return;
    if(arr[ind] < arr[left]) indToChange=left;
    if(right<n && arr[indToChange] < arr[right]) indToChange=right;
    if(indToChange==ind) return;
    std::swap(arr[ind], arr[indToChange]);
    siftDown(arr,indToChange,n);
}
void add(unsigned long arr[],unsigned long number, int n){
    arr[n]=number;
    siftUp(arr,n);
}
void remove(unsigned long arr[], int n){
    if(n<1) {
        printf("Not available \n");
        return;
    }
    printf("%li \n",arr[0]);
    std::swap(arr[n-1],arr[0]);
    siftDown(arr,0,n-1);
}
void look(unsigned long arr[], int n){
    if(n<1) {
        printf("Not available \n");
        return;
    }
    printf("%li \n",arr[0]);
}
int main() {
    const int MAX_SIZE=1000000;
    auto arr = new unsigned long[MAX_SIZE];
    bool flag = true;
    char command;
    int n=0;
    unsigned long number;
    while(flag){
        scanf("%c",&command);
        if(command=='Q') flag=false;
        if(command=='A') {
            scanf(" %li", &number);
            add(arr, number, n);
            n++;
        }
        if(command=='R'){
            remove(arr,n);
            n--;
        }
        if(command=='L'){
            look(arr,n);
        }
    }
    return 0;
}
