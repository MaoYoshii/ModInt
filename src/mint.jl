struct MInt{T,S} <: Integer
    MInt :: T
    MOD :: S
    function MInt(a::T,MOD::S) where {T,S}
        if 0 ≤ a < MOD
            new{T,S}(a,MOD)
        else
            new{T,S}(mod(a,MOD),MOD)
        end
    end
end
new(a,MOD) = new{typeof(a),typeof(MOD)}(a,MOD)
modulus(x::MInt) = x.MOD
value(x::MInt) = x.MInt

function Base.show(io::IO, x::MInt)
    print( io, value(x))
end

export MInt, modulus, value