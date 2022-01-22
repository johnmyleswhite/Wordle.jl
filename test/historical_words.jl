module TestHistoricalWords

import Wordle: play
import Test: @test

# https://screenrant.com/wordle-answers-updated-word-puzzle-guide/

# 01/21 - #216 - PRICK
# 01/20 - #215 - ROBOT
# 01/19 - #214 - POINT
# 01/18 - #213 - PROXY
# 01/17 - #212 - SHIRE
# 01/16 - #211 - SOLAR
# 01/15 - #210 - PANIC
# 01/14 - #209 - TANGY
# 01/13 - #208 - ABBEY
# 01/12 - #207 - FAVOR
# 01/11 - #206 - DRINK
# 01/10 - #205 - QUERY
# 01/09 - #204 - GORGE
# 01/08 - #203 - CRANK
# 01/07 - #202 - SLUMP
# 01/06 - #201 - BANAL
# 01/05 - #200 - TIGER
# 01/04 - #199 - SIEGE
# 01/03 - #198 - TRUSS
# 01/02 - #197 - BOOST
# 01/01 - #196 - REBUS

words = (
    "prick",
    "robot",
    "point",
    "proxy",
    "shire",
    "solar",
    "panic",
    "tangy",
    "abbey",
    "favor",
    "drink",
    "query",
    "gorge",
    "crank",
    "slump",
    "banal",
    "tiger",
    "siege",
    "truss",
    "boost",
    "rebus",
)

for word in words
    @test play(word) > 0
end

end # module
