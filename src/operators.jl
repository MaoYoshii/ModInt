Base.:<<(a::MInt, b::Int) = MInt(value(a)<<b,modulus(a))

Base.:>>(a::MInt, b::Int) = MInt(value(a)>>b,modulus(a))

Base.:+(a::MInt, b::Int) = MInt(value(a)+b,modulus(a))
Base.:+(a::Int, b::MInt) = MInt(a+value(b),modulus(b))
Base.:+(a::MInt, b::MInt) = _unsafe_mint( value(a)+value(b) |> x -> ifelse(x > modulus(a), x-modulus(a),x),modulus(a))

Base.:-(a::MInt, b::Int) = MInt(value(a)-b,modulus(a))
Base.:-(a::Int, b::MInt) = MInt(a-value(b),modulus(b))
Base.:-(a::MInt, b::MInt) = _unsafe_mint( value(a)-value(b) |> x -> ifelse(x < 0, x+modulus(a),x),modulus(a))

Base.:*(a::MInt, b::Int) = MInt(value(a)*b,modulus(a))
Base.:*(a::Int, b::MInt) = MInt(a*value(b),modulus(b))
Base.:*(a::MInt, b::MInt) = _unsafe_mint( value(a)*value(b)%modulus(a),modulus(a))

Base.:^(a::MInt, b::Int) = if b < 0
    error("power must be an Integer")
elseif b == 0
    return MInt(1,modulus(a))
elseif b == 1
    return a
elseif b & 1 != 0
    b -= 1
    return (a^b)*a
else
    b >>= 1
    c = a^b
    return c*c
end
Base.:^(a::Int, b::MInt) = if value(b) < 0
    error("power must be an Integer")
elseif value(b) == 0
    return 1
elseif value(b) == 1
    return MInt(a,modulus(b))
elseif value(b) & 1 != 0
    b -= 1
    return (a^value(b))*a
else
    b >>= 1
    c = a^value(b)
    return c*c
end

Base.:^(a::MInt, b::MInt) = if value(b) < 0
    error("power must be an Integer")
elseif value(b) == 0
    return MInt(1,modulus(a))
elseif value(b) == 1
    return a
elseif value(b) & 1 != 0
    b -= 1
    return (a^value(b))*a
else
    b >>= 1
    c = a^value(b)
    return c*c
end

function _ext_euclid(X,MOD)
    Y = MOD
    aₖ, bₖ, aₖ₊₁, bₖ₊₁ = 0, 1, 1, 0 
    while X != 0
        d,r = divrem(Y,X)
        X, Y = r, X
        aₖ, aₖ₊₁ = aₖ₊₁, aₖ - d*aₖ₊₁
        bₖ, bₖ₊₁ = bₖ₊₁, bₖ - d*bₖ₊₁
    end
    mod(aₖ,MOD)
end

Base.inv(a::MInt ; prime = true) = if prime
    a^(modulus(a)-2)
else
    _ext_euclid(value(a),modulus(a)) 
end

Base.:÷(a::MInt, b::Int) = MInt(value(a)*inv((b,modulus(a))),modulus(a))
Base.:÷(a::Int, b::MInt) = a*inv(b)
Base.:÷(a::MInt, b::MInt) = if modulus(a) == modulus(b)
    a*inv(b)
else
    error("mudulus needs to be the same")
end