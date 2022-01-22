"""
Remove elements from `candidates`` that do not satisfy the constraints in
`constraints`.
"""
function filter_candidates!(candidates::Vector{Candidate}, constraints::Constraints)
    filter!(
        candidate -> satisfies_constraints(candidate, constraints),
        candidates,
    )
end
