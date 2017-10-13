const BigNumber = require('bignumber.js');

const fact = x => {
  let f = new BigNumber(1);
  x = new BigNumber(x);
  while (x > 1) {
    f = f.times(x);
    x = x.minus(1);
  }
  return f;
};

const prob = n => {
  const two = new BigNumber(2);
  n = new BigNumber(n);
  const x = n.div(2);
  const a = fact(n);
  let b = fact(x);
  b = b.times(b);
  const c = two.toPower(n);
  return a.div(b).div(c);
};

for (let n of [3030, 1000, 500, 200, 100, 50, 10]) {
  const p = prob(n);
  console.log(`${n} ${p.times(100).round(2)}`);
}
