module test_fixtwos_fix2kwargs

using Test
using FixTwos

@test isapprox(pi; atol = 0.01).([3.14, 3.15, 3.16]) == [true, true, false]
@test filter(isapprox(pi; atol = 0.01), [3.14, 3.15, 3.16]) == [3.14, 3.15]

end # module test_fixtwos_fix2kwargs
