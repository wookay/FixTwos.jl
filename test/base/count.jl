module test_base_count

using Test

@test count(==(3), (a=3, b=3, c=0)) == 2

end # module test_base_count
