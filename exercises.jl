using BasicTheoryOfInterest

# 1.a
r = 3.3
y = 2021 - 1776
#1.b
yearly_compounded_interest(1, r, y)
r = 6.6
yearly_compounded_interest(1, r, y)

# 2
log(1 + (r/100))
n = 69/r

r = 0.08
isapprox(log(1 + r), r - 0.5r^2, atol=0.001)
i = 100r
isapprox((1 + r)^(72/i), 2, atol=0.001)

# 3.a
find_effective_rate(0.03, 12)
# 3.b
find_effective_rate(0.18, 12)
# 3.c
find_effective_rate(0.18, 4)

# 4
f(λ) = -1 + λ + λ^2
ḟ(λ) = 1 + 2λ

irr(f, ḟ, 1, 4)

# 5
harvest_cash_flows = [npv(1, n+1, 0.1, n) for n ∈ 1:20]
using Plots
plot(harvest_cash_flows, label="npv")
xlabel!("years")
ylabel!("revenue")
# savefig("npv5.png")
optimal_harvest = findmax(harvest_cash_flows)

print("The optimal year to harvest is ")
printstyled("$(optimal_harvest[2])", color=:light_magenta, bold=true)
print(" years, and the investment will yield ")
printstyled("\$$(round(optimal_harvest[1], digits=2))", color=:green, bold=true)

# 6.a
aer(0.1, 12)
# 6.b
cci(0.1)

# 7
pv(500_000, 0.10, 20.0)
