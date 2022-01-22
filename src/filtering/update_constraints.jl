"""
We update constraints doing:

1. ...
"""
function update_constraints!(constraints::Constraints, trial::Trial)
    lower_bound = LetterCounts()

    for i in 1:5
        char = trial.candidate.chars[i]

        # If we see a PRESENT_NOWHERE code, we update the lower bound and forbid the character with some caveats.
        if trial.result.codes[i] === PRESENT_NOWHERE
            # Don't set this if there's a PRESENT_ELSEWHERE code set or an PRESENT_HERE set for this character.
            not_repeated = true
            for j in 1:5
                if (trial.result.codes[j] === PRESENT_ELSEWHERE && trial.candidate.chars[j] === char) ||
                   (trial.result.codes[j] === PRESENT_HERE && trial.candidate.chars[j] === char)
                   not_repeated = false
                end
            end
            if not_repeated
                constraints.global_ban[char] = true
                lower_bound[char] = 0
            end
        # If we see an PRESENT_ELSEWHERE code, we store a Boolean flag forbidding that character.
        elseif trial.result.codes[i] === PRESENT_ELSEWHERE
            constraints.local_ban[i][char] = true
            lower_bound[char] += 1
        # If we see an PRESENT_HERE code, we store the matched character and a Boolean flag.
        elseif trial.result.codes[i] == PRESENT_HERE
            constraints.is_exact_match[i] = true
            constraints.match[i] = char
            lower_bound[char] += 1
        else
            error("Invariant failed")
        end
    end

    for c in 'a':'z'
        constraints.lower_bound[c] = max(constraints.lower_bound[c], lower_bound[c])
    end
end
