/**
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

`ifndef SKY130_FD_SC_HVL__UDP_DLATCH_PR_V
`define SKY130_FD_SC_HVL__UDP_DLATCH_PR_V

/**
 * udp_dlatch$PR: D-latch, gated clear direct / gate active high
 *                (Q output UDP)
 *
 * Verilog primitive definition.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`ifdef NO_PRIMITIVES
`include "./sky130_fd_sc_hvl__udp_dlatch_pr.blackbox.v"
`else
primitive sky130_fd_sc_hvl__udp_dlatch$PR (
    Q    ,
    D    ,
    GATE ,
    RESET
);

    output Q    ;
    input  D    ;
    input  GATE ;
    input  RESET;

    reg Q;

    table
     //  D  GATE RESET :  Qt : Qt+1
         ?   0     0   :  ?  :  -    ; // hold
         0   1     0   :  ?  :  0    ; // pass 0
         1   1     0   :  ?  :  1    ; // pass 1
         ?   ?     1   :  ?  :  0    ; // async reset
         0   1     ?   :  ?  :  0    ; // reduce pessimism
         0   x     0   :  0  :  0    ; // reduce pessimism
         1   x     0   :  1  :  1    ; // reduce pessimism
         ?   0     x   :  0  :  0    ; // reduce pessimism
         0   x     x   :  0  :  0    ; // reduce pessimism
    endtable
endprimitive
`endif // NO_PRIMITIVES

`default_nettype wire
`endif  // SKY130_FD_SC_HVL__UDP_DLATCH_PR_V