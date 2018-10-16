# Steps
# Rules for password

# Alphabet[Upper/Lowercase]
# Digit[0-9]
# Symbols
# Length of password
# Join All
# Randomly select
# Join

# Package Requirement
# using Pkg
# Pkg.add("StatsBase")
using StatsBase
function passgenerator(n)
    UPPER = collect('A':'Z')
    LOWER = collect('a':'z')
    Digits_pass = collect('0':'9')
    symbols_pass = collect("!\"#\$%&'()*+,-./:;<=>?@[]^_{|}~")

    all_characters = union(UPPER,LOWER,Digits_pass,symbols_pass)
    passwords_result = join(sample(all_characters ) for c in collect(rand(Int,n)))
    return passwords_result
end


passgenerator(10)



