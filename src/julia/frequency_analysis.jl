
include("ClassicCiphers.jl")
using .ClassicCiphers

function main()
    println("Enter text for frequency analysis (Ctrl+D/Z to end):")
    text = try
        read(stdin, String)
    catch
        return
    end
    
    if isempty(text)
        return
    end
    
    print_histogram(text)
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
