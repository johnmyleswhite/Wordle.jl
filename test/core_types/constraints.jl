module TestConstraints

# TODO: Rewrite this

import Wordle
import Test: @test, @test_throws

constraints = Wordle.Constraints()

@test all(c -> c === 0, constraints.lower_bound.counts)
@test all(c -> c === false, constraints.global_ban.flags)
@test all(c -> c === false, constraints.is_exact_match)
@test all(c -> isa(c, Char), constraints.match)
for i in 1:5
    @test all(c -> c === false, constraints.local_ban[i].flags)
end

@test size(constraints.lower_bound.counts) === (26, )
@test size(constraints.global_ban.flags) === (26, )
@test size(constraints.is_exact_match) === (5, )
@test size(constraints.match) === (5, )
for i in 1:5
    @test size(constraints.local_ban[i].flags) === (26, )
end

end # module
