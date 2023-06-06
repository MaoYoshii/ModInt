Base.:<<(a::MInt, b::Int) = MInt(_value(a)<<b,modulus(a))

Base.:>>(a::MInt, b::Int) = MInt(_value(a)>>b,modulus(a))

Base.:+(a::MInt, b::Int) = MInt(_value(a)+b,modulus(a))
Base.:+(a::Int, b::MInt) = MInt(a+_value(b),modulus(b))
Base.:+(a::MInt, b::MInt) = if modulus(a) == modulus(b)
    MInt(_value(a)+_value(b),modulus(a))
else
    error("mudulus needs to be the same")
end

Base.:-(a::MInt, b::Int) = MInt(_value(a)-b,modulus(a))
Base.:-(a::Int, b::MInt) = MInt(a-_value(b),modulus(b))
Base.:-(a::MInt, b::MInt) = if modulus(a) == modulus(b)
    MInt(_value(a)-_value(b),modulus(a))
else
    error("mudulus needs to be the same")
end

Base.:*(a::MInt, b::Int) = MInt(_value(a)*b,modulus(a))
Base.:*(a::Int, b::MInt) = MInt(a*_value(b),modulus(b))
Base.:*(a::MInt, b::MInt) = if modulus(a) == modulus(b)
    MInt(_value(a)*_value(b),modulus(a))
else
    error("mudulus needs to be the same")
end

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
Base.:^(a::Int, b::MInt) = if _value(b) < 0
    error("power must be an Integer")
elseif _value(b) == 0
    return 1
elseif _value(b) == 1
    return MInt(a,modulus(b))
elseif _value(b) & 1 != 0
    b -= 1
    return (a^_value(b))*a
else
    b >>= 1
    c = a^_value(b)
    return c*c
end

Base.:^(a::MInt, b::MInt) = if _value(b) < 0
    error("power must be an Integer")
elseif _value(b) == 0
    return MInt(1,modulus(a))
elseif _value(b) == 1
    return a
elseif _value(b) & 1 != 0
    b -= 1
    return (a^_value(b))*a
else
    b >>= 1
    c = a^_value(b)
    return c*c
end

Base.inv(a::MInt) = a^(modulus(a)-2)

Base.:÷(a::MInt, b::Int) = MInt(_value(a)*inv((b,modulus(a))),modulus(a))
Base.:÷(a::Int, b::MInt) = a*inv(b)
Base.:÷(a::MInt, b::MInt) = if modulus(a) == modulus(b)
    a*inv(b)
else
    error("mudulus needs to be the same")
end