const lfact = x => {
    let f = 0;
    while (x > 1) {
        f += Math.log(x);
        x -= 1;
    }
    return f;
};
  
const prob = n => Math.exp(lfact(n) - (2*lfact(n/2)) - (n*Math.log(2)));
  
for (let n of [3030, 1000, 500, 200, 100, 50, 10]) {
    const p = prob(n);
    console.log(`${n} ${(p*100).toFixed(2)}`);
}
