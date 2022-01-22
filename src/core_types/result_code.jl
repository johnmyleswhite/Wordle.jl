"""
1. Grey results are PRESENT_NOWHERE.
2. Yellow results are PRESENT_ELSEWHERE.
3. Green results are PRESENT_HERE.
"""
@enum ResultCode begin
    PRESENT_NOWHERE
    PRESENT_ELSEWHERE
    PRESENT_HERE
end

"""
Convert Wordle emojis to ResultCode objects.
"""
function ResultCode(c::Char)
    if c === '⬜'
        PRESENT_NOWHERE
    elseif c === '🟨'
        PRESENT_ELSEWHERE
    elseif c === '🟩'
        PRESENT_HERE
    else
        error("Invalid code character")
    end
end
