"""
Represent a string in terms of the counts of the ASCII lowercase letters in it.
"""
struct LetterCounts
    counts::MVector{26, Int}

    function LetterCounts()
        counts = fill(0, MVector{26, Int})
        new(counts)
    end
end

"""
Read from LetterCounts using `letter_counts['a']`.
"""
function Base.getindex(letter_counts::LetterCounts, c::Char)
    letter_counts.counts[to_index(c)]
end

"""
Write to LetterCounts using `letter_counts['a'] = 3`.
"""
function Base.setindex!(letter_counts::LetterCounts, cnt::Int, c::Char)
    letter_counts.counts[to_index(c)] = cnt
    cnt
end
