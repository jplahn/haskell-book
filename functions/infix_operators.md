# Infix Operators

As we have seen so far, most of our functions are called in the form `func arg1 arg2`, which is considered *prefix* notation. That is, the function name comes before the arguments. Haskell provides another handy notation type called *infix* notation, whereby the function name is sandwiched between the arguments. Let's look at some of their properties.


## Infix to prefix

If, for some reason, we want to use one of our infix functions as a prefix function, we do that very easily by wrapping the function with parentheses. For example, to divide two numbers, we can do it either way:

```haskell

```