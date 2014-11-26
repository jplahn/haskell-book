# Higher Order Functions

In the previous section, we were discussing the `map` function, given by the definition below.

```haskell
map :: (a -> b) -> [a] -> [b]
map f [] = []
map f (x:xs) = f x : map f xs
```

As shown in the type declaration, the first argument to map is a function, denoted by (a -> b). For those used to imperative languages, it likely seems strange to pass a function into another function. 

The reason we can do this is that in Haskell, we have the concept of higher order functions, or first class functions. A higher order function is one that takes another function as an argument or returns a function as a result. Let's take a look.

The real power in being able to use higher order functions is the ability they give us to simplify our code and make functions more general and, hopefully, less error prone. To prove it, we're going to work through the progressions of creating the `map` function above, with inspiration from the Haskell Wikis [Higher Order Functions](https://www.haskell.org/haskellwiki/Higher_order_function) page. 

Say we want functions that will multiply the values in a list by some number. So we could have the following definitions.

```haskell

```haskell


















 