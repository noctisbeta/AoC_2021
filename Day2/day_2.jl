using Match

function first(data)
    horizontal = 0
    depth = 0

    for l in data
        keyword = split(l, ' ')[1]
        value = parse(Int8, split(l, ' ')[2])

        if keyword == "forward"
            horizontal += value
        elseif keyword == "down"
            depth += value
        else
            depth -= value
        end
    end

    println("Horizontal: " * string(horizontal))
    println("Depth: " * string(depth))
    println("Product: " * string(horizontal * depth))
end


function first_2(data)
    horizontal, depth = 0, 0
    for l in data
        keyword = split(l)[1]
        value = parse(Int8, split(l)[2])
        @match keyword begin
            "forward" => (horizontal += value)
            "down" => (depth += value)
            "up" => (depth -= value)
        end
    end
    println("Horizontal: " * string(horizontal))
    println("Depth: " * string(depth))
    println("Product: " * string(horizontal * depth))
end


function second(data)
    horizontal, depth, aim = 0, 0, 0
    for l in data
        keyword = split(l)[1]
        value = parse(Int8, split(l)[2])
        @match keyword begin
            "forward" => (horizontal += value; depth += aim * value)
            "down" => (aim += value)
            "up" => (aim -= value)
        end
    end
    horizontal * depth
end


data = readlines("day_2_input.txt")

first(data)
first_2(data)
second(data)

