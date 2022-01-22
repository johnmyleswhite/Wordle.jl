"""
A candidate satisfies our constraints if it does:

1. Does not contain any character that's globally banned.
2. Does not contain a character that differs from known exact matches.
3. Does not contain a character a position i that differs from the local ban list.
4. Has at least as many copies of every character as our lower bound requires.
"""
function satisfies_constraints(candidate::Candidate, constraints::Constraints)
    for i in 1:5    
        char = candidate.chars[i]

        if constraints.global_ban[char]
            return false
        end

        if constraints.is_exact_match[i] && char != constraints.match[i]
            return false
        end

        if constraints.local_ban[i][char]
            return false
        end
    end

    counts = LetterCounts(candidate)
    for c in 'a':'z'
        if counts[c] < constraints.lower_bound[c]
            return false
        end
    end

    return true
end
