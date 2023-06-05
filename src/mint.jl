struct MInt <: Real
    MInt
    MOD
    function MInt(a,b)
        new(mod(a,b),b)
    end
end

modulus(x::MInt) = x.MOD
_value(x::MInt) = x.MInt

function Base.show(io::IO, x::MInt)
    print( io, _value(x))
end