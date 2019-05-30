module test_fixtwos_fix2

using Test
using FixTwos

@test <(3)(1)            # 1 < 3
@test <=(3)(1)           # 1 <= 3
@test =>(3)(1)          == (1 => 3) == Pair(1, 3)
@test ^(2)(3)   == 9    == 3^2
@test /(5)(10)  == 2    == 10/5
@test //(5)(10) == 2//1 == 10//5
@test %(3)(8)   == 2    == 8 % 3
@test mod(3)(8) == 2    == mod(8, 3)

@test isless(3)(1)
@test isless('b')('a')
@test isless("b")("a")
@test isless(3).(1:5) == [true, true, false, false, false] == <(3).(1:5)

@test issubset(1:5)(2:3)

@test haskey(:a)((a=2,)) # haskey((a=2,), :a)

@test (5 in 5:8) && in(5, 5:8) && (5 ∈ 5:8)
@test in(5:8)(5)         # 5 in 5:8
@test ∈(5:8)(5)          # 5 ∈ 5:8
@test ∉(5:8)(3)          # 3 ∉ 5:8
@test ∋(5)(5:8)          # 5:8 ∋ 5
@test ∌(3)(5:8)          # 5:8 ∌ 3

@test filter(isless(3), 1:5)  == 1:2
@test filter(!isless(3), 1:5) == 3:5

@test filter(=>(3), Dict(:a=>3, :b=>3, :c=>0)) == Dict(:a=>3, :b=>3)
@test filter(=>(3), [:a=>3, :b=>3, :c=>0])     == [:a=>3, :b=>3]
@test filter(==(3), (a=3, b=3, c=0))           == (a=3, b=3)

@test occursin("apple")('a') && occursin('a', "apple")

@test (string ∘ Base.Fix2(+, 1))(5) == "6"
@test ∘(Base.Fix2(+, 1))(string)(5) == "6"

# @test isa(1)(Int)
# https://github.com/JuliaLang/julia/issues/32018

end # module test_fixtwos_fix2
