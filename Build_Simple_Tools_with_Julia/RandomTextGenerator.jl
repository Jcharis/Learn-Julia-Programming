# Requirement
# Install StatsBase
# using Pkg
# pkg"add StatsBase"

# Procedure or Steps
# vowels
# consonant
# letter/alphabet
# number to generate
# combine the received text
# receive input

using StatsBase

println("=============================")
println("=== Random Text Generator ===")
println("=============================")

# Collection of Vowels,Consonant and Letters 
vowels = collect("aeiou")
consonant = collect("bcdfghjklmnprstvwxyz")
letters = collect('a':'z')

println("===============================================")
print("Enter [v for Vowel, c for Consonant ,a for Any]: ")
input_text1 = readline()
print("Enter [v for Vowel, c for Consonant ,a for Any]: ")
input_text2 = readline()
print("Enter [v for Vowel, c for Consonant ,a for Any]: ")
input_text3 = readline()
print("Enter [Number of Text to Generate]: ")
number_of_text = parse(Int,readline())

# println(input_text1,input_text2,input_text3,number_of_text)
function generatetext()
    if input_text1 == "v"
        letter1 = sample(vowels)
    elseif input_text1 == "c"
        letter1 = sample(consonant)
    elseif input_text1 == "a"
        letter1 = sample(letters)
    else
        letter1 = input_text1
    end
    # For Second Line Input
    if input_text2 == "v"
        letter2 = sample(vowels)
    elseif input_text2 == "c"
        letter2 = sample(consonant)
    elseif input_text2 == "a"
        letter2 = sample(letters)
    else
        letter2 = input_text1
    end
    # For Third Line Input
    if input_text3 == "v"
        letter3 = sample(vowels)
    elseif input_text3 == "c"
        letter3 = sample(consonant)
    elseif input_text3 == "a"
        letter3 = sample(letters)
    else
        letter3 = input_text1
    end
    #Combined the inputs received
    final_text = string(letter1,letter2,letter3)

    return repeat(final_text,2)
end
# Generate multiple text 
for i in 1:number_of_text
    println(generatetext())
end

