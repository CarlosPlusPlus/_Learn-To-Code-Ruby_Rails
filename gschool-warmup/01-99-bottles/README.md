# 99 Bottles of Beer

Write a program which prints out the lyrics to that beloved classic, that field-trip favorite: _99 Bottles of Beer on the Wall._

## Requirements

* Your file should be called `beer.rb`
* The program should be called with `Beer.song`
* The program should output to STDOUT using `puts`
* Each verse should be separated by a single blank line.

## Extensions

* Consider monkeypatching Fixnum so you could run `99.bottles_of_beer` or `12.bottles_of_beer` to run the song from an arbitrary starting point.
* Make it a bit more flexible, so `99.bottles_of_beer` works, but so does `99.bottles_of("seltzer")`

## To run the test

```sh
ruby 01-99-bottles/test.rb
```

Or, if you're already in that directory

```sh
ruby test.rb
```

## Data

Here's a sampling of the lyrics...

```
99 bottles of beer on the wall, 99 bottles of beer.
Take one down and pass it around, 98 bottles of beer on the wall.

98 bottles of beer on the wall, 98 bottles of beer.
Take one down and pass it around, 97 bottles of beer on the wall.

97 bottles of beer on the wall, 97 bottles of beer.
Take one down and pass it around, 96 bottles of beer on the wall.
```

Then, at the end...

```
1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.

No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
```

## Source
[Learn to Program](http://pine.fm/LearnToProgram/?Chapter=06) by Chris Pine

