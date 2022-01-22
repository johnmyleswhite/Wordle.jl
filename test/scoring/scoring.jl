module TestScoring

import Wordle
import Test: @test, @test_throws

trials = Wordle.Trial[
    Wordle.Trial(
        Wordle.Candidate("alone"),
        Wordle.Result("⬜⬜🟩⬜⬜")
    ),
]

never_seen_chars = Wordle.never_seen(trials)
@test !never_seen_chars[Wordle.to_index('a')]
@test !never_seen_chars[Wordle.to_index('l')]
@test !never_seen_chars[Wordle.to_index('o')]
@test !never_seen_chars[Wordle.to_index('n')]
@test !never_seen_chars[Wordle.to_index('e')]
@test sum(never_seen_chars) === 26 - 5

trials = Wordle.Trial[
    Wordle.Trial(
        Wordle.Candidate("alone"),
        Wordle.Result("⬜⬜🟩⬜⬜")
    ),
    Wordle.Trial(
        Wordle.Candidate("trust"),
        Wordle.Result("⬜⬜⬜⬜⬜")
    ),
]

never_seen_chars = Wordle.never_seen(trials)
@test !never_seen_chars[Wordle.to_index('a')]
@test !never_seen_chars[Wordle.to_index('l')]
@test !never_seen_chars[Wordle.to_index('o')]
@test !never_seen_chars[Wordle.to_index('n')]
@test !never_seen_chars[Wordle.to_index('e')]
@test !never_seen_chars[Wordle.to_index('t')]
@test !never_seen_chars[Wordle.to_index('r')]
@test !never_seen_chars[Wordle.to_index('u')]
@test !never_seen_chars[Wordle.to_index('s')]
@test !never_seen_chars[Wordle.to_index('t')]

@test sum(never_seen_chars) === 26 - 5 - 4

end # module
