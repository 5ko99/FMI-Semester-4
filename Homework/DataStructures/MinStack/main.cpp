#include<iostream>
#include<vector>
#include<algorithm>
#include<stack>
using namespace std;

template<class T>
struct record{
    T data;
    T minBellow;
};

template<class T>
class minStack{
    stack<record<T>> s;
public:
    void push(T data){
        T new_min;
        if(s.empty()){
            new_min = data;
        } else if(data<s.top().minBellow) {
            new_min = data;
        }else{
            new_min = s.top().minBellow;
        }
        s.push({data,new_min});
    }
    bool empty(){
        return s.empty();
    }
    size_t size(){
        return s.size();
    }
    T top(){
        return s.top().data;
    }
    T pop(){
        T data = s.top().data;
        s.pop();
        return data;
    }
    T min(){
        T data = s.top().minBellow;
        return data;
    }
};

int main(){
    minStack<int> s;
    s.push(5);
    s.push(3);
    s.push(1);
    s.push(8);
    cout<<s.top()<<' '<<s.min()<<' '<<endl;
    s.pop();
    s.pop();
    cout<<s.top()<<' '<<s.min()<<endl;
    s.push(9);
    s.push(10);
    cout<<s.top()<<' '<<s.min()<<endl;
    s.push(-2);
    cout<<s.top()<<' '<<s.min()<<endl;
    s.push(-1);
    s.push(0);
    cout<<s.top()<<' '<<s.min()<<endl;
    cout<<s.size()<<endl;
    return 0;   
}
