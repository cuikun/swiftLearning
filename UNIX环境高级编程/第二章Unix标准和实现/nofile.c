#include <sys/param.h>
#include <unistd.h>

int
main(int argc, char const *argv[])
{
	for (int i = 0; i < NOFILE; ++i)
	{
		close(i);
	}
	return 0;
	
}

