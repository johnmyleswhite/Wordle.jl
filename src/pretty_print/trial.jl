function pretty_print(t::Trial)
    for i in 1:5
        if t.result.codes[i] == PRESENT_NOWHERE
            print('⬜')
        elseif t.result.codes[i] == PRESENT_ELSEWHERE
            print('🟨')
        elseif t.result.codes[i] == PRESENT_HERE
            print('🟩')
        else
            error("Invalid code encountered")
        end
    end
    println()
end

pretty_print(trials::Vector{Trial}) = foreach(pretty_print, trials)
