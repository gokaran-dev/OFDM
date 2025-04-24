function ofdmSymbolsWithGuard = subcarrier_grouping(qamSymbols, fftSize, dataSubcarriers, numOFDMSymbols, showAllOFDMSymbols, showOnlyFirstOFDMSymbol)
    % Subcarrier Grouping with Pilot Symbol Insertion
    pilotSymbol = 1 + 0j;  % Simple known pilot symbol
    serialToParallel = reshape(qamSymbols, dataSubcarriers, numOFDMSymbols);
    ofdmSymbolsWithGuard = zeros(fftSize, numOFDMSymbols);

    for i = 1:numOFDMSymbols
        % Insert the pilot symbol at a fixed subcarrier (e.g., subcarrier 1)
        ofdmSymbolsWithGuard(1, i) = pilotSymbol; % Pilot at subcarrier 0 (DC)
        ofdmSymbolsWithGuard(2:dataSubcarriers+1, i) = serialToParallel(:, i);  % Data symbols
    end

    % Plotting
    if showAllOFDMSymbols
        for i = 1:numOFDMSymbols
            figure;
            stem(real(ofdmSymbolsWithGuard(:, i)), 'filled');
            title(['Subcarrier Grouping for OFDM Symbol ' num2str(i)]);
            xlabel('Subcarrier Index');
            ylabel('Amplitude');
            axis([0 fftSize -1 1]);
            grid on;
        end
    elseif showOnlyFirstOFDMSymbol
        figure;
        stem(real(ofdmSymbolsWithGuard(:, 1)), 'filled');
        title('Subcarrier Grouping for OFDM Symbol 1');
        xlabel('Subcarrier Index');
        ylabel('Amplitude');
        axis([0 fftSize -1 1]);
        grid on;
    end
end
