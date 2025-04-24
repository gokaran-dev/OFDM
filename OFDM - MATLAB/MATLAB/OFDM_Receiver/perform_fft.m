function perform_fft(ifftSymbols, rxSymbolsNoCP, fftSize, numOFDMSymbols, compareFirstFFT, compareAllFFT)
    txSymbolsFFT = fft(ifftSymbols, fftSize);
    rxSymbolsFFT = fft(rxSymbolsNoCP, fftSize);

    if compareFirstFFT
        figure;
        plot(1:fftSize, real(txSymbolsFFT(:,1)), 'b-', 'LineWidth', 1.5);
        hold on;
        plot(1:fftSize, real(rxSymbolsFFT(:,1)), 'r--', 'LineWidth', 1.5);
        title('Frequency Domain Comparison (First OFDM Symbol)');
        xlabel('Subcarrier Index');
        ylabel('Real Part of Symbol');
        legend('Transmitted (FFT)', 'Received (FFT)');
        grid on;
    end

    if compareAllFFT
        for i = 1:numOFDMSymbols
            figure;
            plot(1:fftSize, real(txSymbolsFFT(:,i)), 'b-', 'LineWidth', 1.5);
            hold on;
            plot(1:fftSize, real(rxSymbolsFFT(:,i)), 'r--', 'LineWidth', 1.5);
            title(['Frequency Domain Comparison (OFDM Symbol ' num2str(i) ')']);
            xlabel('Subcarrier Index');
            ylabel('Real Part of Symbol');
            legend('Transmitted (FFT)', 'Received (FFT)');
            grid on;
        end
    end
end
