#include <iostream>
#include <unordered_set>
using namespace std;

struct Node{
    int data;
    Node* next;
};
void push(Node** head, int data){
    Node* new_node = new Node;
    new_node->data=data;
    new_node->next=*head;
    (*head)=new_node;
}

bool detectLoop1(Node* head){
    unordered_set<Node*> set;
    while(head!= nullptr){
        if(set.find(head)!=set.end()){
            return true;
        }
        set.insert(head);
        head=head->next;
    }
    return false;
}

bool detectLoop2(Node* head){
    Node *slow_p=head, *fast_p=head;
    while(slow_p&&fast_p&&fast_p->next){
        slow_p=slow_p->next;
        fast_p=fast_p->next->next;
        if(slow_p==fast_p)
            return true;
    }
    return false;
}

int main() {
    Node* head = nullptr;
    push(&head, 20);
    push(&head, 4);
    push(&head, 15);
    push(&head, 10);
    /* Create a loop for testing */
    head->next->next->next->next = head;

    if (detectLoop2(head))
        cout << "Loop found";
    else
        cout << "No Loop";

    return 0;
}
