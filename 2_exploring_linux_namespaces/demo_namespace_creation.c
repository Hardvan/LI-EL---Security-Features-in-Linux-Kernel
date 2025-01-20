#define _GNU_SOURCE
#include <sched.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>

#define STACK_SIZE (1024 * 1024) // Stack size for child process

static char child_stack[STACK_SIZE];

int child_main(void *arg)
{
    printf("Child process in new namespace.\n");
    system("bash");
    return 0;
}

int main()
{
    printf("Creating a new namespace...\n");
    pid_t pid = clone(child_main, child_stack + STACK_SIZE, CLONE_NEWNET | SIGCHLD, NULL);
    if (pid == -1)
    {
        perror("clone");
        exit(EXIT_FAILURE);
    }

    waitpid(pid, NULL, 0);
    printf("Namespace test complete.\n");
    return 0;
}

/*
Steps to run:
1. Compile the program:
    $ gcc demo_namespace_creation.c -Wall -Wextra
    $ sudo ./a.out
*/

/*
Output:
[sudo] password for hardik:
Creating a new namespace...
Child process in new namespace.
root@hardik-laptop:/home/hardik/LI-EL---Security-Features-in-Linux-Kernel/2_exploring_linux_namespaces# ls
a.out  create_and_explore_namespace.sh  demo_namespace_creation.c
root@hardik-laptop:/home/hardik/LI-EL---Security-Features-in-Linux-Kernel/2_exploring_linux_namespaces# ^C
root@hardik-laptop:/home/hardik/LI-EL---Security-Features-in-Linux-Kernel/2_exploring_linux_namespaces# exit
exit
Namespace test complete.
*/
