function hermitianSym = hermitian_symmetry(ofdmSymbolsWithGuard, fftSize, numOFDMSymbols, pilotSymbol, showHermitianSymmetry, showAllHermitianSymbols)
    % Hermitian Symmetry Mapping
    hermitianSym = zeros(fftSize, numOFDMSymbols); % Preallocate

    for i = 1:numOFDMSymbols
        % Create Hermitian symmetric OFDM symbol
        hermitianSym(1, i) = pilotSymbol;                   % DC is the pilot symbol
        hermitianSym(2:32, i) = ofdmSymbolsWithGuard(2:32, i); % Positive frequencies
        hermitianSym(33, i) = 0;                             % Nyquist frequency
        hermitianSym(34:64, i) = conj(flipud(ofdmSymbolsWithGuard(2:32, i))); % Negative frequencies
    end

    % Plotting
    if showHermitianSymmetry
        figure;
        stem(real(hermitianSym(:, 1)), 'filled');
        title('Hermitian Symmetry for 1st OFDM Symbol');
        xlabel('Subcarrier Index');
        ylabel('Amplitude');
        grid on;
    end

    if showAllHermitianSymbols
        for i = 1:numOFDMSymbols
            figure;
            stem(real(hermitianSym(:, i)), 'filled');
            title(['Hermitian Symmetry for OFDM Symbol ' num2str(i)]);
            xlabel('Subcarrier Index');
            ylabel('Amplitude');
            grid on;
        end
    end
end
