"""
Constraints summarize all of our knowledge from the candidates we've tried and the
results we got back:

1. `is_exact_match` and `match`` tell us if we know the character at position i is x.
2. `lower_bound` tells us if there must be at least n copies of character x in the answer.
3. `local_ban` tells us if the letter x cannot occur at the position i.
4. `global_ban` tells us if the letter x cannot occur at any position in the answer.
"""
struct Constraints
    is_exact_match::MVector{5, Bool}
    match::MVector{5, Char}
    lower_bound::LetterCounts
    local_ban::NTuple{5, LetterFlags}
    global_ban::LetterFlags

    function Constraints()
        is_exact_match = fill(false, MVector{5, Bool})
        match = fill('a', MVector{5, Char})
        lower_bound = LetterCounts()
        local_ban = ntuple(i -> LetterFlags(), 5)
        global_ban = LetterFlags()

        new(is_exact_match, match, lower_bound, local_ban, global_ban)
    end
end
