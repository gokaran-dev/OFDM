function [rxSymbols, numReceivedSymbols] = serial_to_parallel(receivedSignal, fftSize, CP_Length, showAllReceivedSymbols, showOnlyFirstReceivedSymbol, compareFirstTxRxOFDMSymbols, compareAllOFDMs, ofdmWithCP)

    fullSymbolLength = fftSize + CP_Length;

    if mod(length(receivedSignal), fullSymbolLength) ~= 0
        error('Received signal length is not an integer multiple of the full OFDM symbol length.');
    end

    numReceivedSymbols = floor(length(receivedSignal) / fullSymbolLength);
    rxSymbols = reshape(receivedSignal(1:numReceivedSymbols*fullSymbolLength), fullSymbolLength, numReceivedSymbols);

    if showAllReceivedSymbols
        for i = 1:numReceivedSymbols
            figure;
            plot(real(rxSymbols(:, i)));
            title(['Received OFDM Symbol ' num2str(i) ' (After Serial-to-Parallel)']);
            xlabel('Sample Index');
            ylabel('Amplitude');
            grid on;
        end
    elseif showOnlyFirstReceivedSymbol
        figure;
        plot(real(rxSymbols(:, 1)));
        title('Received OFDM Symbol 1 (After Serial-to-Parallel)');
        xlabel('Sample Index');
        ylabel('Amplitude');
        grid on;
    end

    if compareFirstTxRxOFDMSymbols && ~compareAllOFDMs
        txSymbolWithCP = ofdmWithCP(:, 1);
        rxSymbolWithCP = rxSymbols(:, 1);
        figure;
        plot(real(txSymbolWithCP), 'b', 'LineWidth', 1.5);
        hold on;
        plot(real(rxSymbolWithCP), 'r--', 'LineWidth', 1.5);
        title('Comparison of First Transmitted and Received OFDM Symbol');
        xlabel('Sample Index');
        ylabel('Amplitude');
        legend('Transmitted Symbol', 'Received Symbol (with noise)');
        grid on;
    end

    if compareAllOFDMs
        txSymbolsWithCP = ofdmWithCP;
        for i = 1:numReceivedSymbols
            rxSymbolWithCP = rxSymbols(:, i);
            figure;
            plot(real(txSymbolsWithCP(:, i)), 'b', 'LineWidth', 1.5);
            hold on;
            plot(real(rxSymbolWithCP), 'r--', 'LineWidth', 1.5);
            title(['Comparison of Transmitted and Received OFDM Symbol ' num2str(i)]);
            xlabel('Sample Index');
            ylabel('Amplitude');
            legend('Transmitted Symbol', 'Received Symbol (with noise)');
            grid on;
        end
    end
end
