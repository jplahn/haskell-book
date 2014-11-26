# Higher Order Functions

In the previous section, we were discussing the `map` function, given by the definition below.

```haskell
map :: (a -> b) -> [a] -> [b]
map f [] = []
map f (x:xs) = f x : map f xs
```

As shown in the type declaration, the first argument to map is a function, denoted by (a -> b). For those used to imperative languages, it likely seems strange to pass a function into another function. 