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
🟨⬜🟨⬜⬜
Iteration: 2
Candidate: basin
🟨⬜🟨⬜⬜
⬜🟩⬜🟩🟨
Iteration: 3
Candidate: manic
🟨⬜🟨⬜⬜
⬜🟩⬜🟩🟨
⬜🟩🟩🟩🟩
Iteration: 4
Candidate: panic
🟨⬜🟨⬜⬜
⬜🟩⬜🟩🟨
⬜🟩🟩🟩🟩
🟩🟩🟩🟩🟩
Success!
4

julia> play("panic", verbose = true, debug = true)
Iteration: 1
Candidate: irate
🟨⬜🟨⬜⬜
==========================================
Constraints
* Lower Bounds:
 * a ≥ 1
 * i ≥ 1

* Exact Matches:
 * ·····

* Global Ban:
 * e = 0
 * r = 0
 * t = 0


* Local Ban:
 * word[1] ≠ i
 * word[3] ≠ a


==========================================
Number of Candidates: 41 / 2315 [1.771%]
Iteration: 2
Candidate: basin
🟨⬜🟨⬜⬜
⬜🟩⬜🟩🟨
==========================================
Constraints
* Lower Bounds:
 * a ≥ 1
 * i ≥ 1
 * n ≥ 1

* Exact Matches:
 * ·a·i·

* Global Ban:
 * b = 0
 * e = 0
 * r = 0
 * s = 0
 * t = 0


* Local Ban:
 * word[1] ≠ i
 * word[3] ≠ a
 * word[5] ≠ n


==========================================
Number of Candidates: 3 / 2315 [0.130%]
Candidates: ["panic", "mania", "manic"]

Iteration: 3
Candidate: manic
🟨⬜🟨⬜⬜
⬜🟩⬜🟩🟨
⬜🟩🟩🟩🟩
==========================================
Constraints
* Lower Bounds:
 * a ≥ 1
 * c ≥ 1
 * i ≥ 1
 * n ≥ 1

* Exact Matches:
 * ·anic

* Global Ban:
 * b = 0
 * e = 0
 * m = 0
 * r = 0
 * s = 0
 * t = 0


* Local Ban:
 * word[1] ≠ i
 * word[3] ≠ a
 * word[5] ≠ n


==========================================
Number of Candidates: 1 / 2315 [0.043%]
Candidates: ["panic"]

Iteration: 4
Candidate: panic
🟨⬜🟨⬜⬜
⬜🟩⬜🟩🟨
⬜🟩🟩🟩🟩
🟩🟩🟩🟩🟩
==========================================
Constraints
* Lower Bounds:
 * a ≥ 1
 * c ≥ 1
 * i ≥ 1
 * n ≥ 1
 * p ≥ 1

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
 * word[1] ≠ i
 * word[3] ≠ a
 * word[5] ≠ n


==========================================
Number of Candidates: 0 / 2315 [0.000%]
Candidates: String[]

Success!
4

```
