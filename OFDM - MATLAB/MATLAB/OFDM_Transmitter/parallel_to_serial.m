function serialData = parallel_to_serial(ofdmWithCP, showSerialDataPlot)
    % Parallel to Serial Conversion
    serialData = ofdmWithCP(:);  % Reshape matrix to a single column

    % Plotting
    if showSerialDataPlot
        figure;
        plot(real(serialData));
        title('Serial Data Stream for Transmission');
        xlabel('Sample Index');
        ylabel('Amplitude');
        grid on;
    end
end
