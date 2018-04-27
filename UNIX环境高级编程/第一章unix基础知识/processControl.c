#include "apue.h"
#include <sys/wait.h>

int 
main(void)
{
	char buf[MAXLINE]; /*FROM APUE.H*/
	pid_t pid;
	int status;
	printf("%% "); /*print prompt ()*/
	while(fgets(buf, MAXLINE, stdin) != NULL) {
		if (buf[strlen(buf) - 1] == '\n')
			buf[strlen(buf) - 1] = 0; /* replace newline with null */

		if ((pid = fork()) < 0) { //fork调用了一次，返回了两次，一次是在父进程，一次是在子进程
			err_sys("fork err");
		} else if (pid == 0) { // 新创建的子进程，对父进程返回进程id，对子进程返回0
			execlp(buf,buf,(char *)0);
			err_ret("couldn't execute: %s", buf);
			exit(127);
		}

		/* parent*/
		if((pid = waitpid(pid, & status , 0)) < 0)
			err_sys("waitpid error");

		printf("%% ");
	}

	exit(0);
}