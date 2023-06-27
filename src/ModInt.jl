module ModInt
    module mod
        import Base: \, /, *, ^, +, -, show
        import Base: Integer,Int8,Int16,Int32,Int64,Int128
        include("mint.jl")
        include("operators.jl")
        include("types.jl")
        export MInt, modulus, value 
    end
    module mod1000000007
        include("1000000007.jl")
        export MInt, modulus, value       
    end
    module mod998244353
        include("998244353.jl")
        export MInt, modulus, value  
    end
end