module ModInt
    import Base: \, /, *, ^, +, -, show

    include("./operators.jl")
    include("mint.jl")

    module 1000000007 
        include("1000000007.jl")       
    end
    module 998244353
        include("998244353.jl")
    end
end