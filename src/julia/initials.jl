
function main()
    # Read input
    s = try
        readline()
    catch
        return
    end

    if isempty(s)
        return
    end

    chars = collect(s)
    n = length(chars)
    
    print(uppercase(chars[1]))
    
    i = 1
    while i <= n
        if chars[i] == ' '
            i += 1
            if i <= n
                print(uppercase(chars[i]))
            end
        end
        i += 1
    end
    println()
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
