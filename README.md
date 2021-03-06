# Wordle.jl

A Julia library for solving Wordle puzzles.

## Usage

```
julia> import Wordle: play

julia> play("panic")
4

julia> play("panic", verbose = true)
Iteration: 1
Candidate: irate
π¨β¬π¨β¬β¬
Iteration: 2
Candidate: basin
π¨β¬π¨β¬β¬
β¬π©β¬π©π¨
Iteration: 3
Candidate: manic
π¨β¬π¨β¬β¬
β¬π©β¬π©π¨
β¬π©π©π©π©
Iteration: 4
Candidate: panic
π¨β¬π¨β¬β¬
β¬π©β¬π©π¨
β¬π©π©π©π©
π©π©π©π©π©
Success!
4

julia> play("panic", verbose = true, debug = true)
Iteration: 1
Candidate: irate
π¨β¬π¨β¬β¬
==========================================
Constraints
* Lower Bounds:
 * a β₯ 1
 * i β₯ 1

* Exact Matches:
 * Β·Β·Β·Β·Β·

* Global Ban:
 * e = 0
 * r = 0
 * t = 0


* Local Ban:
 * word[1] β  i
 * word[3] β  a


==========================================
Number of Candidates: 41 / 2315 [1.771%]
Iteration: 2
Candidate: basin
π¨β¬π¨β¬β¬
β¬π©β¬π©π¨
==========================================
Constraints
* Lower Bounds:
 * a β₯ 1
 * i β₯ 1
 * n β₯ 1

* Exact Matches:
 * Β·aΒ·iΒ·

* Global Ban:
 * b = 0
 * e = 0
 * r = 0
 * s = 0
 * t = 0


* Local Ban:
 * word[1] β  i
 * word[3] β  a
 * word[5] β  n


==========================================
Number of Candidates: 3 / 2315 [0.130%]
Candidates: ["panic", "mania", "manic"]

Iteration: 3
Candidate: manic
π¨β¬π¨β¬β¬
β¬π©β¬π©π¨
β¬π©π©π©π©
==========================================
Constraints
* Lower Bounds:
 * a β₯ 1
 * c β₯ 1
 * i β₯ 1
 * n β₯ 1

* Exact Matches:
 * Β·anic

* Global Ban:
 * b = 0
 * e = 0
 * m = 0
 * r = 0
 * s = 0
 * t = 0


* Local Ban:
 * word[1] β  i
 * word[3] β  a
 * word[5] β  n


==========================================
Number of Candidates: 1 / 2315 [0.043%]
Candidates: ["panic"]

Iteration: 4
Candidate: panic
π¨β¬π¨β¬β¬
β¬π©β¬π©π¨
β¬π©π©π©π©
π©π©π©π©π©
==========================================
Constraints
* Lower Bounds:
 * a β₯ 1
 * c β₯ 1
 * i β₯ 1
 * n β₯ 1
 * p β₯ 1

* Exact Matches:
 * panic

* Global Ban:
 * b = 0
 * e = 0
 * m = 0
 * r = 0
 * s = 0
 * t = 0


* Local Ban:
 * word[1] β  i
 * word[3] β  a
 * word[5] β  n


==========================================
Number of Candidates: 0 / 2315 [0.000%]
Candidates: String[]

Success!
4

```
