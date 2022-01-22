module TestTrial

import Wordle
import Test: @test, @test_throws

trial = Wordle.Trial(Wordle.Candidate("alone"), Wordle.Result("⬜🟨🟩⬜🟨"))

@test trial.candidate.chars === ('a', 'l', 'o', 'n', 'e')

@test trial.result.codes === (
    Wordle.PRESENT_NOWHERE,
    Wordle.PRESENT_ELSEWHERE,
    Wordle.PRESENT_HERE,
    Wordle.PRESENT_NOWHERE,
    Wordle.PRESENT_ELSEWHERE,
)

end # module
