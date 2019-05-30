# module FixTwos

using Base: Fix1, Fix2

for f in (findfirst,
          filter,
          map,
          )
    op = nameof(f)
    @eval Base.$op(x::Fix2) = Fix1($op, x)
end

# module FixTwos
