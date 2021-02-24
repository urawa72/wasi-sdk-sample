#include <cmath>

extern "C" double calc(double a) {
    return std::round(a * 10000000);
}
