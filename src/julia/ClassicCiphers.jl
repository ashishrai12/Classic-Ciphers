
module ClassicCiphers

export ENGLISH_FREQS, shift_char, score_text, print_histogram

# English letter frequencies
const ENGLISH_FREQS = Dict(
    'a' => 0.082, 'b' => 0.015, 'c' => 0.028, 'd' => 0.043,
    'e' => 0.127, 'f' => 0.022, 'g' => 0.020, 'h' => 0.061,
    'i' => 0.070, 'j' => 0.002, 'k' => 0.008, 'l' => 0.040,
    'm' => 0.024, 'n' => 0.067, 'o' => 0.075, 'p' => 0.019,
    'q' => 0.001, 'r' => 0.060, 's' => 0.063, 't' => 0.091,
    'u' => 0.028, 'v' => 0.010, 'w' => 0.024, 'x' => 0.002,
    'y' => 0.020, 'z' => 0.001
)

"""
    shift_char(c::Char, k::Int)

Shifts character `c` by `k` positions. Preserves case. 
Returns the original character if it's not a letter.
"""
function shift_char(c::Char, k::Int)
    if islowercase(c)
        base = Int('a')
        return Char(base + mod(Int(c) - base + k, 26))
    elseif isuppercase(c)
        base = Int('A')
        return Char(base + mod(Int(c) - base + k, 26))
    else
        return c
    end
end

"""
    score_text(text::String)

Calculates the Chi-Squared statistic of the text compared to English letter frequencies.
Lower score means closer to English.
"""
function score_text(text::AbstractString)
    counts = Dict{Char, Int}()
    total_letters = 0
    
    for c in lowercase(text)
        if 'a' <= c <= 'z'
            counts[c] = get(counts, c, 0) + 1
            total_letters += 1
        end
    end
    
    if total_letters == 0
        return Inf
    end
    
    chi_sq = 0.0
    for char in 'a':'z'
        observed = get(counts, char, 0)
        expected = total_letters * get(ENGLISH_FREQS, char, 0.0)
        chi_sq += ((observed - expected) ^ 2) / expected
    end
    
    return chi_sq
end

"""
    print_histogram(text::String)

Prints a frequency histogram of the letters in `text`.
"""
function print_histogram(text::AbstractString)
    total = 0
    counts = Dict{Char, Int}()
    
    for c in lowercase(text)
        if 'a' <= c <= 'z'
            counts[c] = get(counts, c, 0) + 1
            total += 1
        end
    end
    
    if total == 0
        println("No alphabetic characters found.")
        return
    end
    
    # Sort by frequency (descending)
    sorted_chars = sort(collect(keys(counts)), by = c -> counts[c], rev=true)
    
    println("\nFrequency Analysis (Total letters: $total)")
    println("----------------------------------------")
    
    max_count = isempty(counts) ? 0 : maximum(values(counts))
    scale = 50.0 / (max_count > 0 ? max_count : 1) 
    
    for c in sorted_chars
        count = counts[c]
        percent = (count / total) * 100
        bar_len = Int(round(count * scale))
        bar = repeat("#", bar_len)
        print("$c | ")
        print(lpad(string(count), 4))
        print(" | ")
        print(lpad(string(round(percent, digits=1)), 5))
        println("% | $bar")
    end
end

end
