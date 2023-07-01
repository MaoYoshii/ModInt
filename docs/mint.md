# Mint
In general, `MInt` is defined by two integers as `a = MInt(x,y)`. This is equivalent with `a = mod(x,y)`

## Special moduli
In special cases where moduli are 1000000007 and 998244353, we can omit them using `ModInt.1000000007` and `ModInt.998244353`.
In this module, treat moduli as constant parameters (`MOD`) and define new functions `MInt() = Mint(0,MOD)` and `MInt(x) = Mint(x,MOD)`. Therefore, we can still use `a = MInt(x,y)` and $y \neq MOD$.
