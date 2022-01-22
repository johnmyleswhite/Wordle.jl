module TestResult

import Wordle
import Test: @test, @test_throws

@test Wordle.Result("⬜🟨🟩⬜🟨") === Wordle.Result(
    (
        Wordle.PRESENT_NOWHERE,
        Wordle.PRESENT_ELSEWHERE,
        Wordle.PRESENT_HERE,
        Wordle.PRESENT_NOWHERE,
        Wordle.PRESENT_ELSEWHERE,
    )
)

@test Wordle.Result("⬜🟨⬜🟨🟩") === Wordle.Result(
    (
        Wordle.PRESENT_NOWHERE,
        Wordle.PRESENT_ELSEWHERE,
        Wordle.PRESENT_NOWHERE,
        Wordle.PRESENT_ELSEWHERE,
        Wordle.PRESENT_HERE,
    )
)

end # module
