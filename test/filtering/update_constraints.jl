module TestUpdateConstraints

import Wordle
import Test: @test, @test_throws

constraints = Wordle.Constraints()
trial = Wordle.Trial(Wordle.Candidate("alone"), Wordle.Result("⬜⬜⬜⬜⬜"))
Wordle.update_constraints!(constraints, trial)

@test constraints.global_ban['a']
@test constraints.global_ban['l']
@test constraints.global_ban['o']
@test constraints.global_ban['n']
@test constraints.global_ban['e']

# TODO: Add more tests here

end # module
