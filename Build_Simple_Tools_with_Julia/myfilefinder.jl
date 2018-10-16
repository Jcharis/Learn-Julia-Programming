# Steps 
# receive the input of file extension
# get current dir
# navigate the dir
# match the extension to content of dir
# get the size

println("===============")
println("==Find File ==")
println("===============")

print("Specify the Type of file: ")
filetype = readline()
pattern = Regex(".$(filetype)")
current_dir = pwd()
println(pattern)
# navigate the directory
for (root,dir,files) in walkdir(current_dir)
    for file in files
        if occursin(pattern,file)
            println(file,"=>",stat(file).size)
        end
    end
end

# Jesus Saves @JCharisTech