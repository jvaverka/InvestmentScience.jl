using Test
include("delta.jl")

@testset "InvSciTest" begin
  @test putprice(Options.Call(437.5, 460.0, 0.0125, 0.42, 12 / 12)) == 82.85269352235707
end
