# https://en.wikipedia.org/wiki/Letter_frequency
function text_frequencies()
    (
        0.082, 
        0.015, 
        0.028, 
        0.043, 
        0.130, 
        0.022, 
        0.020, 
        0.061, 
        0.070, 
        0.0015, 
        0.0077, 
        0.040, 
        0.025, 
        0.067, 
        0.075, 
        0.019, 
        0.00095, 
        0.060, 
        0.063, 
        0.091, 
        0.028, 
        0.0098, 
        0.024, 
        0.0015, 
        0.020, 
        0.00074,
    )
end

# https://en.wikipedia.org/wiki/Letter_frequency
function dictionary_frequencies()
    (
        0.078, 
        0.02, 
        0.04, 
        0.038, 
        0.11, 
        0.014, 
        0.03, 
        0.023, 
        0.082, 
        0.0021, 
        0.025, 
        0.053, 
        0.027, 
        0.072, 
        0.061, 
        0.028, 
        0.0024, 
        0.073, 
        0.087, 
        0.067, 
        0.033, 
        0.01, 
        0.0091, 
        0.0027, 
        0.016, 
        0.0044, 
    )
end

"""
Maximize text frequency of unique letters.
"""
function text_frequency_score(candidate::Candidate)
    letter_flags = LetterFlags(candidate)
    unnormalized_score = dot(letter_flags.flags, text_frequencies())
    # unnormalized_score / (5 * maximum(text_frequencies()))
    unnormalized_score / 0.65
end

"""
Maximize dictionary frequency of unique letters.
"""
function dictionary_frequency_score(candidate::Candidate)
    letter_flags = LetterFlags(candidate)
    unnormalized_score = dot(letter_flags.flags, dictionary_frequencies())
    # unnormalized_score / (5 * maximum(dictionary_frequencies()))
    unnormalized_score / 0.55
end

"""
Which letters have never been seen in previous trials?
"""
function never_seen(trials::Vector{Trial})
    previously_seen = fill(false, MVector{26, Bool})

    for trial in trials
        previously_seen .|= LetterFlags(trial.candidate).flags
    end

    .!previously_seen
end

"""
Maximize number of unique letters that were not already guessed.
"""
function novelty_score(candidate::Candidate, never_seen)
    sum(LetterFlags(candidate).flags .& never_seen) / 5
end

function score_candidates(
    candidates::Vector{Candidate},
    trials::Vector{Trial},
    weights::Vector,
)
    never_seen_chars = never_seen(trials)

    score_functions = (
        c -> text_frequency_score(c),
        c -> dictionary_frequency_score(c),
        c -> novelty_score(c, never_seen_chars),
    )

    @assert length(score_functions) == length(weights)

    scores = fill(0.0, length(candidates))

    for (i, f) in enumerate(score_functions)
        for (j, candidate) in enumerate(candidates)
            scores[j] += weights[i] * f(candidate)
        end
    end

    scores
end
