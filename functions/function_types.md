# Function Types

As you probably expected, individual objects have types. Where the type system of Haskell really shines is when we define our functions. Let's look at an example from the Prelude package: the `fst` function, which returns the first element in a tuple.

```haskell
ghci> fst ("hello", True)
"hello"
ghci> fst ("hello", "goodbye")
"hello"
```

As you can see, the tuple does not require two elements of the same type, unlike our `add` function which required two Nums. So, you might anticipate that the type declaration of the function would indicate that the input types can be different. You would be correct.

```haskell
fst :: (a, b) -> a
fst (x, _) =  x
```

From the function declaration, `fst` takes an element of type a and type b. That doesn't mean that a and b *can't* be the same, but they *don't* have to be. So our function declaration says that `fst` takes a tuple with two elements of potentially differing types (a and b) and then returns the first element of type a. 
