
using Test
include("../src/julia/ClassicCiphers.jl")
using .ClassicCiphers

@testset "Caesar Cipher Logic" begin
    # Test basic shift
    @test shift_char('a', 1) == 'b'
    @test shift_char('z', 1) == 'a'
    @test shift_char('A', 1) == 'B'
    @test shift_char('Z', 1) == 'A'
    
    # Test large shifts
    @test shift_char('a', 26) == 'a'
    @test shift_char('a', 27) == 'b'
    
    # Test non-letters
    @test shift_char(' ', 5) == ' '
    @test shift_char('!', 10) == '!'
end

@testset "Frequency Analysis Logic" begin
    text = "hello world"
    # score should be finite
    @test score_text(text) < Inf
    
    # Empty text
    @test score_text("") == Inf
end
