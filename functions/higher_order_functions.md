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
performOp :: (Num a) => a -> (a -> a -> a) -> [a] -> [a]
performOp n op [] = []
performOp n op (x:xs) = op n x : performOp n op xs
```
Making sure it works:

```haskell
ghci> performOp 2 (+) [1,2,3,4,5]
[3,4,5,6,7]
ghci> performOp 2 (/) [1,2,3,4,5]
[2.0,1.0,0.6666,0.5,0.4]
```

Much better than before! But we can still do one better. What's the difference between performing some arithmetic operation on our list versus something that returns a boolean? Right now, it's the *n* that we're passing in, which is unnecessary for other operations. And, its our type declaration that needs changing. But all of this is an easy change.

```
performFunc :: (a -> b) -> [a] -> [b]
performFunc f []        = []
performFunc f (x:xs)    = f x : performFunc f xs
```
We just removed the *n* and modified the function type that we needed to indicate that it can change a to b. *Waiittt*. You may think this looks similar to `map` and you would be right! This is the exact same definition. Now, instead of writing several functions for every use case, we have on function that can be used over many use cases, all because of higher order functions. Pretty cool, huh? 

The other definition of higher order functions is that they can return functions as their result. This is allows us to do something like:

```haskell
ghci> let double = map (2*)
ghci> double [1,2,3,4,5]
[2,4,6,8,10]
```

Wow! We created a *variable* that held the function definition that `map` returned. So we can now apply double over lists and it will perform the same way as if we called ```map (2*) [1,2,3,4,5]``` all in one statement. This magic is provided to us by currying, the topic of our next section. 

















 