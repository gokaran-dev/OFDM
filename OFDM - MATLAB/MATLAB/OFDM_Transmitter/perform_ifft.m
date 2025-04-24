function ifftSymbols = perform_ifft(hermitianSym, fftSize, numOFDMSymbols, showAllIFFTPlots, showSingleIFFTPlot)
    % Perform IFFT (Inverse Fast Fourier Transform)
    ifftSymbols = ifft(hermitianSym, fftSize);

    % Plotting
    if showAllIFFTPlots
        for i = 1:numOFDMSymbols
            figure;
            plot(real(ifftSymbols(:, i)));
            title(['Time Domain OFDM Symbol ' num2str(i) ' (IFFT)']);
            xlabel('Sample Index');
            ylabel('Amplitude');
            grid on;
        end
    elseif showSingleIFFTPlot
        figure;
        plot(real(ifftSymbols(:, 1)));
        title('Time Domain OFDM Symbol 1 (IFFT)');
        xlabel('Sample Index');
        ylabel('Amplitude');
        grid on;
    end
end
