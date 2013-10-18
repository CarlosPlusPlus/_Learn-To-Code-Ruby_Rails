# Warm-Up Exercises

## Setup

Clone this repository.

```sh
git clone git@github.com:JumpstartLab/warmup-exercises.git
```

### Ruby

* Install [RVM](https://rvm.io/)
* Install [Ruby 2.0.0](http://www.ruby-lang.org/en/)

```bash
$ \curl -L https://get.rvm.io | bash -s stable --rails --autolibs=enabled
```

### JavaScript & CoffeeScript

* Install [Node.js](http://nodejs.org/)
* Install [jasmine-node](https://github.com/mhevery/jasmine-node)

```bash
$ brew install node
$ npm install jasmine-node -g
```

Update the `~/.bash_profile` to include NPM binary files on the PATH:

```
export PATH=/usr/local/share/npm/bin:$PATH
```

### Clojure

* Install [Clojure](http://clojure.org)

```
brew install clojure
```

## Execution

### Ruby

```bash
$ cd WARMUP
$ ruby test.rb
```

### JavaScript

```bash
$ cd WARMUP
$ jasmine-node test.spec.js
```

### CoffeeScript

Jasmine-Node favors JavaScript files over CoffeeScript (even with the differing
file endings) so the test file named is named differently.

```bash
$ cd WARMUP
$ jasmine-node --coffee coffee.spec.coffee
```

### Clojure

```bash
$ cd WARMUP
$ clj test.clj
```
