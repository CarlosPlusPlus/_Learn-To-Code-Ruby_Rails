# Chunky Numbers

Write a program that will take a number from 0 to 999,999,999,999 and break it into chunks.

```ruby
Chunks.new(1234567890).split
# => [1, 234, 567, 890]

Chunks.new(1000).split
# => [0, 0, 1, 0]
```

The program must also report any values that are out of range.

## Source
Part of [JavaRanch CattleDrive, exercise 4b](http://www.javaranch.com/say.jsp)

