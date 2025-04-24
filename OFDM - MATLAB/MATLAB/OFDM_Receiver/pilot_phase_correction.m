function rxSymbolsCorrected = pilot_phase_correction(rxSymbolsFFT, pilotSymbol, showReceivedQAMConstellation)
    receivedPilotSymbol = rxSymbolsFFT(1, 1);
    
    if showReceivedQAMConstellation
        rxDataSubcarriers = rxSymbolsFFT(2:32, :);
        rxDataSubcarriers_reshaped = rxDataSubcarriers(:);
        
        figure;
        scatter(real(rxDataSubcarriers_reshaped), imag(rxDataSubcarriers_reshaped), 'filled');
        title('Constellation Diagram of Extracted Data Subcarriers');
        xlabel('In-Phase (I)');
        ylabel('Quadrature (Q)');
        axis equal;
        grid on;
    end
    
    phaseError = angle(receivedPilotSymbol) - angle(pilotSymbol);
    rxSymbolsCorrected = rxSymbolsFFT .* exp(-1j * phaseError);
end
