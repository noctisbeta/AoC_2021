data = readlines("day_2_input.txt")

horizontal = sum(parse(Int64, split(t, ' ')[2]) for t in data if split(t, ' ')[1] == "forward")
println(horizontal)

for l in data
    switch(split(t, ' ')[1])
end