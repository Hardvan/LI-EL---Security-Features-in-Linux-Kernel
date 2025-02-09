#define _GNU_SOURCE
#include <sched.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <sys/wait.h> // Required for waitpid()

#define STACK_SIZE (1024 * 1024) // Stack size for child process

// Allocate memory for the child process's stack.
static char child_stack[STACK_SIZE];

/*
 * Child process function.
 * This function runs in a new network namespace.
 */
int child_main(void *arg)
{
    // Emoji-enhanced message indicating the child process is running in a new namespace.
    printf("\n🌟 [Child] Running in a NEW network namespace!\n");
    printf("🛠️  [Child] Explanation: This process is isolated from the host's network environment.\n");

    // Launch an interactive bash shell so you can experiment in the new namespace.
    printf("🖥️  [Child] Launching an interactive Bash shell...\n");
    printf("📝  [Child] Some sample commands to run:\n");
    printf("    - `ip link`: Show network interfaces\n");
    printf("    - `ip addr`: Show IP addresses\n");
    printf("    - `exit`: Exit the shell\n");
    system("bash");

    return 0;
}

/*
 * Main function:
 * - Creates a new network namespace by cloning a child process.
 * - Waits for the child process to finish.
 */
int main()
{
    printf("🚀 [Main] Initiating creation of a new network namespace...\n");
    printf("📝 [Main] Explanation: The clone() system call creates a new process with its own network namespace.\n");

    // Create the child process with a new network namespace using clone().
    pid_t pid = clone(child_main, child_stack + STACK_SIZE, CLONE_NEWNET | SIGCHLD, NULL);
    if (pid == -1)
    {
        perror("❌ [Main] Error: clone failed");
        exit(EXIT_FAILURE);
    }

    printf("🔄 [Main] Waiting for the child process to complete its work...\n");

    // Wait for the child process to finish (i.e., when you exit the Bash shell).
    waitpid(pid, NULL, 0);
    printf("✅ [Main] Namespace test complete. The child process has terminated.\n");

    return 0;
}

/*
Steps to run:
1. Compile the program:
    $ gcc demo_namespace_creation.c -Wall -Wextra -o demo_namespace_creation
2. Run the program with sudo (required for namespace creation):
    $ sudo ./demo_namespace_creation
*/

/*
What to expect in the output:
--------------------------------
🚀 [Main] Initiating creation of a new network namespace...
📝 [Main] Explanation: The clone() system call creates a new process with its own network namespace.
🔄 [Main] Waiting for the child process to complete its work...

(Then, in the child process:)
🌟 [Child] Running in a NEW network namespace!
🛠️  [Child] Explanation: This process is isolated from the host's network environment.
🖥️  [Child] Launching an interactive Bash shell...

At this point, you'll be inside an interactive bash shell running in the new network namespace.
After you exit the shell (by typing `exit`), you'll see:

✅ [Main] Namespace test complete. The child process has terminated.
--------------------------------

Each message is accompanied by an emoji to make the steps more engaging!
*/
