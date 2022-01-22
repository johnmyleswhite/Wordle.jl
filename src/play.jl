struct GameState
    candidates::Vector{Candidate}
    trials::Vector{Trial}
    constraints::Constraints

    function GameState(use_wordle::Bool)
        candidates = candidate_pool(use_wordle)
        trials = Trial[]
        constraints = Constraints()
        new(candidates, trials, constraints)
    end
end

struct Config{T}
    weights::T
    filtering::Bool
    scoring::Bool
    use_wordle::Bool
    verbose::Bool
    debug::Bool
end

# TODO: Restore interactive mode -- interactive candidate, interactive scoring
# function prompt(text::String)
#     print(text)
#     input = String(chomp(readline()))
#     input
# end

# function parse_input()
#     candidate = Candidate(prompt("Candidate:\t"))
#     ints_string = prompt("Result Codes:\t")
#     codes = tuple(map(c -> ResultCode(parse(Int, c)), split(ints_string, ""))...)
#     trial = Trial(candidate, Result(codes))
# end

function print_state(state::GameState, candidate, iteration, config, n_candidates)
    if config.verbose
        @printf("Iteration: %s\n", iteration)
        @printf("Candidate: %s\n", String(candidate))
        pretty_print(state.trials)
    end

    if config.debug
        pretty_print(state.constraints)
        @printf(
            "Number of Candidates: %d / %d [%.3f%%]\n",
            length(state.candidates),
            n_candidates,
            100 * length(state.candidates) / n_candidates,
        )
        if length(state.candidates) <= 10
            @printf("Candidates: %s\n\n", map(String, state.candidates))
        end
    end
end

function play(
    truth_string::String;
    weights::Vector = fill(1 / 3, 3),
    filtering::Bool = true,
    scoring::Bool = true,
    use_wordle::Bool = true,
    verbose::Bool = false,
    debug::Bool = false,
)
    truth = Candidate(truth_string)
    config = Config(weights, filtering, scoring, use_wordle, verbose, debug)
    state = GameState(config.use_wordle)
    n_candidates = length(state.candidates)

    iteration = 1
    while iteration != 11
        i, candidate = select_candidate(state.candidates, state.trials, config.weights, config.scoring)

        trial = try_candidate(candidate, truth)

        deleteat!(state.candidates, i)

        push!(state.trials, trial)

        update_constraints!(state.constraints, trial)

        if filtering
            filter_candidates!(state.candidates, state.constraints)
        end

        print_state(state, candidate, iteration, config, n_candidates)

        if candidate == truth
            if config.verbose
                println("Success!")
            end
            break
        end

        if length(state.candidates) == 0
            error("Exhausted all candidates")
        end

        iteration += 1
    end

    if iteration == 11
        -1
    else
        iteration
    end
end
