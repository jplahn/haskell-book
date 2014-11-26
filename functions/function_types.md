# Function Types

As you probably expected, individual objects have types. Where the type system of Haskell really shines is when we define our functions. Let's look at an example from the Prelude package: the `fst` function, which returns the first element in a tuple.

```haskell
ghci> fst ("hello", True)
"hello"
ghci> fst ("adios", "goodbye")
"adios"
```

As you can see, the tuple does not require two elements of the same type, unlike our `add` function which required two Nums. So, you might anticipate that the type declaration of the function would indicate that the input types can be different. You would be correct.

```haskell
fst :: (a, b) -> a
fst (x, _) =  x
```

From the function declaration, `fst` takes an element of type a and type b. That doesn't mean that a and b *can't* be the same type, but they *don't* have to be. So our function declaration says that `fst` takes a tuple with two elements of potentially differing types (a and b) and then returns the first element of type a. So the two variables can be of *any* type and it will still work.

Let's took a look at a little more complicated function that will allow us to explain several other important features of Haskell in more detail: `map`. `map` is a wonderful function that performs some function over every item in a list. Let's first look at an example.

```haskell
ghci> map odd [1,2,3,4,5,6,7,8]
[True,False,True,False,True,False,True,False]
ghci> map sqrt [1,4,9,16,25,36] -- Square root
[1.0,2.0,3.0,4.0,5.0,6.0]
```

Pretty straightforward and *extremely* powerful. Let's look at its defintion.

```haskell
map :: (a -> b) -> [a] -> [b]
map f []     = []
map f (x:xs) = f x : map f xs
```

There's a few things to discuss here, but let's first look at the type declaration. First, we see the expression (a -> b) which indicates that the first argument of the function is another function. This ability to pass functions as arguments is one of the fundamental aspects of Haskell. We'll discuss it in more detail next. The function that `map` accepts is any function that takes one value and transforms it to another value. So we pass it in the `odd` function which returns a boolean indicating whether a number is odd or not. A simplified definition of `odd` is below.

```haskell
even, odd       :: (Integral a) => a -> Bool
even n          =  n `rem` 2 == 0
odd             =  not . even
```
This actually defines both the `even` and `odd` functions, taking the remainder of some number when divided by 2 and checking if that's 0 to indicate an even number. If it's not, then we simply `not` the boolean value to get true indicating that the number is odd. In case you were wondering, `rem` is an *infix* operator, which we will discuss in more depth later.

Back to `map`, the second argument is a list of type a, denoted by [a]. Finally, we return a list of type b, which makes sense considering the function we pass in can return a value of type b given a value of type a as input. As shown in the example above, when we map the `odd` function over numbers, we are returned booleans as the result.

In case it wasn't obvious, when we call 
```
map f (x:xs) = f x : map f xs
```
we are separating the list into x, which is the front element of the list, and xs, which is the remainder of the list. We call the function f on x and then recursively call the map function on xs, passing it f which performs the exact same computation as just described. We'll discuss building functions in more depth later, so if that wasn't clear, fear not.  

So to summarize, `map` takes a function and a list as arguments and returns a list with the function applied over all of the entries. `map` introduces some other interesting aspects of creating functions, so we'll dive into all of those in the following sections. 
