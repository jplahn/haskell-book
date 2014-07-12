# Setting up

Fortunately for us, getting set up to run Haskell code is easy. All we really need is a place to write our code and then someway to compile it.

The first one is easy: just use whatever you already use as your text editor. I use Sublime Text and I really like it, but there's plenty of other text editors out there so search around and find what you you like if you don't have a preference already.

Getting our Haskell compiler is also extremely simple. There's different choices for compilers, but we're going to use GHC, which is the most popular choice out there. All you need to do here is download the [Haskell Platform](http://www.haskell.org/platform/) and you should be up and running.

While we're here, I might as well explain a little about what you installed. As you may have gleaned from the last chapter, GHC provides an interactive mode whereby we can load scripts and execute functions on the spot - *nice*. We can also do all of the standard stuff you would expect from a compiler, like running scripts and such.

So from your command line, type `ghci` and you should launch into the interactive environment. From there, you can do things like:

```haskell
    ghci> 2 + 2
    4
    ghci> 3 * 3
    9
```
*Exciting*.

If we have a file named `adder.hs` (Haskell scripts end in .hs), then you could load all of the functions defined in that file into your interactive environment by typing `:l adder`, provided you ran `ghci` in the directory where your file is located.

It is from here in the interactive environment that we will test out many of the functions that Haskell provides and that we write ourselves.
