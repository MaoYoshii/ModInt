module ModInt
    import Base: \, /, *, ^, +, -, show
    import Base: Integer,Int8,Int16,Int32,Int64,Int128

    include("mint.jl")
    include("operators.jl")
    include("types.jl")
    module mod1000000007
        include("1000000007.jl")       
    end
    module mod998244353
        include("998244353.jl")
    end
end