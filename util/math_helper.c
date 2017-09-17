#include <util/math_helper.h>
#include <util/general.h>

bool
pow_of_two(int x)
{
	return (x > 0) && ((x & (x - 1)) == 0);
}
