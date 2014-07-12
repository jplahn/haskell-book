# What's a Haskell?!

For those of you who may have landed on this oddly named book and are wondering what distrubing world you have entered, let's see what almighty Wikipedia can tell us about *what* Haskell is.

    "Haskell is a standardized, general-purpose purely functional programming language, with non-strict semantics and strong static typing."

Got it? Good. Chapter done.

Just kidding. Hiding in this cryptic definition is the essence of Haskell; let's boil it down.

First, Haskell can, in fact, be used to build software -- which is good for our purposes. It wouldn't be much use for you and I to spend our precious time on an academic exercise.

I don't know about you, but I had no idea what "non-strict semantics" meant before learning Haskell. The essence of this fact is that any arguments we pass into a function will not be evaluated unless our function actually needs them. Example:

```haskell
    ghci> let list = [1..]
    ghci> take 10 list
    [1,2,3,4,5,6,7,8,9,10]
```
We've launched into the interactive version of GHC, the Glasgow Haskell Compiler. From here, we can debug functions and run any variety of files. We first create an infinite list of numbers from 1 until, well, infinity. This is a nice little piece of Haskell that we'll dive into more later.

From there, we use the `take` function to grab teh first 10 elements from the list. This looks straightforward, and it is -- except for what's going on under the hood. Haskell relies on "lazy" evaluation, meaning that it won't create the infinite list above unless it needs to. So when we call `take 10 list`, it begins generating the numbers in the infinite list until it hits 10 and realizes that it's done. The same goes for a list of any other size. Haskell will wait for us to tell it how much of the list it actually needs to create. This is also known as call-by-need.

So we know Haskell is a lazy language that's also capable of creating real software. Haskell is also statically typed. This means that the code we write is analyzed when we compile it, to make sure that we don't try to shove an `Int` into a `Char`. Haskell, due to it being strongly-statically typed, will tell us when we try to do that at compile time, letting us avoid a catastrophic meltdown when we try to run our program. Opinions vary on this matter, but we'll leave that for another day.

And finally, the pièce de résistance of Haskell -- functional programming. It is this right here that is going to cause the most retraining for my imperatively trained friends. For most people, imperative programming is their bread and butter. It encompasses our favorite languages like Java, C++, and C. Imperative languages transform the state of our programs, meaning we can freely assign and reassign variables and create functions that have as many side effects as we desire.

Functional programming (FP) does away with all of those concepts. In a purely functional language, like Haskell, all of our methods must operate without side effects and we can't change data once it has already been created. Every method we write will take an argument and return something. There are other points to FP, but we won't dwell on those for the time being.

And there you have it, Haskell in the briefest of nut shells. This likely makes little to no sense, but it will in due time -- so fear not!
