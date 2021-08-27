using Distributions
include("Options.jl")

d₁(o::Options.Call, t=0.0) = (log(o.S / o.K) + (o.r + 0.5o.σ^2) * (o.T - t)) / (o.σ * √(o.T - t))
d₂(o::Options.Call, t=0.0) = d₁(o, t) - o.σ * √(o.T - t)

"Δ of a European call"
function Δ(option::Options.Call, t=0.0)
  S = option.S
  K = option.K
  r = option.r
  σ = option.σ
  T = option.T

  d₁ = d₁(option, t)

  return cdf(Normal(), d₁)
end

"Δ of a European put"
function Δ(option::Options.Put, t=0.0)
  S = option.S
  K = option.K
  r = option.r
  σ = option.σ
  T = option.T

  d₁ = d₁(option, t)

  return -cdf(Normal(), -d₁)
end

"call option price"
function callprice(c::Options.Call)
  c.S * cdf(Normal(), d₁(c)) - c.K * exp(-c.r * c.T) * cdf(Normal(), d₂(c))
end

"put option price by put-call parity"
function putprice(c::Options.Call)
  callprice(c) + c.K * exp(-c.r * c.T) - c.S 
end
