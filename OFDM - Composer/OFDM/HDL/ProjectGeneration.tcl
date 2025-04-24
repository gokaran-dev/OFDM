# Note: This file is produced automatically, and will be overwritten the next
# time you press "Generate" in System Generator. 
#


namespace eval ::xilinx::dsp::planaheaddriver {
	set Compilation {IP Catalog}
	set CompilationFlow {IP}
	set CreateInterfaceDocument {off}
	set DSPDevice {xc7a35ti}
	set DSPFamily {artix7}
	set DSPPackage {cpg236}
	set DSPSpeed {-1L}
	set FPGAClockPeriod 10
	set GenerateTestBench 1
	set HDLLanguage {verilog}
	set IPOOCCacheRootPath {C:/Users/Gokaraan/AppData/Local/Xilinx/Sysgen/SysgenVivado/win64.o/ip}
	set IP_Auto_Infer {1}
	set IP_Categories_Text {System_Generator_for_DSP}
	set IP_Common_Repos {0}
	set IP_Description {}
	set IP_Dir {}
	set IP_Library_Text {SysGen}
	set IP_LifeCycle_Menu {2}
	set IP_Logo {sysgen_icon_100.png}
	set IP_Name {}
	set IP_Revision {376103243}
	set IP_Socket_IP {0}
	set IP_Socket_IP_Proj_Path {}
	set IP_Vendor_Text {User_Company}
	set IP_Version_Text {1.0}
	set ImplStrategyName {Vivado Implementation Defaults}
	set PostProjectCreationProc {dsp_package_for_vivado_ip_integrator}
	set Project {ofdm_transreceiver}
	set ProjectFiles {
		{{conv_pkg.v}}
		{{synth_reg.v}}
		{{synth_reg_w_init.v}}
		{{convert_type.v}}
		{{xlclockdriver_rd.v}}
		{{vivado_ip.tcl}}
		{{xpm_cc2c29_vivado.mem}}
		{{ofdm_transreceiver_entity_declarations.v}}
		{{ofdm_transreceiver.v}}
		{{ofdm_transreceiver_tb.v}}
		{{ofdm_transreceiver_clock.xdc}}
		{{ofdm_transreceiver.xdc}}
	}
	set SimPeriod 1
	set SimTime 5000
	set SimulationTime {50210.00000000 ns}
	set SynthStrategyName {Vivado Synthesis Defaults}
	set SynthesisTool {Vivado}
	set TargetDir {C:/Users/Gokaraan/Documents/Composer/OFDM/HDL}
	set TestBenchModule {ofdm_transreceiver_tb}
	set TopLevelModule {ofdm_transreceiver}
	set TopLevelSimulinkHandle 0.00012207
	set TopLevelPortInterface {}
	dict set TopLevelPortInterface imaginary_fft_input Name {imaginary_fft_input}
	dict set TopLevelPortInterface imaginary_fft_input Type Fix_16_15
	dict set TopLevelPortInterface imaginary_fft_input ArithmeticType xlSigned
	dict set TopLevelPortInterface imaginary_fft_input BinaryPoint 15
	dict set TopLevelPortInterface imaginary_fft_input Width 16
	dict set TopLevelPortInterface imaginary_fft_input DatFile {ofdm_transreceiver_imaginary_fft_input.dat}
	dict set TopLevelPortInterface imaginary_fft_input IconText {Imaginary_FFT_input}
	dict set TopLevelPortInterface imaginary_fft_input Direction in
	dict set TopLevelPortInterface imaginary_fft_input Period 4
	dict set TopLevelPortInterface imaginary_fft_input Interface 0
	dict set TopLevelPortInterface imaginary_fft_input InterfaceName {}
	dict set TopLevelPortInterface imaginary_fft_input InterfaceString {DATA}
	dict set TopLevelPortInterface imaginary_fft_input ClockDomain {ofdm_transreceiver}
	dict set TopLevelPortInterface imaginary_fft_input Locs {}
	dict set TopLevelPortInterface imaginary_fft_input IOStandard {}
	dict set TopLevelPortInterface real_fft_input Name {real_fft_input}
	dict set TopLevelPortInterface real_fft_input Type Fix_16_15
	dict set TopLevelPortInterface real_fft_input ArithmeticType xlSigned
	dict set TopLevelPortInterface real_fft_input BinaryPoint 15
	dict set TopLevelPortInterface real_fft_input Width 16
	dict set TopLevelPortInterface real_fft_input DatFile {ofdm_transreceiver_real_fft_input.dat}
	dict set TopLevelPortInterface real_fft_input IconText {Real_FFT_input}
	dict set TopLevelPortInterface real_fft_input Direction in
	dict set TopLevelPortInterface real_fft_input Period 4
	dict set TopLevelPortInterface real_fft_input Interface 0
	dict set TopLevelPortInterface real_fft_input InterfaceName {}
	dict set TopLevelPortInterface real_fft_input InterfaceString {DATA}
	dict set TopLevelPortInterface real_fft_input ClockDomain {ofdm_transreceiver}
	dict set TopLevelPortInterface real_fft_input Locs {}
	dict set TopLevelPortInterface real_fft_input IOStandard {}
	dict set TopLevelPortInterface random_binary_stream Name {random_binary_stream}
	dict set TopLevelPortInterface random_binary_stream Type UFix_1_0
	dict set TopLevelPortInterface random_binary_stream ArithmeticType xlUnsigned
	dict set TopLevelPortInterface random_binary_stream BinaryPoint 0
	dict set TopLevelPortInterface random_binary_stream Width 1
	dict set TopLevelPortInterface random_binary_stream DatFile {ofdm_transreceiver_random_binary_stream.dat}
	dict set TopLevelPortInterface random_binary_stream IconText {random_binary_stream}
	dict set TopLevelPortInterface random_binary_stream Direction in
	dict set TopLevelPortInterface random_binary_stream Period 1
	dict set TopLevelPortInterface random_binary_stream Interface 0
	dict set TopLevelPortInterface random_binary_stream InterfaceName {}
	dict set TopLevelPortInterface random_binary_stream InterfaceString {DATA}
	dict set TopLevelPortInterface random_binary_stream ClockDomain {ofdm_transreceiver}
	dict set TopLevelPortInterface random_binary_stream Locs {}
	dict set TopLevelPortInterface random_binary_stream IOStandard {}
	dict set TopLevelPortInterface real_output Name {real_output}
	dict set TopLevelPortInterface real_output Type Fix_23_15
	dict set TopLevelPortInterface real_output ArithmeticType xlSigned
	dict set TopLevelPortInterface real_output BinaryPoint 15
	dict set TopLevelPortInterface real_output Width 23
	dict set TopLevelPortInterface real_output DatFile {ofdm_transreceiver_real_output.dat}
	dict set TopLevelPortInterface real_output IconText {real_output}
	dict set TopLevelPortInterface real_output Direction out
	dict set TopLevelPortInterface real_output Period 4
	dict set TopLevelPortInterface real_output Interface 0
	dict set TopLevelPortInterface real_output InterfaceName {}
	dict set TopLevelPortInterface real_output InterfaceString {DATA}
	dict set TopLevelPortInterface real_output ClockDomain {ofdm_transreceiver}
	dict set TopLevelPortInterface real_output Locs {}
	dict set TopLevelPortInterface real_output IOStandard {}
	dict set TopLevelPortInterface imaginary_output Name {imaginary_output}
	dict set TopLevelPortInterface imaginary_output Type Fix_23_15
	dict set TopLevelPortInterface imaginary_output ArithmeticType xlSigned
	dict set TopLevelPortInterface imaginary_output BinaryPoint 15
	dict set TopLevelPortInterface imaginary_output Width 23
	dict set TopLevelPortInterface imaginary_output DatFile {ofdm_transreceiver_imaginary_output.dat}
	dict set TopLevelPortInterface imaginary_output IconText {Imaginary_output}
	dict set TopLevelPortInterface imaginary_output Direction out
	dict set TopLevelPortInterface imaginary_output Period 4
	dict set TopLevelPortInterface imaginary_output Interface 0
	dict set TopLevelPortInterface imaginary_output InterfaceName {}
	dict set TopLevelPortInterface imaginary_output InterfaceString {DATA}
	dict set TopLevelPortInterface imaginary_output ClockDomain {ofdm_transreceiver}
	dict set TopLevelPortInterface imaginary_output Locs {}
	dict set TopLevelPortInterface imaginary_output IOStandard {}
	dict set TopLevelPortInterface gateway_out2 Name {gateway_out2}
	dict set TopLevelPortInterface gateway_out2 Type UFix_1_0
	dict set TopLevelPortInterface gateway_out2 ArithmeticType xlUnsigned
	dict set TopLevelPortInterface gateway_out2 BinaryPoint 0
	dict set TopLevelPortInterface gateway_out2 Width 1
	dict set TopLevelPortInterface gateway_out2 DatFile {ofdm_transreceiver_gateway_out2.dat}
	dict set TopLevelPortInterface gateway_out2 IconText {Gateway Out2}
	dict set TopLevelPortInterface gateway_out2 Direction out
	dict set TopLevelPortInterface gateway_out2 Period 1
	dict set TopLevelPortInterface gateway_out2 Interface 0
	dict set TopLevelPortInterface gateway_out2 InterfaceName {}
	dict set TopLevelPortInterface gateway_out2 InterfaceString {DATA}
	dict set TopLevelPortInterface gateway_out2 ClockDomain {ofdm_transreceiver}
	dict set TopLevelPortInterface gateway_out2 Locs {}
	dict set TopLevelPortInterface gateway_out2 IOStandard {}
	dict set TopLevelPortInterface clk Name {clk}
	dict set TopLevelPortInterface clk Type -
	dict set TopLevelPortInterface clk ArithmeticType xlUnsigned
	dict set TopLevelPortInterface clk BinaryPoint 0
	dict set TopLevelPortInterface clk Width 1
	dict set TopLevelPortInterface clk DatFile {}
	dict set TopLevelPortInterface clk Direction in
	dict set TopLevelPortInterface clk Period 1
	dict set TopLevelPortInterface clk Interface 6
	dict set TopLevelPortInterface clk InterfaceName {}
	dict set TopLevelPortInterface clk InterfaceString {CLOCK}
	dict set TopLevelPortInterface clk ClockDomain {ofdm_transreceiver}
	dict set TopLevelPortInterface clk Locs {}
	dict set TopLevelPortInterface clk IOStandard {}
	dict set TopLevelPortInterface clk AssociatedInterfaces {}
	dict set TopLevelPortInterface clk AssociatedResets {}
	set MemoryMappedPort {}
}

source SgPaProject.tcl
::xilinx::dsp::planaheadworker::dsp_create_project