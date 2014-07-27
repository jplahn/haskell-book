# Functions

It's time to dive into the building blocks of any meaningful program: functions. The way you construct functions in Haskell may be different than anything you've seen previously. While it may feel strange at first, I think you'll find that you like this way of defining functions (hopefully).

You got a little taste for how to define a function in the last chapter, so let's revisit our `add` function.

```haskell
add :: (Num a) => a -> a -> a
add x y = x + y
```

The first line is what I want to focus on. As we discussed in the first chapter, Haskell is strongly typed; this becomes extremely powerful when we leverage that while writing our functions. The first line is what does that for us.

This type declaration starts by declaring the name of our function: in this case, add. From there, we place any constraints on our function that we need. All of the a's are probably throwing you off, so let me explain them. But before I do that, I'm going to regress into a discussion of types. For now, think of the a's as representing some "type" of variable that the inputs and output of the function must have, i.e. if we substitute "Integer" for "a", our function must take in integers and return an integer.

