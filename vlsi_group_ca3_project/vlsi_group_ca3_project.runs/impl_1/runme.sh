#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/home/harmony/Xilinx/Vivado/2020.2/ids_lite/ISE/bin/lin64:/home/harmony/Xilinx/Vivado/2020.2/bin
else
  PATH=/home/harmony/Xilinx/Vivado/2020.2/ids_lite/ISE/bin/lin64:/home/harmony/Xilinx/Vivado/2020.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/media/2TB_Crucial_SSD/repos/vlsi_group_ca3/vlsi_group_ca3_project/vlsi_group_ca3_project.runs/impl_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

# pre-commands:
/bin/touch .init_design.begin.rst
EAStep vivado -log vi_sys_top_level.vdi -applog -m64 -product Vivado -messageDb vivado.pb -mode batch -source vi_sys_top_level.tcl -notrace


