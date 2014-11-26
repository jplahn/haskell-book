# Higher Order Functions

In the previous section, we were discussing the `map` function, given by the definition below.

```haskell
map :: (a -> b) -> [a] -> [b]
map f []     = []
map f (x:xs) = f x : map f xs
```

As shown in the type declaration, the first argument to map is a function, denoted by (a -> b). For those used to imperative languages, it likely seems strange to pass a function into another function. 

The reason we can do this is that in Haskell, we have the concept of higher order functions, or first class functions. A higher order function is one that takes another function as an argument or returns a function as a result. Let's take a look.

The real power in being able to use higher order functions is the ability they give us to simplify our code and make functions more general and, hopefully, less error prone. To prove it, we're going to work through the progressions of creating the `map` function above, with inspiration from the Haskell Wikis [Higher Order Functions](https://www.haskell.org/haskellwiki/Higher_order_function) page. 

Say we want functions that will multiply the values in a list by some number. So we could have the following definitions.

```haskell
doubleList :: (Num a) => [a] -> [a]
doubleList []       = []
doubleList (x:xs)   = 2*x : doubleList xs

tripleList :: (Num a) => [a] -> [a]
tripleList []       = []
tripleList (x:xs)   = 3*x : tripleList xs
```
We could do this all the way up to some arbitrary number. Clearly this is a terrible way of approaching the problem and it should be clear that the functions look identical, other than the value multiplying x. Let's change the function definition slightly to pass in a more general value of *n* that will multiply each value in the list.

```haskell
multiplyN :: (Num a) => a -> [a] -> [a]
multiplyN n []      = []
multiplyN n (x:xs)  = n*x : multiplyN n xs
```
Looks almost the same as before, we've just passed in a value of *n* to multiply each value. Let's make sure it works.

```haskell
ghci> multiplyN 3 [1,2,3,4,5]
[3,6,9,12,15]
```

Great! But still, we're left longing for a little bit *more*. Multiplication isn't very different than addition, which isn't that different from division, so what if we could wrap all of these up into one function? I think we can.

```haskell
performOp :: (Num a) => a -> (a -> a) -> [a] -> [a]
performOp n op [] = []
performOp n op (x:xs) = op n x : performOp n op xs
```






















 