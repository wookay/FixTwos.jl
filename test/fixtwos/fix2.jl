module test_fixtwos_fix2

using Test
using FixTwos

@test <(3)(1)
@test ^(2)(3) == 9
@test /(5)(10) == 2
@test //(5)(10) == 2//1
@test %(3)(8) == 2
@test mod(3)(8) == 2 == mod(8, 3)

@test isless(3)(1)
@test isless('b')('a')
@test isless("b")("a")
@test isless(3).(1:5) == [true, true, false, false, false] == <(3).(1:5)
@test filter(isless(3), 1:5) == 1:2
@test filter(!isless(3), 1:5) == 3:5

@test issubset(1:5)(2:3)

# @test isa(1)(Int)
# https://github.com/JuliaLang/julia/issues/32018

end # module test_fixtwos_fix2
