module TestSatisfiesConstraints

import Wordle
import Test: @test, @test_throws

constraints = Wordle.Constraints()
trial = Wordle.Trial(Wordle.Candidate("alone"), Wordle.Result("⬜⬜⬜⬜⬜"))
Wordle.update_constraints!(constraints, trial)

@test !Wordle.satisfies_constraints(Wordle.Candidate("alone"), constraints)
@test !Wordle.satisfies_constraints(Wordle.Candidate("alive"), constraints)
@test Wordle.satisfies_constraints(Wordle.Candidate("trust"), constraints)
@test Wordle.satisfies_constraints(Wordle.Candidate("birth"), constraints)

# TODO: Add lots more cases here

end # module
