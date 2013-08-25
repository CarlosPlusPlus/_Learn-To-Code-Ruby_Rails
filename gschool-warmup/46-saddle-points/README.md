# Saddle Points

Write a program to search for the "saddle points" in a square matrix of
integers. A saddle point is a cell whose value is greater than or equal to any
in its row, and less than or equal to any in its column.

```
    0  1  2
  |---------
0 | 9  8  7
1 | 5  3  2     <--- saddle point at (1,0)
2 | 6  6  7
```


```ruby
matrix = Matrix.new("9 8 7\n5 3 2\n6 6 7")
matrix.saddle_points
# => [[1, 0]]
```

```
    0  1  2
  |---------
0 | 4  5  4
1 | 3  5  5     <--- saddle point at (1,0)
2 | 1  5  4
```

A matrix may have zero saddle points, or it might have several.

## Source
[J Dalbey's Programming Practice problems](http://users.csc.calpoly.edu/~jdalbey/103/Projects/ProgrammingPractice.html)
