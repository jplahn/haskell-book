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

The above output may be slightly different depending on your version, but the gist should be the same. Prelude is the standard Haskell package that is imported by default into ghci. So `Prelude>` lets us know that we can use any functions defined in Prelude. Suppose we wanted to create a union of two sets. Recall that a union of [1,2,3,4] and [3,4,5,6] is [1,2,3,4,5,6] -- that is, it takes all of the unique elements of each set and a single instance of any repeated values and creates a new set containing those elements.

Unfortunately, Prelude doesn't have a union method so we need to search the fantastic [docs](http://www.haskell.org/ghc/docs/7.6-latest/html/libraries/index.html) for union and hopefully come across the [Data.List](http://www.haskell.org/ghc/docs/7.6-latest/html/libraries/base-4.6.0.1/Data-List.html) module. This is exactly what we need. Now to use this package in ghci, we need to load it. We can do it like so:

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
The `union` method is considered an "infix" function, meaning we can call it in between our two arguments. So `union` says to take "cat" and union it with "dog". Notice also how our prompt  includes Data.List, letting us know that we have loaded the Data.List module into our interactive environment.

Eventually, this prompt could get really long if we load several modules, so we're going to shorten it. I tend to prefer making my prompt `ghci>` so that I know I'm in the interactive environment. You can do it like this:

```haskell
Prelude> :set prompt "ghci> "
ghci>
```

Another thing we can do with ghci is load any files we created so that we can try out any functions that we wrote. Let's create a new file called `add.hs`:

```haskell
add :: (Num a) => a -> a -> a
add x y = x + y
```

We'll go over the syntax in more detail later, but our first line is defining a funtion called `add` that takes two Nums and returns a Num. The next line creates the function, telling us that it should be called with two parameters. Remember, Haskell is a pure functional language, so every function will return exactly one value. But don't worry if that doesn't make sense, all will be clear soon enough!

To use our new function, we need to load it into our environment. If you're not in ghci already, navigate to the location of `add.hs` and fire up ghci. From there, type:

```haskell
ghci> :l add
[1 of 1] Compiling Main             ( add.hs, interpreted )
Ok, modules loaded: Main.
ghci> add 2 2
4
ghci> add 9 1
10
```
Beautiful. `:l` allows us to load scripts into our interactive environment; we can load as many as we want.

As I said earlier, we're going to hang out in ghci quite a bit as we get ramped up. So learn it, love it, and let's start creating some functions.
