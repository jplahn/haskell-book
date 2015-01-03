# Infix Operators

As we have seen so far, most of our functions are called in the form `func arg1 arg2`, which is considered *prefix* notation. That is, the function name comes before the arguments. Haskell provides another handy notation type called *infix* notation, whereby the function name is sandwiched between the arguments. Let's look at some of their properties.


## Infix to prefix

If, for some reason, we want to use one of our infix functions as a prefix function, we do that very easily by wrapping the function with parentheses. For example, to divide two numbers, we can do it either way:

```haskell
ghci> 8 / 4
2.0
ghci> (/) 8 4
2.0
```

## Prefix to infix

Just like we can write infix operators with prefix notation, we can do the opposite as well. Let's look at the break function, which doesn't make much sense to use with `infix` notation, but shows us that it can be done. The function definition is below:

```haskell
break :: (a -> Bool) -> [a] -> ([a],[a])
break _ xs@[]           =  (xs, xs)
break p xs@(x:xs')
           | p x        =  ([],xs)
           | otherwise  =  let (ys,zs) = break p xs' in (x:ys,zs)
```
Like we have done for our other functions, let's walk through the definition. 










