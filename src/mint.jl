struct MInt{T,S} <: Integer
    MInt :: T
    MOD :: S
    global function _unsafe_mint(a::T,MOD::S) where {T,S}
         new{T,S}(a,MOD)
    end
end
MInt(a,MOD) = _unsafe_mint( ifelse(a<0,a%MOD+MOD,a%MOD),MOD)
modulus(x::MInt) = x.MOD
value(x::MInt) = x.MInt

function Base.show(io::IO, x::MInt)
    print( io, value(x))
end