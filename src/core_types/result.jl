"""
The Result type represents result codes for all 5 characters in a candidate.
"""
struct Result
    codes::NTuple{5, ResultCode}
end

"""
Convert a Wordle emoji string to a Result object.
"""
function Result(s::String)
    if length(s) !== 5
        throw(ArgumentError("Input must be 5 characters long"))
    end
    chars = Char[]
    for char in s
        push!(chars, char)
    end
    Result(ntuple(i -> ResultCode(chars[i]), 5))
end
