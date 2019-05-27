# module FixTwos

using Base: Fix2

for f in (isless,
          issubset,
          ^,
          /,
          //,
          %,
          mod,
          (VERSION < v"1.2" ? (!=, >=, <=, >, <) : ())...)
    op = nameof(f)
    @eval Base.$op(x) = Fix2($op, x)
end

# module FixTwos
