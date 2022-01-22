import Pkg

Pkg.activate(".")

import Wordle
import Test: @test, @test_throws, @testset

test_files = (
    "historical_words.jl",
    "filtering/filter_candidates.jl",
    "filtering/utils.jl",
    "filtering/update_constraints.jl",
    "filtering/satisfies_constraints.jl",
    "evaluation.jl",
    "core_types/candidate.jl",
    "core_types/constraints.jl",
    "core_types/result.jl",
    "core_types/trial.jl",
    "scoring/scoring.jl",
    "sourcing/candidate_pool.jl",
)

@testset begin
    for test_file in test_files
        include(test_file)
    end
end
