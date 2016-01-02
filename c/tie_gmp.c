/*
 * gmp must be installed, e.g. brew install gmp on OSX
 * Compile: gcc tie_gmp.c -o tie -lgmp
 # Run: ./tie
*/

#include <gmp.h>
#include <stdio.h>

void fact(int n, mpf_t f) {
  mpf_t nf;
  mpf_init(nf);
  mpf_set_si(f, 1);
  while (n > 1) {
    mpf_set_si(nf, n);
    mpf_mul(f, f, nf);
    n--;
  }
  mpf_clear(nf);
}

void prob(int n, mpf_t p) {
  mpf_t a, b, c;
  mpf_init(a);
  mpf_init(b);
  mpf_init(c);
  fact(n, a);
  fact(n/2, b);
  mpf_mul(b, b, b);
  mpf_set_si(c, 2);
  mpf_pow_ui(c, c, (unsigned int)n);
  mpf_div(p, a, b);
  mpf_div(p, p, c);
  mpf_clear(a);
  mpf_clear(b);
  mpf_clear(c);
}

int main() {
  int values[] = { 3030, 1000, 500, 200, 100, 50, 10 }, *value;
  mpf_t p, c100;
  mpf_init(p);
  mpf_init_set_si(c100, 100);
  for (int *value = values; *value; value++) {
    int n = *value;
    prob(n, p);
    mpf_mul(p, p, c100);
    gmp_printf("%d : %.2Ff\n", n, p);
  }

  mpf_clear(p);
  mpf_clear(c100);

  return 0;
}
