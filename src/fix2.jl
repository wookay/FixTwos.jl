# module FixTwos

using Base: Fix2

for f in (^,
          /,
          //,
          %,
          =>,
          ∉,
          ∋,
          ∌,
          mod,
          isless,
          issubset,
          haskey,
          (VERSION < v"1.2" ? (!=, >=, <=, >, <) : ())...)
    op = nameof(f)
    @eval Base.$op(x) = Fix2($op, x)
end


## Base.filter
function Base.filter(f::Fix2{Type{Pair}, V}, d::AbstractDict{K, V}) where {K, V}
    df = empty(d)
    for pair in d
        if pair.second == f.x
            df[pair.first] = pair.second
        end
    end
    return df
end

function Base.filter(f::Fix2{Type{Pair}, V}, a::Vector{Pair{K, V}}) where {K, V}
    df = empty(a)
    for pair in a
        if pair.second == f.x
            push!(df, pair)
        end
    end
    return df
end

function Base.filter(f::Fix2{Type{Pair}, V}, nt::NamedTuple{names, NTuple{N, V}}) where {names, N, V}
    (; filter(kv -> kv.second==f.x, pairs(nt))...)
end

# module FixTwos
