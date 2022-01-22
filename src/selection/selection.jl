function select_candidate(
    candidates::Vector{Candidate},
    trials::Vector{Trial},
    weights::Vector,
    scoring::Bool,
)
    if scoring
        _, i = findmax(score_candidates(candidates, trials, weights))
        i, candidates[i]
    else
        i = rand(1:length(candidates))
        i, candidates[i]
    end
end
