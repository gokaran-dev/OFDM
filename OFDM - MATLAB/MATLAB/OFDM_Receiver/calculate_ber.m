function [BER] = calculate_ber(bits, demodulatedBitsCorrected, plotBER)
    minLength = min(length(bits), length(demodulatedBitsCorrected));
    bitErrors = sum(bits(1:minLength) ~= demodulatedBitsCorrected(1:minLength));
    BER = bitErrors / minLength;
    disp(['Bit Error Rate (BER): ', num2str(BER)]);

    if plotBER
        figure;
        semilogy(BER, 'b-o', 'LineWidth', 1.5);
        title('Bit Error Rate (BER)');
        xlabel('SNR (dB)');
        ylabel('BER');
        grid on;
    end
end
