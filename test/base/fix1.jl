module test_base_fix1

using Test

@test Base.Fix1(parse, Int).(["10", "10", "10"]) == [10, 10, 10]

end # module test_base_fix1
