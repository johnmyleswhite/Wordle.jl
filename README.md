# Wordle.jl

A Julia library for solving Wordle puzzles.

## Usage

```
julia> import Wordle: play

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

```
