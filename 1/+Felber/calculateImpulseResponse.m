function h_ech = calculateImpulseResponse(alpha, N, n_values, max_iterations)
    h_ech = zeros(size(n_values));

    for n = n_values
        for k = 0:max_iterations
            h_ech(n_values == n) = h_ech(n_values == n) + alpha^k * Felber.vDeltaFun(n - k * N);
        end
    end
end
