module TestEvaluation

import Wordle
import Test: @test, @test_throws

# From https://twitter.com/jmhl/status/1483965720845512705
test_cases = (
    ("abcde", "abcde", "🟩🟩🟩🟩🟩"),
    ("abcde", "fghij", "⬜⬜⬜⬜⬜"),
    ("abcde", "axxxx", "🟩⬜⬜⬜⬜"),
    ("abcde", "bxxxx", "⬜🟨⬜⬜⬜"),
    ("abcde", "bbxxx", "⬜🟩⬜⬜⬜"),
    ("abcde", "edcba", "🟨🟨🟩🟨🟨"),
    ("reels", "rebus", "🟩🟩⬜⬜🟩"),
    ("reels", "rebus", "🟩🟩⬜⬜🟩"),
    ("reeds", "redes", "🟩🟩🟨🟨🟩"),
    ("asset", "rebus", "⬜🟨⬜🟨⬜"),
    ("igloo", "boost", "⬜⬜⬜🟨🟨"),
    ("shoot", "boost", "🟨⬜🟩🟨🟩"),
    ("ovolo", "boost", "🟨⬜🟩⬜⬜"),
)

for test_case in test_cases
    trial = Wordle.try_candidate(
        Wordle.Candidate(test_case[1]),
        Wordle.Candidate(test_case[2]),
    )
    @test trial.result === Wordle.Result(test_case[3])
end

end # module
