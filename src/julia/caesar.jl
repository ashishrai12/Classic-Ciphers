
include("ClassicCiphers.jl")
using .ClassicCiphers

function main()
    if length(ARGS) != 1
        println("Usage: julia caesar.jl <key>")
        exit(1)
    end

    local k
    try
        k = parse(Int, ARGS[1])
    catch
        println("Error: Key must be an integer")
        exit(1)
    end

    # Read input from stdin
    s = try
       readline()
    catch
       return
    end
    
    for c in s
        print(shift_char(c, k))
    end
    println()
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
