function ofdmWithCP = add_cyclic_prefix(ifftSymbols, CP_Length, numOFDMSymbols, showAllCPPlots, showSingleCPPlot)
    % Add Cyclic Prefix
    ofdmWithCP = [ifftSymbols(end-CP_Length+1:end, :); ifftSymbols];

    % Plotting
    if showAllCPPlots
        for i = 1:numOFDMSymbols
            figure;
            plot(real(ofdmWithCP(:, i)));
            title(['Time Domain OFDM Symbol ' num2str(i) ' (IFFT with CP)']);
            xlabel('Sample Index');
            ylabel('Amplitude');
            grid on;
        end
    elseif showSingleCPPlot
        figure;
        plot(real(ofdmWithCP(:, 1)));
        title('Time Domain OFDM Symbol 1 (IFFT with CP)');
        xlabel('Sample Index');
        ylabel('Amplitude');
        grid on;
    end
end
