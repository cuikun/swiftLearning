
#include <sys/resource.h>

int
main(int argc, char const *argv[])
{
	printf("%i\n", getrlimit(1,"/"));
	return 0;
}