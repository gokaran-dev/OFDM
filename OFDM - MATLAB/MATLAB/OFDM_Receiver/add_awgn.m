function [receivedSignal] = add_awgn(serialData, addAWGN, SNR_dB)
    if addAWGN
        signalPower = mean(abs(serialData).^2);
        SNR_linear = 10^(SNR_dB / 10);
        noisePower = signalPower / SNR_linear;
        noise = sqrt(noisePower / 2) * (randn(length(serialData), 1) + 1i * randn(length(serialData), 1));
        receivedSignal = serialData + noise;
    else
        receivedSignal = serialData;
    end

    figure;
    plot(real(receivedSignal));
    title('Received Signal (After AWGN Addition)');
    xlabel('Sample Index');
    ylabel('Amplitude');
    grid on;
end
