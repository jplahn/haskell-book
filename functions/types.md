# Types

If we're going to understand Haskell's type system, then we better understand a little bit about types. Since Haskell is statically typed, as we have mentioned, our program won't even compile if we try to do something crazy, like take the square root of a boolean. This is all a good thing.

While Haskell helps to make sure we don't do anything stupid, it is also capable of lending us a hand when we aren't explicit enough. That is, Haskell has type inference; meaning if we assign an integer to some variable, we don't have to explicity tell the compiler that the variable takes an integer, it will figure it out for us.

But typically, we want to be explicit with our intentions and this is where the type system comes into play.
