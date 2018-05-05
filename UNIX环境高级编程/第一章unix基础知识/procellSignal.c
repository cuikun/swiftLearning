#include "apue.h"
#include <sys/wait.h>

static void sig_int(int); //输出 获取到的signal



int 
main(void)
{
	char buf[MAXLINE]; /*FROM APUE.H*/
	pid_t pid;
	int status;
	
	if (signal(SIGINT, sig_int) == SIG_ERR) {
		err_sys("signal error");
		}	


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

void
sig_int(int signo)
{
	printf("interrupt \n %% ");
}

