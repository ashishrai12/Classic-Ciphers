
include("ClassicCiphers.jl")
using .ClassicCiphers

function main()
    if length(ARGS) != 1
        println("Usage: julia vigenere.jl <keyword>")
        exit(1)
    end

    key = ARGS[1]
    
    # Validation
    if any(!isletter, key)
        println("Error: Key must be alphabetic")
        exit(1)
    end

    # Pre-calculate shifts: 'a'/'A' -> 0, 'b'/'B' -> 1, etc.
    shifts = [Int(uppercase(c)) - Int('A') for c in key]
    nk = length(shifts)

    # Read input
    s = try
        readline()
    catch
        return
    end

    key_idx = 0 

    for c in s
        if isletter(c)
            shift = shifts[(key_idx % nk) + 1]
            print(shift_char(c, shift))
            key_idx += 1
        else
            print(c)
        end
    end
    println()
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
