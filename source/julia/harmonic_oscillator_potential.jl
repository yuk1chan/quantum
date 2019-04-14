using Plots

Plots.gr()
ENV["PLOTS_TEST"] = "true";

using SymPy

# ポテンシャル
function V(x)

    return x*x
end

function E(n,x)
    return 2n + 1
end

function A(n)
    return 1/(π^(1/4)*sqrt(2^n * factorial(n)))
end

H = sympy[:hermite]

function ψ(n,x)
    return A(n) * H(n,x) * exp(-x^2 /2)
end

function ψ2(n,x)
    return ψ(n,x)^2
end

x = -5:0.1:5
plot(legend=:none)
plot!(x,V.(x),linecolor="blue")
for n in 0:10
    plot!(x,ψ.(n,x) + E.(n,x),linecolor="red")
    plot!(x,E.(n,x),linecolor="green")
end
plot!()

# savefig("harmonic_oscillator.png")
