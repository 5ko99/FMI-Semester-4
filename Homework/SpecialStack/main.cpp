#include <iostream>
#include <stack>
using namespace std;

struct MyStack{
    stack<int> s;
    int minEle;

    int getMin(){
        if(s.empty()){
            cerr<<"Stack is empty!"<<endl;
            return INT8_MAX;
        }
        return minEle;
    }
    int top(){
        if(s.empty()){
            cerr<<"Stack is empty!"<<endl;
            return INT8_MAX;
        }
        int t=s.top();
        return (t<minEle)?  minEle:  t;
    }

    int pop(){
        if(s.empty()){
            cerr<<"Stack is empty!"<<endl;
            return INT8_MAX;
        }
        int t=s.top();
        s.pop();
        if(t<minEle){
            int t2=minEle;
            minEle=2*minEle-t;
            return t2;
        }else{
            return t;
        }
    }

    void push(int x){
        if(s.empty()){
            minEle=x;
            s.push(x);
            return;
        }
        if(x<minEle){
            s.push(2*x-minEle);
            minEle=x;
        }else{
            s.push(x);
        }
    }
};

int main() {
    MyStack s;
    cout<<"Pushed:"<<3<<endl;
    s.push(3);
    cout<<"Pushed:"<<5<<endl;
    s.push(5);
    cout<<"Min="<<s.getMin()<<endl;
    cout<<"Pushed:"<<2<<endl;
    s.push(2);
    cout<<"Pushed:"<<1<<endl;
    s.push(1);
    cout<<"Min="<<s.getMin()<<endl;
    cout<<"Pop="<<s.pop()<<endl;
    cout<<"Min="<<s.getMin()<<endl;
    cout<<"Pop="<<s.pop()<<endl;
    cout<<"Top="<<s.top()<<endl;
    cout<<"Min="<<s.minEle<<endl;
    return 0;
}
