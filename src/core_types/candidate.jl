"""
The Candidate type represents a 5-character string as a tuple of 5 Char's.
"""
struct Candidate
    chars::NTuple{5, Char}
end

"""
Turn a String object into a Candidate object. The input must be a lowercase
string containing only ASCII characters.
"""
function Candidate(s::String)
    if length(s) != 5
        throw(ArgumentError("Candidate must contain exactly 5 characters"))
    end
    if !all(islowercase, collect(s))
        throw(ArgumentError("Candidate must contain only lowercase characters"))
    end
    if !isascii(s)
        throw(ArgumentError("Candidate must contain only ASCII characters"))
    end
    Candidate(ntuple(i -> s[i], 5))
end

"""
Turn a Candidate object into a String object.
"""
String(c::Candidate) = join(c.chars)

"""
Turn a Candidate object into a LetterCount object.
"""
function LetterCounts(candidate::Candidate)
    letter_counts = LetterCounts()
    for char in candidate.chars
        letter_counts[char] += 1
    end
    letter_counts
end

"""
Turn a Candidate object into a LetterFlags object.
"""
function LetterFlags(candidate::Candidate)
    letter_flags = LetterFlags()
    for char in candidate.chars
        letter_flags[char] = true
    end
    letter_flags
end
