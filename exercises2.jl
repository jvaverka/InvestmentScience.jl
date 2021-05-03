# 1.a
yearly_compounded_interest(i, r, y) = (i*(1 + (r/100)))^y
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

# 3
find_effective_rate(i, n) = (1 + i/n)^n - 1
# 3.a
find_effective_rate(0.03, 12)
# 3.b
find_effective_rate(0.18, 12)
# 3.c
find_effective_rate(0.18, 4)

# 4
f(λ) = -1 + λ + λ^2
ḟ(λ) = 1 + 2λ

"internal rate of return"
function irr(func1, func2, init, stop)
    sol = Float64[]
    λₖ = func1(init)
    λₖ₊₁ = λₖ - func1(λₖ)/func2(λₖ)
    push!(sol, float(λₖ))
    if stop == 0
        return [λₖ]
    end
    push!(sol, float(λₖ₊₁))
    if stop == 1
        return [λₖ, λₖ₊₁]
    end
    for k ∈ range(2, stop=stop)
        λₖ = λₖ₊₁
        λₖ₊₁ = λₖ - func1(λₖ)/func2(λₖ)
        push!(sol, float(λₖ₊₁))
    end
    return sol
end

irr(f, ḟ, 1, 4)

# 5
"net present value"
npv(inv, val, rate, year) = -inv + val/(1+rate)^year

harvest_cash_flows = [npv(1, n+1, 0.1, n) for n ∈ 1:20]
plot(harvest_cash_flows)
optimal_harvest = findmax(harvest_cash_flows)

print("The optimal year to harvest is ")
printstyled("$(optimal_harvest[2])", color=:light_magenta, bold=true)
print(" years, and the investment will yield ")
printstyled("\$$(round(optimal_harvest[1], digits=2))", color=:green, bold=true)

# 6
"annual equivalent rate"
aer(r, n) = (1 + r/n)^n - 1
# 6.a
aer(0.1, 12)
# 6.b
"continuously compounded interest"
cci(r) = exp(r) - 1
cci(0.1)

# 7
"present value"
function pv(p, r, n)
    interest = 0.0
    for i ∈ range(0, n-1, step=1)
        interest += (1 + r)^-i
    end
    return p * interest
end

pv(500_000, 0.10, 20.0)
