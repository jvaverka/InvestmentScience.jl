# Types of Interest

Investments can have **simple** or **compound** interests rates.

## Simple

An amount `A` invested at a _simple annual rate_ `r` will produce `A(1 + rn)` after `n` years.

In general, we have:

```
V(n) = A(1 + rn)
```

Where `r` is the periodic rate, `n` is the number of periods and `V(n)` is the accumulated amount.

**_Note_**: `V(n)` is a linear function of `n`.

## Compound

An amount `A` invested at a _compound annual rate_ `r` will be multiplied by a factor `(1 + r)` each year.

In fact, the accumulated amount after `n` is given by:

```
V(n) = A(1 + r)^n
```

### Theorem

If the principal `A` is invested at an annual rate `r` compounded `m` times in a year,
then the amount `V(n)` in the account after `n` compounding periods is:

```
V(n) = A(1 + r/m)^n
```
