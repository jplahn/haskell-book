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
Like we have done for our other functions, let's walk through the definition. The function takes a a predicate which evaluates to a boolean, something like (= 5) or (< 3). This predicate is then applied to some list, with elements of the same type as in our predicate, and we are returned two lists. The two lists are broken up based on our predicate, whereby the first list is the *longest prefix* of our initial list that does not satisfy the predicate and the second list is everything after it. The rest of the definition includes some things we haven't discussed yet, but it should be clear what is happening. We can apply it as shown:

```haskell
break (> 3) [1,2,3,4,5]
([1,2,3],[4,5])
ghci> (> 3) `break` [1,2,3,4,5]
([1,2,3],[4,5])
ghci> (>= 3) `break` [1,2,3,4,5]
([1,2],[3,4,5])
```
Just as you expected!


## Warnings

While infix operators can look nice and are little more than syntactic sugar, be careful with them. It is generally considered good practice to *not* create new infix functions because of potential issues with precedence. For further reading, consider the following links. 

[Avoiding infix operators](http://www.haskell.org/pipermail/haskell/2003-July/012260.html)

[Deriving precedences from infix operator characters](http://www.haskell.org/pipermail/haskell-cafe/2006-October/018884.html)






