function try_candidate(candidate::Candidate, truth::Candidate)
    codes = fill(Wordle.PRESENT_NOWHERE, 5)

    truth_letter_counts = LetterCounts(truth)

    for (i, char) in enumerate(candidate.chars)
        if char == truth.chars[i]
            @assert truth_letter_counts[char] > 0
            codes[i] = PRESENT_HERE
            truth_letter_counts[char] -= 1
        end
    end

    for (i, char) in enumerate(candidate.chars)
        if truth_letter_counts[char] > 0 && char != truth.chars[i]
            codes[i] = PRESENT_ELSEWHERE
            truth_letter_counts[char] -= 1
        end
    end

    Trial(candidate, Result(tuple(codes...)))
end
