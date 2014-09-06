# Types

If we're going to understand Haskell's type system, then we better understand a little bit about types. Since Haskell is statically typed, as we have mentioned, our program won't even compile if we try to do something crazy, like take the square root of a boolean. This is all a good thing.

While Haskell helps to make sure we don't do anything stupid, it is also capable of lending us a hand when we aren't explicit enough. That is, Haskell has type inference; meaning that if we assign an integer to some variable, we don't have to explicity tell the compiler that the variable takes an integer, it will figure it out for us.

But typically, we want to be explicit with our intentions and this is where the type system comes into play.

So what exactly is a type? It's simply a classification of some data, typically that we're going to thrust into some variable. `True` is of type Boolean, `"Hello"` is a String type, and so on. So, when we define a variable of type Boolean, then GHC is going to get mad at us if we try to put an Integer in it. Let's play around with GHCi to check out some types. We're going to use `:type` or `:t` (depending on your style) to determine the types we're dealing with.


```haskell
ghci> :t "Hello"
"Hello" :: [Char]
ghci> :t 42
42 :: Num a => a
ghci> :type True
True :: Bool
ghci> :t (False, "Hello", 'A')
(False, "Hello", 'A') :: (Bool, [Char], Char)
```

So everything is pretty straightforward, but let's just brush over the first one. In Haskell, strings are represented by character arrays, so our "Hello" string is simply an array that looks like ['H', 'e', 'l', 'l', 'o']. So if we wanted to get the 'e' character in the array, we would do:

```Haskell
ghci> let word = "Hello"
ghci> word !! 1
'e'
```
Don't worry about the crazy looking syntax: all this is doing is showing that a string is an array. Let's take a gander at function types.
