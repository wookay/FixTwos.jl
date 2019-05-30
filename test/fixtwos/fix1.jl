module test_fixtwos_fix1

using Test
using FixTwos

@test findfirst(isequal(7))(5:8) == 3 == findfirst(isequal(7), 5:8)

@test filter(<(3))(1:5) == 1:2

@test map(^(2))(1:3) == [1, 4, 9] == map(^(2), 1:3) == .^(1:3, 2)

end # module test_fixtwos_fix1
