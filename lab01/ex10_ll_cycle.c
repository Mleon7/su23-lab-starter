#include <stddef.h>
#include "ex10_ll_cycle.h"

int ll_has_cycle(node *head) {
    /* TODO: Implement ll_has_cycle */
    // chatgpt
    if (head == NULL) {
        return 0;  // Empty list is acyclic
    }

    node *fast_ptr = head;
    node *slow_ptr = head;

    while (fast_ptr != NULL && fast_ptr->next != NULL) {
        fast_ptr = fast_ptr->next->next;  // Advance by two nodes
        slow_ptr = slow_ptr->next;        // Advance by one node

        if (fast_ptr == slow_ptr) {
            return 1;  // Cycle detected
        }
    }

    return 0;  // No cycle found
}
