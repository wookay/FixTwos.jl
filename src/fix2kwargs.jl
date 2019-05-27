# module FixTwos

struct Fix2Args{F,T} <: Function
    f::F
    x::T
    kwargs

    Fix2Args(f::F, x::T, kwargs) where {F,T} = new{F,T}(f, x, kwargs)
end
(f::Fix2Args)(y) = f.f(y, f.x; f.kwargs...)

for f in (isapprox, )
    op = nameof(f)
    @eval Base.$op(x; kwargs...) = Fix2Args($op, x, kwargs)
end

# module FixTwos
