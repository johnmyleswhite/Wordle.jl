# TODO: Use multiple Wordle lists and the UNIX version as well.
function candidate_pool(use_wordle = true)
    path = if use_wordle
        "data/wordle_answers.txt"
    else
        "data/unix_words.txt"
    end
    candidates = Candidate[]
    io = open(path, "r")
    for l in eachline(io)
        # For now, assume any word that's capitalized is bad to use.
        if !isuppercase(l[1])
            candidate = lowercase(chomp(l))
            if length(candidate) == 5
                push!(candidates, Candidate(candidate))
            end
        end
    end
    close(io)
    candidates
end
