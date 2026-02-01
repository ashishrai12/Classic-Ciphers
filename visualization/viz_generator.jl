
include("../src/julia/ClassicCiphers.jl")
using .ClassicCiphers
using Sockets

function generate_html_chart(text::String, filename::String="frequency_chart.html")
    counts = Dict{Char, Int}()
    total = 0
    for c in lowercase(text)
        if 'a' <= c <= 'z'
            counts[c] = get(counts, c, 0) + 1
            total += 1
        end
    end

    if total == 0
        println("No data to visualize.")
        return
    end

    labels = sort(collect(keys(counts)))
    data = [counts[c] for c in labels]
    label_str = "[" * join(["'$c'" for c in labels], ",") * "]"
    data_str = "[" * join(data, ",") * "]"

    html_content = """
<!DOCTYPE html>
<html>
<head>
    <title>Letter Frequency Visualization</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body { font-family: sans-serif; display: flex; justify-content: center; align_items: center; min-height: 100vh; background: #f0f2f5; }
        .container { background: white; padding: 2rem; border-radius: 10px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); width: 80%; max-width: 800px; }
        h1 { text-align: center; color: #333; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Letter Frequency Analysis</h1>
        <canvas id="myChart"></canvas>
    </div>
    <script>
        const ctx = document.getElementById('myChart');
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: $label_str,
                datasets: [{
                    label: '# of Occurrences',
                    data: $data_str,
                    backgroundColor: 'rgba(54, 162, 235, 0.6)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: { beginAtZero: true }
                }
            }
        });
    </script>
</body>
</html>
    """

    open(filename, "w") do f
        write(f, html_content)
    end
    println("Visualization saved to $filename")
end

function main()
    if length(ARGS) > 0
        # If arg provided, treat as input file
        text = read(ARGS[1], String)
    else
        println("Enter text to visualize (Ctrl+D/Z to end):")
        text = read(stdin, String)
    end
    
    generate_html_chart(text, "visualization/frequency_chart.html")
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
