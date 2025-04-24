function demodulatedSymbolsCorrected = qam_demodulation(rxSymbolsCorrected, fftSize, modOrder, showCorrectedConstellation)
    rxDataSubcarriersCorrected = rxSymbolsCorrected(2:(fftSize/2), :);
    rxDataSubcarriersVector = rxDataSubcarriersCorrected(:);

    if showCorrectedConstellation
        figure;
        scatter(real(rxDataSubcarriersVector), imag(rxDataSubcarriersVector), 'filled');
        title('Corrected Constellation Diagram');
        xlabel('In-Phase (I)');
        ylabel('Quadrature (Q)');
        axis equal;
        grid on;
    end

    demodulatedSymbolsCorrected = qamdemod(rxDataSubcarriersVector, modOrder, 'OutputType', 'integer', 'UnitAveragePower', true);
end
