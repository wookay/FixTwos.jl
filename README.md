### FixTwos

```
julia> using FixTwos

julia> filter(=>(3), Dict(:a=>3, :b=>3, :c=>0))
Dict{Symbol,Int64} with 2 entries:
  :a => 3
  :b => 3

julia> filter(=>(3), [:a=>3, :b=>3, :c=>0])
2-element Array{Pair{Symbol,Int64},1}:
 :a => 3
 :b => 3

julia> filter(==(3), (a=3, b=3, c=0))
(a = 3, b = 3)
```
