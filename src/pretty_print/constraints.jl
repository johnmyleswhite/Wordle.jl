function pretty_print(constraints::Constraints)
    @printf("==========================================\n")
    @printf("Constraints\n")
    @printf("* Lower Bounds:\n")
    for c in 'a':'z'
        if constraints.lower_bound[c] > 0
            @printf(" * %s ≥ %d\n", c, constraints.lower_bound[c])
        end
    end
    @printf("\n")

    @printf("* Exact Matches:\n")
    @printf(" * ")
    for i in 1:5
        if constraints.is_exact_match[i]
            print(constraints.match[i])
        else
            print('·')
        end
    end
    @printf("\n\n")

    @printf("* Global Ban:\n")
    for c in 'a':'z'
        if constraints.global_ban[c]
            @printf(" * %s = 0\n", c)
        end
    end
    @printf("\n\n")

    @printf("* Local Ban:\n")
    for i in 1:5
        for c in 'a':'z'
            if constraints.local_ban[i][c]
                @printf(" * word[%d] ≠ %s\n", i, c)
            end
        end
    end
    @printf("\n\n")
    @printf("==========================================\n")
end
