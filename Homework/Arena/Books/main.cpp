#include<iostream>
#include<vector>
using namespace std;

vector<unsigned> arr(300000);

int main() {
    int n;
    scanf("%d",&n);
    for (int i=0;i<n;++i) {
        scanf("%d",&arr[i]);
    }
    int track = n;
    int count = 0;
    for (int i = n-1;i>=0;--i) {
        if (arr[i] == track) {
            ++count;
            --track;
        }
    }
    printf("%d\n",n-count);
}