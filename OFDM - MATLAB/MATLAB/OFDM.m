%==============================Parameters==================================
numOFDMSymbols = 10; 
fftSize = 64;  
modOrder = 64;  
bitsPerSymbol = log2(modOrder);  
dataSubcarriers = (fftSize / 2) - 1;  
numBits = numOFDMSymbols * dataSubcarriers * bitsPerSymbol;  
CP_Length = fftSize / 4; 
pilotSymbol = 1 + 0j; 


%===============================TRANSMITTER===============================
addpath('OFDM_Transmitter');


%Random Bits Generation
showRandomBitsPlot = true;
bits = random_bits_generation(numBits, showRandomBitsPlot);

%64 QAM Modulation
showQAMConstellation = true;
qamSymbols = qam_modulation(bits, bitsPerSymbol, modOrder, showQAMConstellation);

%Subcarrier Grouping
showAllOFDMSymbols = false;
showOnlyFirstOFDMSymbol = true;
ofdmSymbolsWithGuard = subcarrier_grouping(qamSymbols, fftSize, dataSubcarriers, numOFDMSymbols, showAllOFDMSymbols, showOnlyFirstOFDMSymbol);

%Hermitian Symmetry Mapping
showHermitianSymmetry = true;
showAllHermitianSymbols = false;
hermitianSym = hermitian_symmetry(ofdmSymbolsWithGuard, fftSize, numOFDMSymbols, pilotSymbol, showHermitianSymmetry, showAllHermitianSymbols);

%IFFT
showSingleIFFTPlot = true;
showAllIFFTPlots = false;
ifftSymbols = perform_ifft(hermitianSym, fftSize, numOFDMSymbols, showAllIFFTPlots, showSingleIFFTPlot);

%ADD Cyclic Prefix
showSingleCPPlot = true;
showAllCPPlots = false;
ofdmWithCP = add_cyclic_prefix(ifftSymbols, CP_Length, numOFDMSymbols, showAllCPPlots, showSingleCPPlot);

%Parallel to Serial
showSerialDataPlot = false;
serialData = parallel_to_serial(ofdmWithCP, showSerialDataPlot);

%=================================RECEIVER=================================
addpath('OFDM_Receiver');

%Channel AWGN
addAWGN = true;         
SNR_dB = 10;            
receivedSignal = add_awgn(serialData, addAWGN, SNR_dB);

%Serial to Parallel
showAllReceivedSymbols = false;
showOnlyFirstReceivedSymbol = false;
compareFirstTxRxOFDMSymbols = true;  
compareAllOFDMs = false;
[rxSymbols, numReceivedSymbols] = serial_to_parallel(receivedSignal, fftSize, CP_Length, showAllReceivedSymbols, showOnlyFirstReceivedSymbol, compareFirstTxRxOFDMSymbols, compareAllOFDMs, ofdmWithCP);

%Remove Cyclic Prefix
compareFirstOFDMNoCP = true;
compareAllOFDMNoCP = false;
rxSymbolsNoCP = remove_cyclic_prefix(rxSymbols, CP_Length, ifftSymbols, numReceivedSymbols, compareFirstOFDMNoCP, compareAllOFDMNoCP);

%FFT
compareFirstFFT = true;
compareAllFFT = false;
perform_fft(ifftSymbols, rxSymbolsNoCP, fftSize, numOFDMSymbols, compareFirstFFT, compareAllFFT);
rxSymbolsFFT = fft(rxSymbolsNoCP, fftSize);

%Pilot Extraction and Phase correction
showReceivedQAMConstellation = false; 
rxSymbolsCorrected = pilot_phase_correction(rxSymbolsFFT, pilotSymbol, showReceivedQAMConstellation);

%64 QAM Demodulation
showCorrectedConstellation = true;
demodulatedSymbolsCorrected = qam_demodulation(rxSymbolsCorrected, fftSize, modOrder, showCorrectedConstellation);

%Bitstream Reconstruction 
compareFirstTxRxSymbols = true; 
compareFullBitStream = false;     
demodulatedBitsCorrected = bitstream_reconstruction(demodulatedSymbolsCorrected, bitsPerSymbol, bits, compareFirstTxRxSymbols, compareFullBitStream);

%BER 
plotBER = false; 
BER = calculate_ber(bits, demodulatedBitsCorrected, plotBER);

