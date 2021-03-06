# Currying

We're now ready to look at a fundamental aspect of functional programming: currying (sorry, no tasty food here). There are a few topics to discuss when considering currying, so we'll take those one by one. But first the definition, courtesy of Wikipedia:

```
Currying is the technique of translating the evaluation of a function that takes multiple arguments (or a tuple of arguments) into evaluating a sequence of functions, each with a single argument (partial application)
```

Named after, and developed by, Haskell Curry, currying allows us to transform a function that takes several arguments into one that takes a single argument and returns another function if more arguments are still needed. We'll look at this in more depth. 

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

If you try to run `snd 1 2`, ghci will throw an error because `snd` is uncurried and you attempted to use it as a curried function. On the other hand, if you attempt to write `func(1,2)`, an error will be thrown as well for the opposite reason. The `curry` function will return the curried form of a function, which changes the definition of `snd` to this, where func is our new function:

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
`funcOne` is the result of partially applying `func`, since we only gave it a single argument. Our new function, `funcOne`, takes the second argument of our pair, which completes the function definition of `func`, allowing us to return the result. If our function takes n arguments, we could partially apply our function n - 1 times until we finally return the result. 

In the above example, it's important to remember that the -> operator is right associative, whereas function application is left associative. This means that `func` actually has a function definition that looks like:

```haskell
func :: a -> (b -> b)
```
This means that `func` takes a single argument (the first element of the pair) and returns a function that takes an element and returns it. This is why, when you perform our most recent computation in `ghci`, you don't get 1 as a result instead of 4. 

It is important to remember that *all functions in Haskell are curried*, even if they don't seem like they are. Put another way, all functions in Haskell take just a single argument. 

Let's look at another example to really drill down how we should represent function definitions. Recall our basic add function with the following definition slightly modified):

```haskell
add :: Int -> Int -> Int
add x y = x + y

```
It is *incorrect* to interpret the `add` function as taking two `Int`s and returning an `Int`. The correct interpretation of the notation is that `add` takes an `Int` and returns something of the type `Int -> Int`. If you keep this idea clear in your head, then it will be obvious that all functions are curried.  

In the grand scheme of things, currying isn't *that* important to the beginning programmer. Down the line, though, currying will be a necessary aspect to certain Haskell idioms. 










