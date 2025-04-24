function bits = random_bits_generation(numBits, showRandomBitsPlot)
    % Generate random bits
    bits = zeros(numBits, 1, 'logical');
    for i = 1:numBits
        bits(i) = rand() > 0.5;
    end
    
    % Plot random bits if required
    if showRandomBitsPlot
        figure;
        stem(bits, 'Marker', 'none', 'LineWidth', 1.5);
        title('Random Bits for OFDM Transmission');
        xlabel('Bit Index');
        ylabel('Bit Value');
        axis([0 numBits -0.5 1.5]);
        grid on;
    end
end
