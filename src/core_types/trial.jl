"""
A Trial represents a guess we've tried and the result we got back.
"""
struct Trial
    candidate::Candidate
    result::Result
end
