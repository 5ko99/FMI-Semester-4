#include <cstdio>
long merge(unsigned long arr[],int l, int m, int r){
    int i,j,k,n1,n2;
    n1=m-l+1;
    n2=r-m;
    long invCount=0;
    auto *L=new int[n1];
    auto *R=new int[n2];
    for(i=0;i<n1;++i)
        L[i]=arr[l+i];
    for(j=0;j<n2;++j)
        R[j]=arr[m+1+j];
    i=0;j=0;k=l;
    while(i<n1&&j<n2){
        if(L[i]<=R[j]){
            arr[k]=L[i++];
        }else{
            arr[k]=R[j++];
            invCount+= n1-i;
        }
        ++k;
    }
    while(i<n1)
        arr[k++]=L[i++];
    while(j<n2)
        arr[k++]=R[j++];

    delete[] L;
    delete[] R;
    return invCount;
}

 long mergeSort(unsigned long arr[],int l, int r){
    long invCount=0;
    if(l<r){
        int m=(l+r)/2;
        invCount+=mergeSort(arr,l,m);
        invCount+=mergeSort(arr,m+1,r);
        invCount+=merge(arr,l,m,r);
    }
     return invCount;
}

int main() {
    int n,i;
    scanf("%i",&n);
    auto *arr= new unsigned long[n];
    for(i=0;i<n;++i)
        scanf("%li",&arr[i]);
    long invCount=mergeSort(arr,0,n-1);
    printf("%li",invCount);
    delete[] arr;
    return 0;
}
