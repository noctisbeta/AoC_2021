function first(data)
    sum(1 for t in zip(data, data[2:end]) if t[2] > t[1])
end

function second(data)
    data = [reduce(+, t) for t in zip(data, data[2:end], data[3:end])]
    first(data)
end


data = parse.(Int16, readlines("day_1_input.txt"))
println(first(data))
println(second(data))
