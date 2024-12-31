REM Set VIVADO_BIN_DIR to the directory which has vivado executable
set VIVADO_BIN_DIR=C:\Xilinx\Vivado\2024.2\bin
set OUT_SIM_SNAPSHOT=TexAddress
set XSI_INCLUDE_DIR=%VIVADO_BIN_DIR%\..\data\xsim\include
set XSIM_ELAB=xelab.bat

REM Compile the HDL design into a simulatable Shared Library
CALL %VIVADO_BIN_DIR%\%XSIM_ELAB% xil_defaultlib.%OUT_SIM_SNAPSHOT% -prj %OUT_SIM_SNAPSHOT%.prj -dll -s %OUT_SIM_SNAPSHOT% -debug off -rangecheck -stat
