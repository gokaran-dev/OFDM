function rxSymbolsNoCP = remove_cyclic_prefix(rxSymbols, CP_Length, ifftSymbols, numReceivedSymbols, compareFirstOFDMNoCP, compareAllOFDMNoCP)
    rxSymbolsNoCP = rxSymbols(CP_Length + 1:end, :);

    if compareFirstOFDMNoCP && ~compareAllOFDMNoCP
        txSymbolNoCP = ifftSymbols(:, 1);
        rxSymbolNoCP = rxSymbolsNoCP(:, 1);
        figure;
        plot(real(txSymbolNoCP), 'b', 'LineWidth', 1.5);
        hold on;
        plot(real(rxSymbolNoCP), 'r--', 'LineWidth', 1.5);
        title('Comparison of First Transmitted and Received OFDM Symbol (Without CP)');
        xlabel('Sample Index');
        ylabel('Amplitude');
        legend('Transmitted Symbol', 'Received Symbol');
        grid on;
    end

    if compareAllOFDMNoCP
        for i = 1:numReceivedSymbols
            txSymbolNoCP = ifftSymbols(:, i);
            rxSymbolNoCP = rxSymbolsNoCP(:, i);
            figure;
            plot(real(txSymbolNoCP), 'b', 'LineWidth', 1.5);
            hold on;
            plot(real(rxSymbolNoCP), 'r--', 'LineWidth', 1.5);
            title(['Comparison of Transmitted and Received OFDM Symbol' num2str(i) ' (Without CP)']);
            xlabel('Sample Index');
            ylabel('Amplitude');
            legend('Transmitted Symbol', 'Received Symbol');
            grid on;
        end
    end
end
