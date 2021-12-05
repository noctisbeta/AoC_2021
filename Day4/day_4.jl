using DelimitedFiles

function first(path)
    # pick_from = readline(path)
    # println(pick_from)
    # blank = readline(path)
    # println(blank)
    boards = []
    pick_from = []

    open(path) do file
        pick_from = readline(file)
        println(pick_from)
        blank = readline(file)

        while !eof(file)
            board_wrapper = []
            for i = 1:5
                push!(board_wrapper, readline(file))
            end
            blank = readline(file)
            push!(boards, board_wrapper)
        end
    end

    win_con = [[1 for _ ∈ board] for board in boards]

    println("sizes ", size(boards), size(win_con))

    for chosen ∈ pick_from
        for board ∈ boards
            for (i, row) ∈ enumerate(board)
                for entry ∈ row
                    if chosen == entry
                        println(board[i])
                        board[i] = replace(row, entry => '0')
                        println(board[i])
                        return
                    end
                end
            end
        end
    end

end

println(first("day_4_input.txt"))