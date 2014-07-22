# GHCi

Much of what we will do in the beginning can be accomplished with GHCi. It's a great way for us to quickly compile code and see what happens. The benefits of this are obvious for larger projects, allowing us to test out new functions quickly without relying on the rest of the program.

So to reiterate, in your terminal type `ghci` and you should see the following output:

```haskell
$: ghci
GHCi, version 7.6.3: http://www.haskell.org/ghc/      :? for help
Loading package ghc-prim ... linking ... done.
Loading package integer-gmp ... linking ... done.
Loading package base ... linking ... done.
Prelude>
```

Thought it may be slightly different depending on your version. Prelude is the standard Haskell package that is imported by default into ghci. So `Prelude>` lets us know that we can use any functions defined in Prelude. Suppose we wanted to create a union of two sets. Recall that a union of [1,2,3,4] and [3,4,5,6] is [1,2,3,4,5,6] -- that is, it takes all of the unique elements of each sets and a single instance of any repeated values and creates a new set containing those elements.

Unfortunately, Prelude doesn't have a union method so we need to search the great [docs](http://www.haskell.org/ghc/docs/7.6-latest/html/libraries/index.html) for union and hopefully come across the [Data.List](http://www.haskell.org/ghc/docs/7.6-latest/html/libraries/base-4.6.0.1/Data-List.html) module. This is exactly what we need. Now to use this package in ghci, we need to load it. We can do it like so:

```haskell
Prelude> :m + Data.List
```

This tells ghci to load the Data.List module and allow us to use it. If we wanted to load multiple modules, we could simply add more names after Data.List. Now we can take the union of two sets:

```haskell
Prelude Data.List> "cat" `union` "dog"
"catdog"
Prelude Data.List> [1,2,3,4] `union` [3,4,5,6]
[1,2,3,4,5,6]
```
Notice also how our prompt also includes Data.List, letting us know that we have loaded it into our interactive environment.

Eventually, this prompt could get really long if we load several modules, so we're going to shorten it. I tend to prefer making my prompt `ghci>` so that I know I'm in the interactive environment. You can do it like this:

```haskell
Prelude> :set prompt "ghci> "
ghci>
```
