module TestCandidate

import Wordle
import Test: @test, @test_throws

c = Wordle.Candidate("alone")
@test c.chars === ('a', 'l', 'o', 'n', 'e')
@test String(c) === "alone"

# Too short
@test_throws Exception Candidate("true")

# Not all lowercase
@test_throws Exception Candidate("Alone")

# Not all ASCII
@test_throws Exception Candidate("señor")

end # module
