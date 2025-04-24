function [demodulatedBitsCorrected] = bitstream_reconstruction(demodulatedSymbolsCorrected, bitsPerSymbol, bits, compareFirstTxRxSymbols, compareFullBitStream)
 
    demodulatedBitsMatrixCorrected = de2bi(demodulatedSymbolsCorrected, bitsPerSymbol, 'left-msb');
    demodulatedBitsCorrected = demodulatedBitsMatrixCorrected(:);

    % Compare transmitted vs. received bits
    if compareFirstTxRxSymbols
        figure;
        subplot(2, 1, 1);
        stem(bits(1:bitsPerSymbol), 'filled');
        title('Transmitted Bits (First Symbol)');
        xlabel('Bit Index');
        ylabel('Bit Value');
        grid on;

        subplot(2, 1, 2);
        stem(demodulatedBitsCorrected(1:bitsPerSymbol), 'filled');
        title('Received Bits (After Demodulation)');
        xlabel('Bit Index');
        ylabel('Bit Value');
        grid on;
    end

    % Plot the full received bit stream
    figure;
    stem(demodulatedBitsCorrected, 'Marker', 'none', 'LineWidth', 1.5);
    title('Received Bit Stream (After Demodulation)');
    xlabel('Bit Index');
    ylabel('Bit Value');
    axis([0 length(demodulatedBitsCorrected) -0.5 1.5]); 
    grid on;

    % Full comparison of the original and demodulated bit streams
    if compareFullBitStream
        hold on;
        plot(bits, 'b-', 'LineWidth', 1.5);  % Original bits (transmitted)
        plot(demodulatedBitsCorrected, 'r--', 'LineWidth', 1.5); 
        legend('Received Bits', 'Original Transmitted Bits', 'Demodulated Bits');
    else
        legend('Received Bits');
    end
end
