-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2017.2
-- Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity compressor is
generic (
    C_S_AXI_CTRL_BUS_ADDR_WIDTH : INTEGER := 5;
    C_S_AXI_CTRL_BUS_DATA_WIDTH : INTEGER := 32 );
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    in_V_TDATA : IN STD_LOGIC_VECTOR (31 downto 0);
    in_V_TVALID : IN STD_LOGIC;
    in_V_TREADY : OUT STD_LOGIC;
    out_V_TDATA : OUT STD_LOGIC_VECTOR (31 downto 0);
    out_V_TVALID : OUT STD_LOGIC;
    out_V_TREADY : IN STD_LOGIC;
    s_axi_CTRL_BUS_AWVALID : IN STD_LOGIC;
    s_axi_CTRL_BUS_AWREADY : OUT STD_LOGIC;
    s_axi_CTRL_BUS_AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_CTRL_BUS_ADDR_WIDTH-1 downto 0);
    s_axi_CTRL_BUS_WVALID : IN STD_LOGIC;
    s_axi_CTRL_BUS_WREADY : OUT STD_LOGIC;
    s_axi_CTRL_BUS_WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_CTRL_BUS_DATA_WIDTH-1 downto 0);
    s_axi_CTRL_BUS_WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_CTRL_BUS_DATA_WIDTH/8-1 downto 0);
    s_axi_CTRL_BUS_ARVALID : IN STD_LOGIC;
    s_axi_CTRL_BUS_ARREADY : OUT STD_LOGIC;
    s_axi_CTRL_BUS_ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_CTRL_BUS_ADDR_WIDTH-1 downto 0);
    s_axi_CTRL_BUS_RVALID : OUT STD_LOGIC;
    s_axi_CTRL_BUS_RREADY : IN STD_LOGIC;
    s_axi_CTRL_BUS_RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_CTRL_BUS_DATA_WIDTH-1 downto 0);
    s_axi_CTRL_BUS_RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    s_axi_CTRL_BUS_BVALID : OUT STD_LOGIC;
    s_axi_CTRL_BUS_BREADY : IN STD_LOGIC;
    s_axi_CTRL_BUS_BRESP : OUT STD_LOGIC_VECTOR (1 downto 0) );
end;


architecture behav of compressor is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "compressor,hls_ip_2017_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=1,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z100ffg900-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=7.256000,HLS_SYN_LAT=19,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=5,HLS_SYN_FF=942,HLS_SYN_LUT=1723}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (19 downto 0) := "00000000000000000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (19 downto 0) := "00000000000000000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (19 downto 0) := "00000000000000000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (19 downto 0) := "00000000000000001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (19 downto 0) := "00000000000000010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (19 downto 0) := "00000000000000100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (19 downto 0) := "00000000000001000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (19 downto 0) := "00000000000010000000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (19 downto 0) := "00000000000100000000";
    constant ap_ST_fsm_state10 : STD_LOGIC_VECTOR (19 downto 0) := "00000000001000000000";
    constant ap_ST_fsm_state11 : STD_LOGIC_VECTOR (19 downto 0) := "00000000010000000000";
    constant ap_ST_fsm_state12 : STD_LOGIC_VECTOR (19 downto 0) := "00000000100000000000";
    constant ap_ST_fsm_state13 : STD_LOGIC_VECTOR (19 downto 0) := "00000001000000000000";
    constant ap_ST_fsm_state14 : STD_LOGIC_VECTOR (19 downto 0) := "00000010000000000000";
    constant ap_ST_fsm_state15 : STD_LOGIC_VECTOR (19 downto 0) := "00000100000000000000";
    constant ap_ST_fsm_state16 : STD_LOGIC_VECTOR (19 downto 0) := "00001000000000000000";
    constant ap_ST_fsm_state17 : STD_LOGIC_VECTOR (19 downto 0) := "00010000000000000000";
    constant ap_ST_fsm_state18 : STD_LOGIC_VECTOR (19 downto 0) := "00100000000000000000";
    constant ap_ST_fsm_state19 : STD_LOGIC_VECTOR (19 downto 0) := "01000000000000000000";
    constant ap_ST_fsm_state20 : STD_LOGIC_VECTOR (19 downto 0) := "10000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv2_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv2_3 : STD_LOGIC_VECTOR (1 downto 0) := "11";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_12 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010010";
    constant ap_const_lv32_13 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010011";
    constant C_S_AXI_DATA_WIDTH : INTEGER range 63 downto 0 := 20;
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_11 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010001";
    constant ap_const_lv32_C : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001100";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_D : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001101";
    constant ap_const_lv32_9 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001001";
    constant ap_const_lv32_17 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010111";
    constant ap_const_lv32_1E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011110";
    constant ap_const_lv8_FF : STD_LOGIC_VECTOR (7 downto 0) := "11111111";
    constant ap_const_lv23_0 : STD_LOGIC_VECTOR (22 downto 0) := "00000000000000000000000";
    constant ap_const_lv32_80000000 : STD_LOGIC_VECTOR (31 downto 0) := "10000000000000000000000000000000";
    constant ap_const_lv5_2 : STD_LOGIC_VECTOR (4 downto 0) := "00010";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_rst_n_inv : STD_LOGIC;
    signal in_V_0_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal in_V_0_vld_in : STD_LOGIC;
    signal in_V_0_vld_out : STD_LOGIC;
    signal in_V_0_ack_in : STD_LOGIC;
    signal in_V_0_ack_out : STD_LOGIC;
    signal in_V_0_payload_A : STD_LOGIC_VECTOR (31 downto 0);
    signal in_V_0_payload_B : STD_LOGIC_VECTOR (31 downto 0);
    signal in_V_0_sel_rd : STD_LOGIC := '0';
    signal in_V_0_sel_wr : STD_LOGIC := '0';
    signal in_V_0_sel : STD_LOGIC;
    signal in_V_0_load_A : STD_LOGIC;
    signal in_V_0_load_B : STD_LOGIC;
    signal in_V_0_state : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal in_V_0_state_cmp_full : STD_LOGIC;
    signal out_V_1_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal out_V_1_vld_in : STD_LOGIC;
    signal out_V_1_vld_out : STD_LOGIC;
    signal out_V_1_ack_in : STD_LOGIC;
    signal out_V_1_ack_out : STD_LOGIC;
    signal out_V_1_payload_A : STD_LOGIC_VECTOR (31 downto 0);
    signal out_V_1_payload_B : STD_LOGIC_VECTOR (31 downto 0);
    signal out_V_1_sel_rd : STD_LOGIC := '0';
    signal out_V_1_sel_wr : STD_LOGIC := '0';
    signal out_V_1_sel : STD_LOGIC;
    signal out_V_1_load_A : STD_LOGIC;
    signal out_V_1_load_B : STD_LOGIC;
    signal out_V_1_state : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal out_V_1_state_cmp_full : STD_LOGIC;
    signal thresh : STD_LOGIC_VECTOR (31 downto 0);
    signal slope : STD_LOGIC_VECTOR (31 downto 0);
    signal in_V_TDATA_blk_n : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (19 downto 0) := "00000000000000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal out_V_TDATA_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state19 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state19 : signal is "none";
    signal ap_CS_fsm_state20 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state20 : signal is "none";
    signal grp_fu_77_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal reg_93 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state9 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state9 : signal is "none";
    signal tmp_15_reg_305 : STD_LOGIC_VECTOR (0 downto 0);
    signal sel_tmp2_reg_310 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state18 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state18 : signal is "none";
    signal grp_fu_81_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal reg_98 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state13 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state13 : signal is "none";
    signal slope_read_reg_248 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal thresh_read_reg_253 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_reg_261 : STD_LOGIC_VECTOR (31 downto 0);
    signal notlhs_fu_121_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal notlhs_reg_268 : STD_LOGIC_VECTOR (0 downto 0);
    signal notrhs_fu_127_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal notrhs_reg_273 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_8_neg_fu_133_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_8_neg_reg_279 : STD_LOGIC_VECTOR (31 downto 0);
    signal notlhs8_fu_149_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal notlhs8_reg_284 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_12_fu_184_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_12_reg_289 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal tmp_14_fu_85_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_14_reg_295 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_19_fu_89_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_19_reg_300 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_15_fu_203_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal sel_tmp2_fu_228_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_22_fu_240_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_77_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal ap_CS_fsm_state14 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state14 : signal is "none";
    signal ap_CS_fsm_state10 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state10 : signal is "none";
    signal tmp_19_fu_89_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_1_to_int_fu_103_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_4_fu_107_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_1_fu_117_p1 : STD_LOGIC_VECTOR (22 downto 0);
    signal tmp_16_fu_139_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal thresh_to_int_fu_155_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_9_fu_158_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_10_fu_168_p1 : STD_LOGIC_VECTOR (22 downto 0);
    signal notrhs7_fu_178_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal notlhs6_fu_172_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_11_fu_194_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_13_fu_198_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_17_fu_208_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_18_fu_212_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_20_fu_217_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal sel_tmp1_fu_222_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_21_fu_234_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_77_opcode : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (19 downto 0);

    component compressor_faddfsbkb IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        opcode : IN STD_LOGIC_VECTOR (1 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component compressor_fmul_3cud IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component compressor_fcmp_3dEe IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        opcode : IN STD_LOGIC_VECTOR (4 downto 0);
        dout : OUT STD_LOGIC_VECTOR (0 downto 0) );
    end component;


    component compressor_CTRL_BUS_s_axi IS
    generic (
        C_S_AXI_ADDR_WIDTH : INTEGER;
        C_S_AXI_DATA_WIDTH : INTEGER );
    port (
        AWVALID : IN STD_LOGIC;
        AWREADY : OUT STD_LOGIC;
        AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        WVALID : IN STD_LOGIC;
        WREADY : OUT STD_LOGIC;
        WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH/8-1 downto 0);
        ARVALID : IN STD_LOGIC;
        ARREADY : OUT STD_LOGIC;
        ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        RVALID : OUT STD_LOGIC;
        RREADY : IN STD_LOGIC;
        RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        BVALID : OUT STD_LOGIC;
        BREADY : IN STD_LOGIC;
        BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        ACLK : IN STD_LOGIC;
        ARESET : IN STD_LOGIC;
        ACLK_EN : IN STD_LOGIC;
        thresh : OUT STD_LOGIC_VECTOR (31 downto 0);
        slope : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    compressor_CTRL_BUS_s_axi_U : component compressor_CTRL_BUS_s_axi
    generic map (
        C_S_AXI_ADDR_WIDTH => C_S_AXI_CTRL_BUS_ADDR_WIDTH,
        C_S_AXI_DATA_WIDTH => C_S_AXI_CTRL_BUS_DATA_WIDTH)
    port map (
        AWVALID => s_axi_CTRL_BUS_AWVALID,
        AWREADY => s_axi_CTRL_BUS_AWREADY,
        AWADDR => s_axi_CTRL_BUS_AWADDR,
        WVALID => s_axi_CTRL_BUS_WVALID,
        WREADY => s_axi_CTRL_BUS_WREADY,
        WDATA => s_axi_CTRL_BUS_WDATA,
        WSTRB => s_axi_CTRL_BUS_WSTRB,
        ARVALID => s_axi_CTRL_BUS_ARVALID,
        ARREADY => s_axi_CTRL_BUS_ARREADY,
        ARADDR => s_axi_CTRL_BUS_ARADDR,
        RVALID => s_axi_CTRL_BUS_RVALID,
        RREADY => s_axi_CTRL_BUS_RREADY,
        RDATA => s_axi_CTRL_BUS_RDATA,
        RRESP => s_axi_CTRL_BUS_RRESP,
        BVALID => s_axi_CTRL_BUS_BVALID,
        BREADY => s_axi_CTRL_BUS_BREADY,
        BRESP => s_axi_CTRL_BUS_BRESP,
        ACLK => ap_clk,
        ARESET => ap_rst_n_inv,
        ACLK_EN => ap_const_logic_1,
        thresh => thresh,
        slope => slope);

    compressor_faddfsbkb_U1 : component compressor_faddfsbkb
    generic map (
        ID => 1,
        NUM_STAGE => 5,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        din0 => grp_fu_77_p0,
        din1 => thresh_read_reg_253,
        opcode => grp_fu_77_opcode,
        ce => ap_const_logic_1,
        dout => grp_fu_77_p2);

    compressor_fmul_3cud_U2 : component compressor_fmul_3cud
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        din0 => reg_93,
        din1 => slope_read_reg_248,
        ce => ap_const_logic_1,
        dout => grp_fu_81_p2);

    compressor_fcmp_3dEe_U3 : component compressor_fcmp_3dEe
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 1)
    port map (
        din0 => tmp_reg_261,
        din1 => thresh_read_reg_253,
        opcode => ap_const_lv5_2,
        dout => tmp_14_fu_85_p2);

    compressor_fcmp_3dEe_U4 : component compressor_fcmp_3dEe
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 1)
    port map (
        din0 => tmp_19_fu_89_p0,
        din1 => thresh_read_reg_253,
        opcode => ap_const_lv5_2,
        dout => tmp_19_fu_89_p2);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    in_V_0_sel_rd_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                in_V_0_sel_rd <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = in_V_0_ack_out) and (ap_const_logic_1 = in_V_0_vld_out))) then 
                                        in_V_0_sel_rd <= not(in_V_0_sel_rd);
                end if; 
            end if;
        end if;
    end process;


    in_V_0_sel_wr_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                in_V_0_sel_wr <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = in_V_0_vld_in) and (ap_const_logic_1 = in_V_0_ack_in))) then 
                                        in_V_0_sel_wr <= not(in_V_0_sel_wr);
                end if; 
            end if;
        end if;
    end process;


    in_V_0_state_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                in_V_0_state <= ap_const_lv2_0;
            else
                if ((((ap_const_logic_0 = in_V_0_vld_in) and (ap_const_logic_1 = in_V_0_ack_out) and (in_V_0_state = ap_const_lv2_3)) or ((ap_const_logic_0 = in_V_0_vld_in) and (in_V_0_state = ap_const_lv2_2)))) then 
                    in_V_0_state <= ap_const_lv2_2;
                elsif ((((ap_const_logic_1 = in_V_0_vld_in) and (ap_const_logic_0 = in_V_0_ack_out) and (in_V_0_state = ap_const_lv2_3)) or ((ap_const_logic_0 = in_V_0_ack_out) and (in_V_0_state = ap_const_lv2_1)))) then 
                    in_V_0_state <= ap_const_lv2_1;
                elsif ((((ap_const_logic_1 = in_V_0_vld_in) and (in_V_0_state = ap_const_lv2_2)) or ((ap_const_logic_1 = in_V_0_ack_out) and (in_V_0_state = ap_const_lv2_1)) or ((in_V_0_state = ap_const_lv2_3) and not(((ap_const_logic_1 = in_V_0_vld_in) and (ap_const_logic_0 = in_V_0_ack_out))) and not(((ap_const_logic_0 = in_V_0_vld_in) and (ap_const_logic_1 = in_V_0_ack_out)))))) then 
                    in_V_0_state <= ap_const_lv2_3;
                else 
                    in_V_0_state <= ap_const_lv2_2;
                end if; 
            end if;
        end if;
    end process;


    out_V_1_sel_rd_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                out_V_1_sel_rd <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = out_V_1_ack_out) and (ap_const_logic_1 = out_V_1_vld_out))) then 
                                        out_V_1_sel_rd <= not(out_V_1_sel_rd);
                end if; 
            end if;
        end if;
    end process;


    out_V_1_sel_wr_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                out_V_1_sel_wr <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = out_V_1_vld_in) and (ap_const_logic_1 = out_V_1_ack_in))) then 
                                        out_V_1_sel_wr <= not(out_V_1_sel_wr);
                end if; 
            end if;
        end if;
    end process;


    out_V_1_state_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                out_V_1_state <= ap_const_lv2_0;
            else
                if ((((ap_const_logic_0 = out_V_1_vld_in) and (ap_const_logic_1 = out_V_1_ack_out) and (ap_const_lv2_3 = out_V_1_state)) or ((ap_const_logic_0 = out_V_1_vld_in) and (ap_const_lv2_2 = out_V_1_state)))) then 
                    out_V_1_state <= ap_const_lv2_2;
                elsif ((((ap_const_logic_1 = out_V_1_vld_in) and (ap_const_logic_0 = out_V_1_ack_out) and (ap_const_lv2_3 = out_V_1_state)) or ((ap_const_logic_0 = out_V_1_ack_out) and (ap_const_lv2_1 = out_V_1_state)))) then 
                    out_V_1_state <= ap_const_lv2_1;
                elsif ((((ap_const_logic_1 = out_V_1_vld_in) and (ap_const_lv2_2 = out_V_1_state)) or ((ap_const_logic_1 = out_V_1_ack_out) and (ap_const_lv2_1 = out_V_1_state)) or ((ap_const_lv2_3 = out_V_1_state) and not(((ap_const_logic_1 = out_V_1_vld_in) and (ap_const_logic_0 = out_V_1_ack_out))) and not(((ap_const_logic_0 = out_V_1_vld_in) and (ap_const_logic_1 = out_V_1_ack_out)))))) then 
                    out_V_1_state <= ap_const_lv2_3;
                else 
                    out_V_1_state <= ap_const_lv2_2;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = in_V_0_load_A)) then
                in_V_0_payload_A <= in_V_TDATA;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = in_V_0_load_B)) then
                in_V_0_payload_B <= in_V_TDATA;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state2) and (in_V_0_vld_out = ap_const_logic_1))) then
                notlhs8_reg_284 <= notlhs8_fu_149_p2;
                notlhs_reg_268 <= notlhs_fu_121_p2;
                notrhs_reg_273 <= notrhs_fu_127_p2;
                tmp_8_neg_reg_279 <= tmp_8_neg_fu_133_p2;
                tmp_reg_261 <= in_V_0_data_out;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = out_V_1_load_A)) then
                out_V_1_payload_A <= tmp_22_fu_240_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = out_V_1_load_B)) then
                out_V_1_payload_B <= tmp_22_fu_240_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((((ap_const_logic_1 = ap_CS_fsm_state9) and (ap_const_lv1_1 = tmp_15_reg_305) and (ap_const_lv1_0 = sel_tmp2_reg_310)) or ((ap_const_logic_1 = ap_CS_fsm_state9) and (ap_const_lv1_1 = sel_tmp2_reg_310)) or ((ap_const_lv1_1 = tmp_15_reg_305) and (ap_const_lv1_0 = sel_tmp2_reg_310) and (ap_const_logic_1 = ap_CS_fsm_state18)) or ((ap_const_lv1_1 = sel_tmp2_reg_310) and (ap_const_logic_1 = ap_CS_fsm_state18)))) then
                reg_93 <= grp_fu_77_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((((ap_const_lv1_1 = tmp_15_reg_305) and (ap_const_lv1_0 = sel_tmp2_reg_310) and (ap_const_logic_1 = ap_CS_fsm_state13)) or ((ap_const_lv1_1 = sel_tmp2_reg_310) and (ap_const_logic_1 = ap_CS_fsm_state13)))) then
                reg_98 <= grp_fu_81_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state4)) then
                sel_tmp2_reg_310 <= sel_tmp2_fu_228_p2;
                tmp_15_reg_305 <= tmp_15_fu_203_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                slope_read_reg_248 <= slope;
                thresh_read_reg_253 <= thresh;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                tmp_12_reg_289 <= tmp_12_fu_184_p2;
                tmp_14_reg_295 <= tmp_14_fu_85_p2;
                tmp_19_reg_300 <= tmp_19_fu_89_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (in_V_0_vld_out, out_V_1_ack_in, ap_CS_fsm, ap_CS_fsm_state2, ap_CS_fsm_state19, ap_CS_fsm_state20)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                ap_NS_fsm <= ap_ST_fsm_state2;
            when ap_ST_fsm_state2 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (in_V_0_vld_out = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state7;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state8 => 
                ap_NS_fsm <= ap_ST_fsm_state9;
            when ap_ST_fsm_state9 => 
                ap_NS_fsm <= ap_ST_fsm_state10;
            when ap_ST_fsm_state10 => 
                ap_NS_fsm <= ap_ST_fsm_state11;
            when ap_ST_fsm_state11 => 
                ap_NS_fsm <= ap_ST_fsm_state12;
            when ap_ST_fsm_state12 => 
                ap_NS_fsm <= ap_ST_fsm_state13;
            when ap_ST_fsm_state13 => 
                ap_NS_fsm <= ap_ST_fsm_state14;
            when ap_ST_fsm_state14 => 
                ap_NS_fsm <= ap_ST_fsm_state15;
            when ap_ST_fsm_state15 => 
                ap_NS_fsm <= ap_ST_fsm_state16;
            when ap_ST_fsm_state16 => 
                ap_NS_fsm <= ap_ST_fsm_state17;
            when ap_ST_fsm_state17 => 
                ap_NS_fsm <= ap_ST_fsm_state18;
            when ap_ST_fsm_state18 => 
                ap_NS_fsm <= ap_ST_fsm_state19;
            when ap_ST_fsm_state19 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state19) and (out_V_1_ack_in = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state20;
                else
                    ap_NS_fsm <= ap_ST_fsm_state19;
                end if;
            when ap_ST_fsm_state20 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state20) and (out_V_1_ack_in = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state20;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXXXXXXXXXXXXXXXXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state10 <= ap_CS_fsm(9);
    ap_CS_fsm_state13 <= ap_CS_fsm(12);
    ap_CS_fsm_state14 <= ap_CS_fsm(13);
    ap_CS_fsm_state18 <= ap_CS_fsm(17);
    ap_CS_fsm_state19 <= ap_CS_fsm(18);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state20 <= ap_CS_fsm(19);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state9 <= ap_CS_fsm(8);

    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;


    grp_fu_77_opcode_assign_proc : process(tmp_15_reg_305, sel_tmp2_reg_310, ap_CS_fsm_state5, ap_CS_fsm_state14)
    begin
        if ((((ap_const_lv1_1 = tmp_15_reg_305) and (ap_const_lv1_0 = sel_tmp2_reg_310) and (ap_const_logic_1 = ap_CS_fsm_state5)) or ((ap_const_lv1_1 = sel_tmp2_reg_310) and (ap_const_logic_1 = ap_CS_fsm_state14)))) then 
            grp_fu_77_opcode <= ap_const_lv2_1;
        elsif ((((ap_const_lv1_1 = sel_tmp2_reg_310) and (ap_const_logic_1 = ap_CS_fsm_state5)) or ((ap_const_lv1_1 = tmp_15_reg_305) and (ap_const_lv1_0 = sel_tmp2_reg_310) and (ap_const_logic_1 = ap_CS_fsm_state14)))) then 
            grp_fu_77_opcode <= ap_const_lv2_0;
        else 
            grp_fu_77_opcode <= "XX";
        end if; 
    end process;


    grp_fu_77_p0_assign_proc : process(tmp_15_reg_305, sel_tmp2_reg_310, reg_98, tmp_reg_261, ap_CS_fsm_state5, ap_CS_fsm_state14)
    begin
        if ((((ap_const_lv1_1 = tmp_15_reg_305) and (ap_const_lv1_0 = sel_tmp2_reg_310) and (ap_const_logic_1 = ap_CS_fsm_state14)) or ((ap_const_lv1_1 = sel_tmp2_reg_310) and (ap_const_logic_1 = ap_CS_fsm_state14)))) then 
            grp_fu_77_p0 <= reg_98;
        elsif ((((ap_const_lv1_1 = tmp_15_reg_305) and (ap_const_lv1_0 = sel_tmp2_reg_310) and (ap_const_logic_1 = ap_CS_fsm_state5)) or ((ap_const_lv1_1 = sel_tmp2_reg_310) and (ap_const_logic_1 = ap_CS_fsm_state5)))) then 
            grp_fu_77_p0 <= tmp_reg_261;
        else 
            grp_fu_77_p0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    in_V_0_ack_in <= in_V_0_state(1);

    in_V_0_ack_out_assign_proc : process(in_V_0_vld_out, ap_CS_fsm_state2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (in_V_0_vld_out = ap_const_logic_1))) then 
            in_V_0_ack_out <= ap_const_logic_1;
        else 
            in_V_0_ack_out <= ap_const_logic_0;
        end if; 
    end process;


    in_V_0_data_out_assign_proc : process(in_V_0_payload_A, in_V_0_payload_B, in_V_0_sel)
    begin
        if ((ap_const_logic_1 = in_V_0_sel)) then 
            in_V_0_data_out <= in_V_0_payload_B;
        else 
            in_V_0_data_out <= in_V_0_payload_A;
        end if; 
    end process;

    in_V_0_load_A <= (in_V_0_state_cmp_full and not(in_V_0_sel_wr));
    in_V_0_load_B <= (in_V_0_sel_wr and in_V_0_state_cmp_full);
    in_V_0_sel <= in_V_0_sel_rd;
    in_V_0_state_cmp_full <= '0' when (in_V_0_state = ap_const_lv2_1) else '1';
    in_V_0_vld_in <= in_V_TVALID;
    in_V_0_vld_out <= in_V_0_state(0);

    in_V_TDATA_blk_n_assign_proc : process(in_V_0_state, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            in_V_TDATA_blk_n <= in_V_0_state(0);
        else 
            in_V_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    in_V_TREADY <= in_V_0_state(1);
    notlhs6_fu_172_p2 <= "0" when (tmp_9_fu_158_p4 = ap_const_lv8_FF) else "1";
    notlhs8_fu_149_p2 <= "0" when (tmp_16_fu_139_p4 = ap_const_lv8_FF) else "1";
    notlhs_fu_121_p2 <= "0" when (tmp_4_fu_107_p4 = ap_const_lv8_FF) else "1";
    notrhs7_fu_178_p2 <= "1" when (tmp_10_fu_168_p1 = ap_const_lv23_0) else "0";
    notrhs_fu_127_p2 <= "1" when (tmp_1_fu_117_p1 = ap_const_lv23_0) else "0";
    out_V_1_ack_in <= out_V_1_state(1);
    out_V_1_ack_out <= out_V_TREADY;

    out_V_1_data_out_assign_proc : process(out_V_1_payload_A, out_V_1_payload_B, out_V_1_sel)
    begin
        if ((ap_const_logic_1 = out_V_1_sel)) then 
            out_V_1_data_out <= out_V_1_payload_B;
        else 
            out_V_1_data_out <= out_V_1_payload_A;
        end if; 
    end process;

    out_V_1_load_A <= (out_V_1_state_cmp_full and not(out_V_1_sel_wr));
    out_V_1_load_B <= (out_V_1_sel_wr and out_V_1_state_cmp_full);
    out_V_1_sel <= out_V_1_sel_rd;
    out_V_1_state_cmp_full <= '0' when (out_V_1_state = ap_const_lv2_1) else '1';

    out_V_1_vld_in_assign_proc : process(out_V_1_ack_in, ap_CS_fsm_state19)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state19) and (out_V_1_ack_in = ap_const_logic_1))) then 
            out_V_1_vld_in <= ap_const_logic_1;
        else 
            out_V_1_vld_in <= ap_const_logic_0;
        end if; 
    end process;

    out_V_1_vld_out <= out_V_1_state(0);
    out_V_TDATA <= out_V_1_data_out;

    out_V_TDATA_blk_n_assign_proc : process(out_V_1_state, ap_CS_fsm_state19, ap_CS_fsm_state20)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state19) or (ap_const_logic_1 = ap_CS_fsm_state20))) then 
            out_V_TDATA_blk_n <= out_V_1_state(1);
        else 
            out_V_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    out_V_TVALID <= out_V_1_state(0);
    sel_tmp1_fu_222_p2 <= (tmp_15_fu_203_p2 xor ap_const_lv1_1);
    sel_tmp2_fu_228_p2 <= (tmp_20_fu_217_p2 and sel_tmp1_fu_222_p2);
    thresh_to_int_fu_155_p1 <= thresh_read_reg_253;
    tmp_10_fu_168_p1 <= thresh_to_int_fu_155_p1(23 - 1 downto 0);
    tmp_11_fu_194_p2 <= (notrhs_reg_273 or notlhs_reg_268);
    tmp_12_fu_184_p2 <= (notrhs7_fu_178_p2 or notlhs6_fu_172_p2);
    tmp_13_fu_198_p2 <= (tmp_11_fu_194_p2 and tmp_12_reg_289);
    tmp_15_fu_203_p2 <= (tmp_13_fu_198_p2 and tmp_14_reg_295);
    tmp_16_fu_139_p4 <= tmp_8_neg_fu_133_p2(30 downto 23);
    tmp_17_fu_208_p2 <= (notrhs_reg_273 or notlhs8_reg_284);
    tmp_18_fu_212_p2 <= (tmp_17_fu_208_p2 and tmp_12_reg_289);
    tmp_19_fu_89_p0 <= tmp_8_neg_reg_279;
    tmp_1_fu_117_p1 <= tmp_1_to_int_fu_103_p1(23 - 1 downto 0);
    tmp_1_to_int_fu_103_p1 <= in_V_0_data_out;
    tmp_20_fu_217_p2 <= (tmp_18_fu_212_p2 and tmp_19_reg_300);
    tmp_21_fu_234_p3 <= 
        reg_93 when (tmp_15_reg_305(0) = '1') else 
        tmp_reg_261;
    tmp_22_fu_240_p3 <= 
        reg_93 when (sel_tmp2_reg_310(0) = '1') else 
        tmp_21_fu_234_p3;
    tmp_4_fu_107_p4 <= tmp_1_to_int_fu_103_p1(30 downto 23);
    tmp_8_neg_fu_133_p2 <= (tmp_1_to_int_fu_103_p1 xor ap_const_lv32_80000000);
    tmp_9_fu_158_p4 <= thresh_to_int_fu_155_p1(30 downto 23);
end behav;
