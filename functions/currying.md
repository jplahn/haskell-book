# Currying

We're now ready to look at a fundamental aspect of functional programming: currying (sorry, no tasty food here). There are a few topics to discuss when considering currying, so we'll take those one by one. But first the definition, courtesy of Wikipedia:

```
Currying is the technique of translating the evaluation of a function that takes multiple arguments (or a tuple of arguments) into evaluating a sequence of functions, each with a single argument (partial application)
```

Named after, and developed by, Haskell Curry, currying allows us to transform a function that takes several arguments into one that takes a single argument and returns another function if more argument are still needed. We'll look at this in more depth. 

### Curried Form

Say we have a function with the following definition:

```haskell
snd :: (a -> b) -> b
snd (_, y) = y
```
Which is actually just the `snd` function provided in Prelude, which returns the second element of a pair. This function is *uncurried*, as evidenced by the function definition containing a function as an argument, denoted by (a -> b). 

Now say we want to get the *curried* form of `snd`. We can do the following:

```haskell
ghci> snd(1,2)
2
ghci> snd 1 2
<interactive>:10:5: ....        -- error
ghci> let f = curry snd
ghci> f 1 2
2
ghci> f(1,2)
<interactive>:14:1:     -- error
```














