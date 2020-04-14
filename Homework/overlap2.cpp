#include <algorithm> 
#include <iostream> 
using namespace std; 

struct Interval { 
	int start, end;
}; 

Interval arr[1000001]; 
int n, res=0, i;

void numOfOverlaps(){ 
	int max_ele = 0; 
	for (int i = 0; i < n; i++) { 
		if (max_ele < arr[i].end) 
			max_ele = arr[i].end; 
	} 
	int aux[max_ele + 1] = { 0 }; 
	for (int i = 0; i < n; i++)
		aux[arr[i].start]++, aux[arr[i].end + 1]--; 
	for (int i = 1; i <= max_ele; i++) { 
		aux[i] += aux[i - 1]; 
		if (aux[i] > 1) 
			++res;
	} 
} 

int main() { 
	scanf("%d",&n);
    for(i=0;i<n;++i){
        scanf("%d %d",&arr[i].start,&arr[i].end);
    }
    numOfOverlaps();
    printf("%d \n",res);
    return 0;
} 
