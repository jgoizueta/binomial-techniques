// Run: go run hello-world.go
package main

import "math/big"
import "fmt"

func prob_exact(n int64) *big.Rat {
  var big_num big.Int
  big_num.Binomial(n, n/2)
  var big_denom big.Int
  big_denom.Exp(big.NewInt(2), big.NewInt(n), nil)
  var result big.Rat
  result.SetFrac(&big_num, &big_denom)
  return &result
}

func main() {
  test_data := [7]int64{3030, 1000, 500, 200, 100, 50, 10}
  for _, value := range test_data {
    result, _ := prob_exact(value).Float64()
    fmt.Printf("%d : %.2f %%\n",value, 100.0*result)
  }
}
