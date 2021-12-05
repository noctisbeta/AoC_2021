import Match
function first(data)
    matrix = [parse.(Int8, c) for c in split.(data, "")]
    matrixT = hcat(matrix...)
    counters = [(count(==(0), matrixT[i, :]) > size(matrixT, 2) ÷ 2 ? "0" : "1") for i = 1:size(matrixT, 1)]
    counters2 = [c == "0" ? "1" : "0" for c in counters]
    gamma = parse(Int, reduce(*, counters); base = 2)
    epsilon = parse(Int, reduce(*, counters2); base = 2)
    gamma * epsilon
end

function second(data)
    matrix = [c for c ∈ split.(data, "")]
    # print(matrix)
    matrixT = hcat(matrix...)
    # println(matrixT)
    # println(size(matrixT))

    i = 1
    while size(matrixT, 2) > 1
        # if size(matrixT, 2) == 1
        #     break
        # println("count ", count(==("0"), matrixT[i, :]))
        indicator = (count(==("0"), matrixT[i, :]) > (size(matrixT, 2) ÷ 2)) ? "0" : "1"
        # count_, sizeHalf = count(==(0), matrixT[i, :]), size(matrixT, 2) ÷ 2
        # @match count_ begin
        #     count > sizeHalf => (indicator = 0)
        #     count < sizeHalf => (indicator = 1)
        # end

        # println(indicator)
        # println(matrixT[i, :] .== indicator)
        # println(size(matrixT[i, :] .== indicator))
        # println("vrstica ", matrixT[i, :])
        matrixT = matrixT[:, matrixT[i, :].==indicator]
        # println("matrika ", matrixT)
        i += 1
        # println(size(matrixT))
    end
    println(matrixT)
    oxy = parse(Int, reduce(*, matrixT); base = 2)

    matrix = [c for c ∈ split.(data, "")]
    # print(matrix)
    matrixT = hcat(matrix...)
    # println(matrixT)
    # println(size(matrixT))

    i = 1
    while size(matrixT, 2) > 1
        # if size(matrixT, 2) == 1
        #     break
        # println("count ", count(==("0"), matrixT[i, :]))
        indicator = (count(==("0"), matrixT[i, :]) <= (size(matrixT, 2) ÷ 2)) ? "0" : "1"
        # count_, sizeHalf = count(==(0), matrixT[i, :]), size(matrixT, 2) ÷ 2
        # @match count_ begin
        #     count > sizeHalf => (indicator = 0)
        #     count < sizeHalf => (indicator = 1)
        # end

        # println(indicator)
        # println(matrixT[i, :] .== indicator)
        # println(size(matrixT[i, :] .== indicator))
        # println("vrstica ", matrixT[i, :])
        matrixT = matrixT[:, matrixT[i, :].==indicator]
        # println("matrika ", matrixT)
        i += 1
        # println(size(matrixT))
    end
    println(matrixT)
    carbo = parse(Int, reduce(*, matrixT); base = 2)

    oxy * carbo

end

data = readlines("day_3_input.txt")
# println(data)
# println(first(data))
println(second(data))