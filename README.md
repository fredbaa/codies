# codies
Some coding assignments 

## fast-route.rb
Given a 2D matrix with values 1 (block) and 0 (path), find the shortest path from top-leftmost corner to the bottom-rightmost corner.
You can only move top, left, right, and bottom (no diagonal movements), and should be able to backtrack path.
The code should return -1 if there are no paths available.

E.g

Given the following matrix:

```
0 1 1 0 0
0 0 1 1 0
0 0 0 1 0
1 1 0 0 0
```

it should return `7` as the shortest path


```
0 1 1 0 0
1 1 1 1 0
0 0 0 1 0
1 1 0 0 0
```

should return `-1` since there are no paths possible
