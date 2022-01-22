"""
Represent a string in terms of the binary presence of the ASCII lowercase letters in it.
"""
struct LetterFlags
    flags::MVector{26, Bool}

    function LetterFlags()
        flags = fill(false, MVector{26, Bool})
        new(flags)
    end
end

"""
Read from LetterFlags using `letter_flags['a']`.
"""
function Base.getindex(letter_flags::LetterFlags, c::Char)
    letter_flags.flags[to_index(c)]
end

"""
Write to LetterFlags using `letter_flags['a'] = 3`.
"""
function Base.setindex!(letter_flags::LetterFlags, flag::Bool, c::Char)
    letter_flags.flags[to_index(c)] = flag
    flag
end
