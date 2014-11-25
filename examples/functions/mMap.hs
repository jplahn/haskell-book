mMap :: (a -> b) -> [a] -> [b]
mMap f [] = []
mMap f (x:xs) = f x : mMap f xs