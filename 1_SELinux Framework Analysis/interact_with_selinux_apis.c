#include <selinux/selinux.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    if (is_selinux_enabled()) {
        printf("SELinux is enabled.\n");

        security_context_t context;
        if (getcon(&context) == 0) {
            printf("Current SELinux context: %s\n", context);
            freecon(context);
        } else {
            perror("Failed to get SELinux context");
        }
    } else {
        printf("SELinux is not enabled.\n");
    }

    return 0;
}
