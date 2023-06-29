__ModInt__ is a Julia language implementation of the modint.
# Quick start
In ModInt, there are three modules `modint`, `mod1000000007` and `mod998244353`. 
In `modint` we need to specify the modulus explicitly.
## choose mod by hand
```julia
    using ModInt.modint
    a = MInt(5,13)
    inv(a)

    MInt(x) = MInt(x,19)
    a = MInt(5)
```

When we use ModInt for programming contests, it `mod1000000007` and `mod998244353` will be convenient for we can omit modulus.
```julia
    using ModInt.mod1000000007
    a = MInt(5)
    inv(a)
```

# Detail
## Inverse
In `mod1000000007` and `mod998244353`, we use Fermat's little theorem. In `modint`, we can also use composite numbers as a mod. In this case, we should use the extended Euclidean algorithm to find the inverse.
In default, `inv` uses Fermat's little theorem regardless of mod. Thus, we should use `inv(x,prime = false)`
```julia
    using ModInt.modint
    a = MInt(5,10)
    
```
