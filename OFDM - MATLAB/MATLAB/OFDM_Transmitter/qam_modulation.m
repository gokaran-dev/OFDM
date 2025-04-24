function qamSymbols = qam_modulation(bits, bitsPerSymbol, modOrder, showQAMConstellation)
    % 64-QAM Modulation
    if mod(length(bits), bitsPerSymbol) ~= 0
        error('The number of bits must be a multiple of %d for %d-QAM.', bitsPerSymbol, modOrder);
    end

    numSymbols = length(bits) / bitsPerSymbol;
    bitMatrix = reshape(bits, bitsPerSymbol, numSymbols);
    decimalSymbols = bi2de(bitMatrix', 'left-msb');
    qamSymbols = qammod(decimalSymbols, modOrder, 'InputType', 'integer', 'UnitAveragePower', true);

    % Plot QAM constellation if required
    if showQAMConstellation
        figure;
        scatter(real(qamSymbols), imag(qamSymbols), 'filled');
        title(sprintf('%d-QAM Symbols in IQ Plane', modOrder));
        xlabel('In-Phase (I)');
        ylabel('Quadrature (Q)');
        grid on;
    end
end
