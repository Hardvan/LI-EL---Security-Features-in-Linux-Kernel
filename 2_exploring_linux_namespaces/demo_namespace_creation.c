#define _GNU_SOURCE
#include <sched.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

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
