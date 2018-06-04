#include <unistd.h>

int
main(int argc, char const *argv[])
{
	for (int i = 0; i < sysconf(_SC_OPEN_MAX); ++i)
	{
		close(i);
	}
	return 0;
}