// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="sequence_sequence,hls_ip_2022_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu7ev-ffvf1517-1-i,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=3.408312,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=34,HLS_SYN_LUT=253,HLS_VERSION=2022_2}" *)

module sequence (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        n
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] n;

reg ap_idle;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_block_state1_pp0_stage0_iter0;
wire   [0:0] icmp_ln13_fu_56_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg   [31:0] n_assign_fu_38;
wire   [31:0] select_ln16_fu_140_p3;
wire    ap_loop_init;
reg   [31:0] ap_sig_allocacmp_n_assign_load;
wire   [31:0] sub_ln18_fu_74_p2;
wire   [30:0] lshr_ln18_1_fu_80_p4;
wire   [31:0] zext_ln18_fu_90_p1;
wire   [30:0] lshr_ln18_2_fu_100_p4;
wire   [0:0] tmp_fu_66_p3;
wire   [31:0] sub_ln18_1_fu_94_p2;
wire   [31:0] zext_ln18_1_fu_110_p1;
wire   [31:0] shl_ln21_fu_122_p2;
wire   [31:0] sub_ln21_fu_128_p2;
wire   [0:0] empty_fu_62_p1;
wire   [31:0] add_ln21_fu_134_p2;
wire   [31:0] select_ln18_fu_114_p3;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_done_reg = 1'b0;
end

sequence_flow_control_loop_pipe flow_control_loop_pipe_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int),
    .ap_continue(1'b1)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        if ((icmp_ln13_fu_56_p2 == 1'd0)) begin
            n_assign_fu_38 <= select_ln16_fu_140_p3;
        end else if ((ap_loop_init == 1'b1)) begin
            n_assign_fu_38 <= n;
        end
    end
end

always @ (*) begin
    if ((ap_start_int == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln13_fu_56_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_n_assign_load = n;
    end else begin
        ap_sig_allocacmp_n_assign_load = n_assign_fu_38;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln21_fu_134_p2 = (sub_ln21_fu_128_p2 + 32'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = (ap_start_int == 1'b0);
end

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign empty_fu_62_p1 = ap_sig_allocacmp_n_assign_load[0:0];

assign icmp_ln13_fu_56_p2 = ((ap_sig_allocacmp_n_assign_load == 32'd1) ? 1'b1 : 1'b0);

assign lshr_ln18_1_fu_80_p4 = {{sub_ln18_fu_74_p2[31:1]}};

assign lshr_ln18_2_fu_100_p4 = {{ap_sig_allocacmp_n_assign_load[31:1]}};

assign select_ln16_fu_140_p3 = ((empty_fu_62_p1[0:0] == 1'b1) ? add_ln21_fu_134_p2 : select_ln18_fu_114_p3);

assign select_ln18_fu_114_p3 = ((tmp_fu_66_p3[0:0] == 1'b1) ? sub_ln18_1_fu_94_p2 : zext_ln18_1_fu_110_p1);

assign shl_ln21_fu_122_p2 = ap_sig_allocacmp_n_assign_load << 32'd2;

assign sub_ln18_1_fu_94_p2 = (32'd0 - zext_ln18_fu_90_p1);

assign sub_ln18_fu_74_p2 = (32'd0 - ap_sig_allocacmp_n_assign_load);

assign sub_ln21_fu_128_p2 = (shl_ln21_fu_122_p2 - ap_sig_allocacmp_n_assign_load);

assign tmp_fu_66_p3 = ap_sig_allocacmp_n_assign_load[32'd31];

assign zext_ln18_1_fu_110_p1 = lshr_ln18_2_fu_100_p4;

assign zext_ln18_fu_90_p1 = lshr_ln18_1_fu_80_p4;

endmodule //sequence