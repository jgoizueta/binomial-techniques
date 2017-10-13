actor Main
  new create(env: Env) =>
    let values: Array[U32] = [3030; 1000; 500; 200; 100; 50; 10]
    for value in values.values() do
      env.out.print(value.string()+" : "+prob(value).string()+" %")
    end

    fun prob(n: U32) : F64 =>
      let x = n.f64()
      ((lfact(x) - (2.0*lfact(x/2))) - (x*(F64(2.0).log()))).exp()

    fun lfact(x: F64) : F64 =>
      var f : F64 = 0.0
      var y = x
      while y > 1.0 do
        f = f + y.log()
        y = y - 1
      end
      f
