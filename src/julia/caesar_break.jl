
include("ClassicCiphers.jl")
using .ClassicCiphers

function main()
    println("Enter ciphertext to break (Ctrl+D/Z to end):")
    # Read all lines
    input_text = read(stdin, String)
    
    if isempty(input_text)
        println("No input provided.")
        return
    end

    candidates = []

    for s in 0:25
        # Decrypt is just shift by -s
        # We construct decrypted string
        decrypted = map(c -> shift_char(c, -s), input_text)
        score = score_text(decrypted)
        push!(candidates, (score, s, decrypted))
    end

    # Sort by lowest chi-squared score
    sort!(candidates, by = x -> x[1])

    println("\n--- Top 3 Most Likely Decryptions ---")
    for i in 1:min(3, length(candidates))
        score, shift, text = candidates[i]
        println("Rank #$i | Shift: $shift | Chi-Sq Score: $(round(score, digits=2))")
        println("Text: $(first(text, 100))" * (length(text) > 100 ? "..." : ""))
        println("-"^40)
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
