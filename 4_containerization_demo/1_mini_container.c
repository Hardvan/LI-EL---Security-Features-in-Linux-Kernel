/*
 * Description:
    This program demonstrates a simple container by creating a new process
    with isolated UTS, PID, and mount namespaces. Inside the container, it
    sets a custom hostname, mounts the proc filesystem, prints some sample
    commands you can run, and launches an interactive bash shell.

 * Compilation:
    gcc 1_mini_container.c -o mini_container -Wall -Wextra

 * Execution (as root):
    sudo ./mini_container
 */

#define _GNU_SOURCE
#include <sched.h>
#include <sys/mount.h>
#include <sys/wait.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>

#define STACK_SIZE (1024 * 1024) // Stack size for the child process

// Allocate stack for the child process.
static char child_stack[STACK_SIZE];

/*
 * Child process function.
 * Runs in new UTS, PID, and mount namespaces.
 */
int child_main(void *arg)
{
    (void)arg; // Unused

    // Set a new hostname for the container
    const char *new_hostname = "mini-container";
    if (sethostname(new_hostname, strlen(new_hostname)) != 0)
    {
        perror("❌ [Child] sethostname failed");
        exit(EXIT_FAILURE);
    }
    printf("🌟 [Child] Hostname set to '%s' in the new UTS namespace.\n", new_hostname);

    // Mount the proc filesystem to allow process-related commands to work
    printf("🔧 [Child] Mounting proc filesystem at /proc...\n");
    if (mount("proc", "/proc", "proc", 0, NULL) != 0)
    {
        perror("❌ [Child] mount proc failed");
        exit(EXIT_FAILURE);
    }
    printf("🚀 [Child] Proc filesystem mounted successfully.\n");

    // Output sample commands that can be run inside the container
    printf("\n💡 [Child] Here are some sample commands you can try in the container:\n");
    printf("   • hostname   # Display the container's hostname\n");
    printf("   • ps aux     # List all processes running in the container\n");
    printf("   • ls /proc   # View the mounted proc filesystem\n");
    printf("   • exit       # Exit the container shell\n\n");

    // Inform the user and launch an interactive bash shell inside the container
    printf("🖥️ [Child] Launching bash shell inside the container. Type 'exit' to leave.\n");
    execlp("bash", "bash", NULL);

    // If execlp returns, there was an error.
    perror("❌ [Child] execlp failed");
    return EXIT_FAILURE;
}

int main()
{
    printf("🚀 [Main] Starting mini-container demonstration using Linux namespaces...\n");
    printf("ℹ️  [Main] Explanation: Creating isolated UTS, PID, and mount namespaces.\n");

    // Create a new process with new UTS, PID, and mount namespaces.
    pid_t pid = clone(child_main,
                      child_stack + STACK_SIZE,
                      CLONE_NEWUTS | CLONE_NEWPID | CLONE_NEWNS | SIGCHLD,
                      NULL);
    if (pid == -1)
    {
        perror("❌ [Main] clone failed");
        exit(EXIT_FAILURE);
    }

    // Wait for the container process to complete.
    if (waitpid(pid, NULL, 0) == -1)
    {
        perror("❌ [Main] waitpid failed");
        exit(EXIT_FAILURE);
    }

    printf("✅ [Main] Mini-container session complete. Exiting.\n");
    return EXIT_SUCCESS;
}

/*
Output:
 sudo ./mini_container
[sudo] password for hardik:
🚀 [Main] Starting mini-container demonstration using Linux namespaces...
ℹ️  [Main] Explanation: Creating isolated UTS, PID, and mount namespaces.
🌟 [Child] Hostname set to 'mini-container' in the new UTS namespace.
🔧 [Child] Mounting proc filesystem at /proc...
🚀 [Child] Proc filesystem mounted successfully.

💡 [Child] Here are some sample commands you can try in the container:
   • hostname   # Display the container's hostname
   • ps aux     # List all processes running in the container
   • ls /proc   # View the mounted proc filesystem
   • exit       # Exit the container shell

🖥️ [Child] Launching bash shell inside the container. Type 'exit' to leave.
root@mini-container:/home/hardik/LI-EL---Security-Features-in-Linux-Kernel/5_containerization_demo# hostname
mini-container
root@mini-container:/home/hardik/LI-EL---Security-Features-in-Linux-Kernel/5_containerization_demo# ps aux
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  0.0  10236  4096 pts/2    S    14:04   0:00 bash
root           9  0.0  0.0  12672  3328 pts/2    R+   14:04   0:00 ps aux
root@mini-container:/home/hardik/LI-EL---Security-Features-in-Linux-Kernel/5_containerization_demo# ls /proc
1           cpuinfo        fs          kpagecgroup    mounts        slabinfo       uptime
10          crypto         interrupts  kpagecount     mtd           softirqs       version
acpi        devices        iomem       kpageflags     mtrr          stat           version_signature
asound      diskstats      ioports     latency_stats  net           swaps          vmallocinfo
bootconfig  dma            irq         loadavg        pagetypeinfo  sys            vmstat
buddyinfo   driver         kallsyms    locks          partitions    sysrq-trigger  zoneinfo
bus         dynamic_debug  kcore       mdstat         pressure      sysvipc
cgroups     execdomains    keys        meminfo        schedstat     thread-self
cmdline     fb             key-users   misc           scsi          timer_list
consoles    filesystems    kmsg        modules        self          tty
root@mini-container:/home/hardik/LI-EL---Security-Features-in-Linux-Kernel/5_containerization_demo# exit
exit
✅ [Main] Mini-container session complete. Exiting.
*/
