module test_base_fix2

using Test

@test Base.Fix2(-, 1).(3:8)          == 2:7             == .-(3:8, 1)
@test Base.Fix2(split, ",")("a,b,c") == ["a", "b", "c"] == split("a,b,c", ",")
@test Base.Fix2(xor, true)(true)     == false

end # module test_base_fix2
