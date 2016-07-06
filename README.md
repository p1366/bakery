# Bakery
Ruby solution for [Bakery coding challenge](Codingchallenge.pdf).

## Installation

[Install Ruby](https://www.ruby-lang.org/en/documentation/installation/) and
clone the repo.

Ensure command
```console
ruby --version
```
has output like
```console
ruby 2.2.3p173
```

## Usage

Script `main.rb` inputs data from `STDIN` and outputs to `STDOUT`. You can use
[sample data](test.sample) or create own.

Run script:
```console
cd bakery
ruby main.rb < test.sample
```

Ensure you got something like
```console
10 VS5 $17.98
    2 x 5 $8.99
14 MB11 $54.8
    1 x 8 $24.95
    3 x 2 $9.95
13 CF $25.85
    2 x 5 $9.95
    1 x 3 $5.95
...
```

## Description

Bakery problem is a kind of
[Change making problem](https://en.wikipedia.org/wiki/Change-making_problem)
which is [Knapsack type problem](https://en.wikipedia.org/wiki/Knapsack_problem).
In terms of the problem, order amount is `amount` and pack sizes is
`coin denominations` which quantity is `N`.
