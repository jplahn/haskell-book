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
ghci> let func = curry snd
ghci> func 1 2
2
```

If you try to run `snd 1 2`, ghci will throw an error because `snd` is uncurried and you attempted to use it as a curried function. On the other hand, if you attempt to write `f(1,2)`, an error will be thrown as well for the opposite reason. The `curry` function will return the curried form of a function, which changes the definition of `snd` to this, where func is our new function:

```haskell
func :: a -> b -> b
func _ y = y
```

So what's the point? The curried function may look like it's accomplishing the same thing (which it is), but it allows us to leverage partial application with our functions. What is that? Glad you asked!


### Partial Application

We already saw partial application at work in the previous section, so hopefully this will make it even clearer (if it wasn't already). Simply put, partial application is the practice of passing a function less than the total number of arguments that it requires. For example, using `func` defined above, we can do the following:

```haskell
ghci> let funcOne = func 1
ghci> funcOne 4
4
```





















