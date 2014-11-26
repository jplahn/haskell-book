# Higher Order Functions

In the previous section, we were discussing the `map` function, given by the definition below.

```haskell
map :: (a -> b) -> [a] -> [b]
map f [] = []
map f (x:xs) = f x : map f xs
```

