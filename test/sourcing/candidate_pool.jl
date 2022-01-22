module TestCandidatePool

import Wordle
import Test: @test, @test_throws

candidates = Wordle.candidate_pool(true)

@test eltype(candidates) === Wordle.Candidate
@test length(candidates) === 2315
@test String(candidates[1]) === "cigar"
@test String(candidates[2315]) === "shave"

candidates = Wordle.candidate_pool(false)

@test eltype(candidates) === Wordle.Candidate
@test length(candidates) > 2315

end # module
