// Compile: g++ tie.cpp -o tie -lgmp
// Run: ./tie

#include <boost/multiprecision/gmp.hpp>
#include <boost/math/special_functions/gamma.hpp>

using namespace boost::multiprecision;

mpf_float fact(int int_x) {
  mpf_float_100 x = int_x;
  return boost::math::tgamma(x+1);
}

mpf_float prob(int n) {
  mpf_float::default_precision(100);
  mpf_float_100 two = 2;
  mpf_float_100 a =  fact(n);
  mpf_float_100 b =  fact(n/2);
  b *= b;
  mpf_float_100 c =  pow(two, n);
  return a / b / c;
}

#include <iostream>

int main(int argc, char const *argv[]) {
  int values[] = { 3030, 1000, 500, 200, 100, 50, 10 };
  for (int *value = values; *value; value++) {
    int n = *value;
    mpf_float p = prob(n);
    std::cout.precision(2);
    std::cout << n << " : " << std::fixed << 100*p << std::endl;
  }
  return 0;
}
