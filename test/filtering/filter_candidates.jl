module TestFilterCandidates

import Wordle
import Test: @test, @test_throws

constraints = Wordle.Constraints()
trial = Wordle.Trial(Wordle.Candidate("alone"), Wordle.Result("⬜⬜⬜⬜⬜"))
Wordle.update_constraints!(constraints, trial)

candidates = Wordle.candidate_pool(true)

@test Wordle.Candidate("alone") in candidates
Wordle.filter_candidates!(candidates, constraints)
@test !(Wordle.Candidate("alone") in candidates)

end # module
