module TestUtils

import Wordle
import Test: @test, @test_throws

@test Wordle.to_index('a') === 1
@test Wordle.to_index('z') === 26

counts = Wordle.LetterCounts(Wordle.Candidate("alone"))
@test counts['a'] === 1
@test counts['l'] === 1
@test counts['o'] === 1
@test counts['n'] === 1
@test counts['e'] === 1
@test sum(counts.counts) === 5

end # module
