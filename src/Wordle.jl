module Wordle

export play

import StatsBase: denserank
import StaticArrays: MVector, MMatrix
import Printf: @printf
import LinearAlgebra: dot

include("core_types/utils.jl")
include("core_types/letter_counts.jl")
include("core_types/letter_flags.jl")
include("core_types/candidate.jl")
include("core_types/result_code.jl")
include("core_types/result.jl")
include("core_types/trial.jl")
include("core_types/constraints.jl")

include("pretty_print/trial.jl")
include("pretty_print/constraints.jl")

include("sourcing/candidate_pool.jl")

include("filtering/update_constraints.jl")
include("filtering/satisfies_constraints.jl")
include("filtering/filter_candidates.jl")

include("scoring/scoring.jl")

include("selection/selection.jl")

include("evaluation.jl")

include("play.jl")

end # module Wordle
