module Options

export Option,
       Call,
       Put

abstract type Option end

struct Call <: Option
    S  # stock price
    K  # strike price
    r  # rate
    σ  # volatility
    T  # maturity period
end

struct Put <: Option
    S  # stock price
    K  # strike price
    r  # rate
    σ  # volatility
    T  # maturity period
end

end # module
