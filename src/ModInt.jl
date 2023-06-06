module ModInt
    import Base: \, /, *, ^, +, -, show

    include("mint.jl")
    include("./operators.jl")
    module mod1000000007
        include("1000000007.jl")       
    end
    module mod998244353
        include("998244353.jl")
    end
end