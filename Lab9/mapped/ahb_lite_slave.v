/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Mon Mar 25 18:45:27 2024
/////////////////////////////////////////////////////////////


module ahb_lite_slave ( clk, n_rst, modwait, err, hsel, hsize, hwrite, 
        coefficient_num, htrans, fir_out, hwdata, haddr, sample_data, 
        fir_coefficient, hrdata, data_ready, new_coefficient_set, hresp, 
        clear_new_coefficient );
  input [1:0] coefficient_num;
  input [1:0] htrans;
  input [15:0] fir_out;
  input [15:0] hwdata;
  input [3:0] haddr;
  output [15:0] sample_data;
  output [15:0] fir_coefficient;
  output [15:0] hrdata;
  input clk, n_rst, modwait, err, hsel, hsize, hwrite, clear_new_coefficient;
  output data_ready, new_coefficient_set, hresp;
  wire   next_next_data_ready, next_hwrite, next_hsize, next_hsel,
         next_data_ready, N492, N493, N494, N495, N496, N497, N498, N499, N500,
         N501, N502, N503, N504, N505, N506, N507, N508, n592, n593, n594,
         n595, n596, n597, n598, n599, n600, n601, n602, n603, n604, n605,
         n606, n607, n608, n609, n610, n611, n612, n613, n614, n615, n616,
         n617, n618, n619, n620, n621, n622, n623, n624, n625, n626, n627,
         n628, n629, n630, n631, n632, n633, n634, n635, n636, n637, n638,
         n639, n640, n641, n642, n643, n644, n645, n646, n647, n648, n649,
         n650, n651, n652, n653, n654, n655, n656, n657, n658, n659, n660,
         n661, n662, n663, n789, n790, n791, n792, n793, n794, n795, n796,
         n797, n798, n799, n800, n801, n802, n803, n804, n805, n806, n807,
         n808, n809, n810, n811, n812, n813, n814, n815, n816, n817, n818,
         n819, n820, n821, n822, n823, n824, n825, n826, n827, n828, n829,
         n830, n831, n832, n833, n834, n835, n836, n837, n838, n839, n840,
         n841, n842, n843, n844, n845, n846, n847, n848, n849, n850, n851,
         n852, n853, n854, n855, n856, n857, n858, n859, n860, n861, n862,
         n863, n864, n865, n866, n867, n868, n869, n870, n871, n872, n873,
         n874, n875, n876, n877, n878, n879, n880, n881, n882, n883, n884,
         n885, n886, n887, n888, n889, n890, n891, n892, n893, n894, n895,
         n896, n897, n898, n899, n900, n901, n902, n903, n904, n905, n906,
         n907, n908, n909, n910, n911, n912, n913, n914, n915, n916, n917,
         n918, n919, n920, n921, n922, n923, n924, n925, n926, n927, n928,
         n929, n930, n931, n932, n933, n934, n935, n936, n937, n938, n939,
         n940, n941, n942, n943, n944, n945, n946, n947, n948, n949, n950,
         n951, n952, n953, n954, n955, n956, n957, n958, n959, n960, n961,
         n962, n963, n964, n965, n966, n967, n968, n969, n970, n971, n972,
         n973, n974, n975, n976, n977, n978, n979, n980, n981, n982, n983,
         n984, n985, n986, n987, n988, n989, n990, n991, n992, n993, n994,
         n995, n996, n997, n998, n999, n1000, n1001, n1002, n1003, n1004,
         n1005, n1006, n1007, n1008, n1009, n1010, n1011, n1012, n1013, n1014,
         n1015, n1016, n1017, n1018, n1019, n1020, n1021, n1022, n1023, n1024,
         n1025, n1026, n1027, n1028, n1029, n1030, n1031, n1032, n1033, n1034,
         n1035, n1036, n1037, n1038, n1039, n1040, n1041, n1042, n1043, n1044,
         n1045, n1046, n1047, n1048, n1049, n1050, n1051, n1052, n1053, n1054,
         n1055, n1056, n1057, n1058, n1059, n1060, n1061, n1062, n1063, n1064,
         n1065, n1066, n1067, n1068, n1069, n1070, n1071, n1072, n1073, n1074,
         n1075, n1076, n1077, n1078, n1079, n1080, n1081, n1082, n1083, n1084,
         n1085, n1086, n1087, n1088, n1089, n1090, n1091, n1092, n1093, n1094,
         n1095, n1096, n1097, n1098, n1099, n1100, n1101, n1102, n1103, n1104,
         n1105, n1106, n1107, n1108, n1109, n1110, n1111, n1112, n1113, n1114,
         n1115, n1116, n1117, n1118, n1119, n1120, n1121, n1122, n1123, n1124,
         n1125, n1126, n1127, n1128, n1129, n1130, n1131, n1132, n1133, n1134,
         n1135, n1136, n1137, n1138, n1139, n1140, n1141, n1142, n1143, n1144,
         n1145, n1146, n1147, n1148, n1149, n1150, n1151, n1152, n1153, n1154,
         n1155, n1156, n1157, n1158, n1159, n1160, n1161, n1162, n1163, n1164,
         n1165, n1166, n1167, n1168, n1169, n1170, n1171, n1172, n1173, n1174,
         n1175, n1176, n1177, n1178, n1179, n1180, n1181, n1182, n1183, n1184,
         n1185, n1186, n1187, n1188, n1189, n1190, n1191, n1192, n1193, n1194,
         n1195, n1196, n1197, n1198, n1199, n1200, n1201, n1202, n1203, n1204,
         n1205, n1206, n1207, n1208, n1209, n1210, n1211, n1212, n1213, n1214,
         n1215, n1216, n1217, n1218, n1219, n1220, n1221, n1222, n1223, n1224,
         n1225, n1226, n1227, n1228, n1229, n1230, n1231, n1232, n1233, n1234,
         n1235, n1236, n1237, n1238, n1239, n1240, n1241, n1242, n1243, n1244,
         n1245, n1246, n1247, n1248, n1249, n1250, n1251, n1252, n1253, n1254,
         n1255, n1256, n1257, n1258, n1259, n1260, n1261, n1262, n1263, n1264,
         n1265, n1266, n1267, n1268, n1269, n1270, n1271, n1272, n1273, n1274,
         n1275, n1276, n1277, n1278, n1279, n1280, n1281, n1282, n1283, n1284,
         n1285, n1286, n1287, n1288, n1289, n1290, n1291, n1292, n1293, n1294,
         n1295, n1296, n1297, n1298, n1299, n1300, n1301, n1302, n1303, n1304,
         n1305, n1306, n1307, n1308, n1309, n1310, n1311, n1312, n1313, n1314,
         n1315, n1316, n1317, n1318, n1319, n1320, n1321, n1322, n1323, n1324,
         n1325, n1326, n1327, n1328;
  wire   [3:0] next_haddr;
  wire   [15:0] f0_coefficient;
  wire   [15:0] f1_coefficient;
  wire   [15:0] f2_coefficient;
  wire   [15:0] f3_coefficient;

  DFFSR next_hsel_reg ( .D(hsel), .CLK(clk), .R(n_rst), .S(1'b1), .Q(next_hsel) );
  DFFSR \next_haddr_reg[3]  ( .D(haddr[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(next_haddr[3]) );
  DFFSR \next_haddr_reg[2]  ( .D(haddr[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(next_haddr[2]) );
  DFFSR \next_haddr_reg[1]  ( .D(haddr[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(next_haddr[1]) );
  DFFSR \next_haddr_reg[0]  ( .D(haddr[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(next_haddr[0]) );
  DFFSR next_hwrite_reg ( .D(hwrite), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        next_hwrite) );
  DFFSR new_coefficient_set_reg ( .D(n1328), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(new_coefficient_set) );
  DFFSR next_next_data_ready_reg ( .D(next_data_ready), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(next_next_data_ready) );
  DFFSR data_ready_reg ( .D(next_data_ready), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_ready) );
  DFFSR next_hsize_reg ( .D(hsize), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        next_hsize) );
  DFFSR \f2_coefficient_reg[0]  ( .D(n663), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f2_coefficient[0]) );
  DFFSR \f2_coefficient_reg[1]  ( .D(n1325), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f2_coefficient[1]) );
  DFFSR \f2_coefficient_reg[2]  ( .D(n1322), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f2_coefficient[2]) );
  DFFSR \f2_coefficient_reg[3]  ( .D(n1319), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f2_coefficient[3]) );
  DFFSR \f2_coefficient_reg[4]  ( .D(n1316), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f2_coefficient[4]) );
  DFFSR \f2_coefficient_reg[5]  ( .D(n1313), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f2_coefficient[5]) );
  DFFSR \f2_coefficient_reg[6]  ( .D(n1310), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f2_coefficient[6]) );
  DFFSR \f2_coefficient_reg[7]  ( .D(n1307), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f2_coefficient[7]) );
  DFFSR \sample_data_reg[0]  ( .D(n1327), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[0]) );
  DFFSR \sample_data_reg[1]  ( .D(n646), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[1]) );
  DFFSR \sample_data_reg[2]  ( .D(n645), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[2]) );
  DFFSR \sample_data_reg[3]  ( .D(n644), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[3]) );
  DFFSR \sample_data_reg[4]  ( .D(n643), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[4]) );
  DFFSR \sample_data_reg[5]  ( .D(n642), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[5]) );
  DFFSR \sample_data_reg[6]  ( .D(n641), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[6]) );
  DFFSR \sample_data_reg[7]  ( .D(n640), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[7]) );
  DFFSR \f1_coefficient_reg[7]  ( .D(n1305), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f1_coefficient[7]) );
  DFFSR \f1_coefficient_reg[0]  ( .D(n616), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f1_coefficient[0]) );
  DFFSR \f1_coefficient_reg[1]  ( .D(n1323), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f1_coefficient[1]) );
  DFFSR \f1_coefficient_reg[2]  ( .D(n1320), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f1_coefficient[2]) );
  DFFSR \f1_coefficient_reg[3]  ( .D(n1317), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f1_coefficient[3]) );
  DFFSR \f1_coefficient_reg[4]  ( .D(n1314), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f1_coefficient[4]) );
  DFFSR \f1_coefficient_reg[5]  ( .D(n1311), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f1_coefficient[5]) );
  DFFSR \f1_coefficient_reg[6]  ( .D(n1308), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f1_coefficient[6]) );
  DFFSR \f2_coefficient_reg[15]  ( .D(n1304), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f2_coefficient[15]) );
  DFFSR \f2_coefficient_reg[8]  ( .D(n662), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f2_coefficient[8]) );
  DFFSR \f2_coefficient_reg[9]  ( .D(n661), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f2_coefficient[9]) );
  DFFSR \f2_coefficient_reg[10]  ( .D(n660), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f2_coefficient[10]) );
  DFFSR \f2_coefficient_reg[11]  ( .D(n659), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f2_coefficient[11]) );
  DFFSR \f2_coefficient_reg[12]  ( .D(n658), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f2_coefficient[12]) );
  DFFSR \f2_coefficient_reg[13]  ( .D(n657), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f2_coefficient[13]) );
  DFFSR \f2_coefficient_reg[14]  ( .D(n656), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f2_coefficient[14]) );
  DFFSR \sample_data_reg[8]  ( .D(n639), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[8]) );
  DFFSR \sample_data_reg[9]  ( .D(n638), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[9]) );
  DFFSR \sample_data_reg[10]  ( .D(n637), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[10]) );
  DFFSR \sample_data_reg[11]  ( .D(n636), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[11]) );
  DFFSR \sample_data_reg[12]  ( .D(n635), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[12]) );
  DFFSR \sample_data_reg[13]  ( .D(n634), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[13]) );
  DFFSR \sample_data_reg[14]  ( .D(n633), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[14]) );
  DFFSR \sample_data_reg[15]  ( .D(n632), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[15]) );
  DFFSR \f0_coefficient_reg[0]  ( .D(n1326), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f0_coefficient[0]) );
  DFFSR \f0_coefficient_reg[1]  ( .D(n631), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f0_coefficient[1]) );
  DFFSR \f0_coefficient_reg[2]  ( .D(n630), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f0_coefficient[2]) );
  DFFSR \f0_coefficient_reg[3]  ( .D(n629), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f0_coefficient[3]) );
  DFFSR \f0_coefficient_reg[4]  ( .D(n628), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f0_coefficient[4]) );
  DFFSR \f0_coefficient_reg[5]  ( .D(n627), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f0_coefficient[5]) );
  DFFSR \f0_coefficient_reg[7]  ( .D(n625), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f0_coefficient[7]) );
  DFFSR \f0_coefficient_reg[6]  ( .D(n626), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f0_coefficient[6]) );
  DFFSR \f0_coefficient_reg[15]  ( .D(n617), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f0_coefficient[15]) );
  DFFSR \f0_coefficient_reg[14]  ( .D(n618), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f0_coefficient[14]) );
  DFFSR \f0_coefficient_reg[13]  ( .D(n619), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f0_coefficient[13]) );
  DFFSR \f0_coefficient_reg[12]  ( .D(n620), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f0_coefficient[12]) );
  DFFSR \f0_coefficient_reg[11]  ( .D(n621), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f0_coefficient[11]) );
  DFFSR \f0_coefficient_reg[10]  ( .D(n622), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f0_coefficient[10]) );
  DFFSR \f0_coefficient_reg[9]  ( .D(n623), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f0_coefficient[9]) );
  DFFSR \f0_coefficient_reg[8]  ( .D(n624), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f0_coefficient[8]) );
  DFFSR \f1_coefficient_reg[8]  ( .D(n615), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f1_coefficient[8]) );
  DFFSR \f1_coefficient_reg[9]  ( .D(n614), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f1_coefficient[9]) );
  DFFSR \f1_coefficient_reg[10]  ( .D(n613), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f1_coefficient[10]) );
  DFFSR \f1_coefficient_reg[11]  ( .D(n612), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f1_coefficient[11]) );
  DFFSR \f1_coefficient_reg[12]  ( .D(n611), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f1_coefficient[12]) );
  DFFSR \f1_coefficient_reg[13]  ( .D(n610), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f1_coefficient[13]) );
  DFFSR \f1_coefficient_reg[14]  ( .D(n609), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f1_coefficient[14]) );
  DFFSR \f1_coefficient_reg[15]  ( .D(n608), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f1_coefficient[15]) );
  DFFSR \f3_coefficient_reg[9]  ( .D(n653), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f3_coefficient[9]) );
  DFFSR \hrdata_reg[9]  ( .D(n598), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        hrdata[9]) );
  DFFSR \f3_coefficient_reg[8]  ( .D(n654), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f3_coefficient[8]) );
  DFFSR \hrdata_reg[8]  ( .D(n599), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        hrdata[8]) );
  DFFSR \f3_coefficient_reg[10]  ( .D(n652), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f3_coefficient[10]) );
  DFFSR \hrdata_reg[10]  ( .D(n597), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        hrdata[10]) );
  DFFSR \f3_coefficient_reg[11]  ( .D(n651), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f3_coefficient[11]) );
  DFFSR \hrdata_reg[11]  ( .D(n596), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        hrdata[11]) );
  DFFSR \f3_coefficient_reg[12]  ( .D(n650), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f3_coefficient[12]) );
  DFFSR \hrdata_reg[12]  ( .D(n595), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        hrdata[12]) );
  DFFSR \f3_coefficient_reg[13]  ( .D(n649), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f3_coefficient[13]) );
  DFFSR \hrdata_reg[13]  ( .D(n594), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        hrdata[13]) );
  DFFSR \f3_coefficient_reg[14]  ( .D(n648), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f3_coefficient[14]) );
  DFFSR \hrdata_reg[14]  ( .D(n593), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        hrdata[14]) );
  DFFSR \f3_coefficient_reg[15]  ( .D(n647), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f3_coefficient[15]) );
  DFFSR \hrdata_reg[15]  ( .D(n592), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        hrdata[15]) );
  DFFSR \f3_coefficient_reg[0]  ( .D(n655), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f3_coefficient[0]) );
  DFFSR \hrdata_reg[0]  ( .D(n607), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        hrdata[0]) );
  DFFSR \f3_coefficient_reg[1]  ( .D(n1324), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f3_coefficient[1]) );
  DFFSR \hrdata_reg[1]  ( .D(n606), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        hrdata[1]) );
  DFFSR \f3_coefficient_reg[2]  ( .D(n1321), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f3_coefficient[2]) );
  DFFSR \hrdata_reg[2]  ( .D(n605), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        hrdata[2]) );
  DFFSR \f3_coefficient_reg[3]  ( .D(n1318), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f3_coefficient[3]) );
  DFFSR \hrdata_reg[3]  ( .D(n604), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        hrdata[3]) );
  DFFSR \f3_coefficient_reg[4]  ( .D(n1315), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f3_coefficient[4]) );
  DFFSR \hrdata_reg[4]  ( .D(n603), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        hrdata[4]) );
  DFFSR \f3_coefficient_reg[5]  ( .D(n1312), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f3_coefficient[5]) );
  DFFSR \hrdata_reg[5]  ( .D(n602), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        hrdata[5]) );
  DFFSR \f3_coefficient_reg[6]  ( .D(n1309), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f3_coefficient[6]) );
  DFFSR \hrdata_reg[6]  ( .D(n601), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        hrdata[6]) );
  DFFSR \f3_coefficient_reg[7]  ( .D(n1306), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(f3_coefficient[7]) );
  DFFSR \hrdata_reg[7]  ( .D(n600), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        hrdata[7]) );
  AND2X2 U813 ( .A(n795), .B(n878), .Y(n869) );
  AND2X2 U814 ( .A(coefficient_num[1]), .B(n1302), .Y(n1268) );
  AND2X2 U815 ( .A(n794), .B(haddr[3]), .Y(n866) );
  AND2X2 U816 ( .A(n795), .B(haddr[3]), .Y(n867) );
  AND2X2 U817 ( .A(coefficient_num[0]), .B(coefficient_num[1]), .Y(n1269) );
  BUFX2 U818 ( .A(n871), .Y(n789) );
  INVX2 U819 ( .A(n1244), .Y(n1099) );
  AND2X2 U820 ( .A(n794), .B(n878), .Y(n868) );
  BUFX2 U821 ( .A(n1270), .Y(n790) );
  BUFX2 U822 ( .A(n870), .Y(n791) );
  INVX2 U823 ( .A(n1243), .Y(n1098) );
  BUFX2 U824 ( .A(n1271), .Y(n792) );
  BUFX2 U825 ( .A(n873), .Y(n793) );
  NAND2X1 U826 ( .A(haddr[1]), .B(haddr[2]), .Y(n796) );
  NOR2X1 U827 ( .A(n796), .B(haddr[3]), .Y(n870) );
  NOR3X1 U828 ( .A(n878), .B(n796), .C(n1164), .Y(n873) );
  AOI22X1 U829 ( .A(f0_coefficient[0]), .B(n791), .C(hrdata[0]), .D(n793), .Y(
        n806) );
  NOR2X1 U830 ( .A(n1165), .B(haddr[2]), .Y(n794) );
  NAND2X1 U831 ( .A(n877), .B(n1165), .Y(n835) );
  NOR2X1 U832 ( .A(n835), .B(n878), .Y(n871) );
  AOI22X1 U833 ( .A(f2_coefficient[0]), .B(n866), .C(f1_coefficient[0]), .D(
        n789), .Y(n805) );
  NOR2X1 U834 ( .A(n877), .B(haddr[1]), .Y(n795) );
  AOI22X1 U835 ( .A(fir_out[0]), .B(n868), .C(f3_coefficient[0]), .D(n867), 
        .Y(n803) );
  AOI22X1 U836 ( .A(N492), .B(n1164), .C(modwait), .D(haddr[0]), .Y(n800) );
  OR2X1 U837 ( .A(n835), .B(haddr[3]), .Y(n799) );
  NOR2X1 U838 ( .A(haddr[0]), .B(n796), .Y(n797) );
  NAND3X1 U839 ( .A(new_coefficient_set), .B(haddr[3]), .C(n797), .Y(n798) );
  OAI21X1 U840 ( .A(n800), .B(n799), .C(n798), .Y(n801) );
  AOI21X1 U841 ( .A(sample_data[0]), .B(n869), .C(n801), .Y(n802) );
  AND2X1 U842 ( .A(n803), .B(n802), .Y(n804) );
  NAND3X1 U843 ( .A(n806), .B(n805), .C(n804), .Y(N493) );
  AOI22X1 U844 ( .A(f3_coefficient[1]), .B(n867), .C(f2_coefficient[1]), .D(
        n866), .Y(n810) );
  AOI22X1 U845 ( .A(sample_data[1]), .B(n869), .C(fir_out[1]), .D(n868), .Y(
        n809) );
  AOI22X1 U846 ( .A(f1_coefficient[1]), .B(n789), .C(f0_coefficient[1]), .D(
        n791), .Y(n807) );
  AOI21X1 U847 ( .A(hrdata[1]), .B(n793), .C(n892), .Y(n808) );
  NAND3X1 U848 ( .A(n810), .B(n809), .C(n808), .Y(N494) );
  AOI22X1 U849 ( .A(f3_coefficient[2]), .B(n867), .C(f2_coefficient[2]), .D(
        n866), .Y(n814) );
  AOI22X1 U850 ( .A(sample_data[2]), .B(n869), .C(fir_out[2]), .D(n868), .Y(
        n813) );
  AOI22X1 U851 ( .A(f1_coefficient[2]), .B(n789), .C(f0_coefficient[2]), .D(
        n791), .Y(n811) );
  AOI21X1 U852 ( .A(hrdata[2]), .B(n793), .C(n891), .Y(n812) );
  NAND3X1 U853 ( .A(n814), .B(n813), .C(n812), .Y(N495) );
  AOI22X1 U854 ( .A(f3_coefficient[3]), .B(n867), .C(f2_coefficient[3]), .D(
        n866), .Y(n818) );
  AOI22X1 U855 ( .A(sample_data[3]), .B(n869), .C(fir_out[3]), .D(n868), .Y(
        n817) );
  AOI22X1 U856 ( .A(f1_coefficient[3]), .B(n789), .C(f0_coefficient[3]), .D(
        n791), .Y(n815) );
  AOI21X1 U857 ( .A(hrdata[3]), .B(n793), .C(n890), .Y(n816) );
  NAND3X1 U858 ( .A(n818), .B(n817), .C(n816), .Y(N496) );
  AOI22X1 U859 ( .A(f3_coefficient[4]), .B(n867), .C(f2_coefficient[4]), .D(
        n866), .Y(n822) );
  AOI22X1 U860 ( .A(sample_data[4]), .B(n869), .C(fir_out[4]), .D(n868), .Y(
        n821) );
  AOI22X1 U861 ( .A(f1_coefficient[4]), .B(n789), .C(f0_coefficient[4]), .D(
        n791), .Y(n819) );
  AOI21X1 U862 ( .A(hrdata[4]), .B(n793), .C(n889), .Y(n820) );
  NAND3X1 U863 ( .A(n822), .B(n821), .C(n820), .Y(N497) );
  AOI22X1 U864 ( .A(f3_coefficient[5]), .B(n867), .C(f2_coefficient[5]), .D(
        n866), .Y(n826) );
  AOI22X1 U865 ( .A(sample_data[5]), .B(n869), .C(fir_out[5]), .D(n868), .Y(
        n825) );
  AOI22X1 U866 ( .A(f1_coefficient[5]), .B(n789), .C(f0_coefficient[5]), .D(
        n791), .Y(n823) );
  AOI21X1 U867 ( .A(hrdata[5]), .B(n793), .C(n888), .Y(n824) );
  NAND3X1 U868 ( .A(n826), .B(n825), .C(n824), .Y(N498) );
  AOI22X1 U869 ( .A(f3_coefficient[6]), .B(n867), .C(f2_coefficient[6]), .D(
        n866), .Y(n830) );
  AOI22X1 U870 ( .A(sample_data[6]), .B(n869), .C(fir_out[6]), .D(n868), .Y(
        n829) );
  AOI22X1 U871 ( .A(f1_coefficient[6]), .B(n789), .C(f0_coefficient[6]), .D(
        n791), .Y(n827) );
  AOI21X1 U872 ( .A(hrdata[6]), .B(n793), .C(n887), .Y(n828) );
  NAND3X1 U873 ( .A(n830), .B(n829), .C(n828), .Y(N499) );
  AOI22X1 U874 ( .A(f3_coefficient[7]), .B(n867), .C(f2_coefficient[7]), .D(
        n866), .Y(n834) );
  AOI22X1 U875 ( .A(sample_data[7]), .B(n869), .C(fir_out[7]), .D(n868), .Y(
        n833) );
  AOI22X1 U876 ( .A(f1_coefficient[7]), .B(n789), .C(f0_coefficient[7]), .D(
        n791), .Y(n831) );
  AOI21X1 U877 ( .A(hrdata[7]), .B(n793), .C(n886), .Y(n832) );
  NAND3X1 U878 ( .A(n834), .B(n833), .C(n832), .Y(N500) );
  AOI22X1 U879 ( .A(f0_coefficient[8]), .B(n791), .C(hrdata[8]), .D(n793), .Y(
        n841) );
  AOI22X1 U880 ( .A(f2_coefficient[8]), .B(n866), .C(f1_coefficient[8]), .D(
        n789), .Y(n840) );
  AOI22X1 U881 ( .A(fir_out[8]), .B(n868), .C(f3_coefficient[8]), .D(n867), 
        .Y(n838) );
  NOR2X1 U882 ( .A(haddr[3]), .B(n835), .Y(n836) );
  AOI22X1 U883 ( .A(n836), .B(err), .C(sample_data[8]), .D(n869), .Y(n837) );
  AND2X1 U884 ( .A(n838), .B(n837), .Y(n839) );
  NAND3X1 U885 ( .A(n841), .B(n840), .C(n839), .Y(N501) );
  AOI22X1 U886 ( .A(f3_coefficient[9]), .B(n867), .C(f2_coefficient[9]), .D(
        n866), .Y(n845) );
  AOI22X1 U887 ( .A(sample_data[9]), .B(n869), .C(fir_out[9]), .D(n868), .Y(
        n844) );
  AOI22X1 U888 ( .A(f1_coefficient[9]), .B(n789), .C(f0_coefficient[9]), .D(
        n791), .Y(n842) );
  AOI21X1 U889 ( .A(hrdata[9]), .B(n793), .C(n885), .Y(n843) );
  NAND3X1 U890 ( .A(n845), .B(n844), .C(n843), .Y(N502) );
  AOI22X1 U891 ( .A(f3_coefficient[10]), .B(n867), .C(f2_coefficient[10]), .D(
        n866), .Y(n849) );
  AOI22X1 U892 ( .A(sample_data[10]), .B(n869), .C(fir_out[10]), .D(n868), .Y(
        n848) );
  AOI22X1 U893 ( .A(f1_coefficient[10]), .B(n789), .C(f0_coefficient[10]), .D(
        n791), .Y(n846) );
  AOI21X1 U894 ( .A(hrdata[10]), .B(n793), .C(n884), .Y(n847) );
  NAND3X1 U895 ( .A(n849), .B(n848), .C(n847), .Y(N503) );
  AOI22X1 U896 ( .A(f3_coefficient[11]), .B(n867), .C(f2_coefficient[11]), .D(
        n866), .Y(n853) );
  AOI22X1 U897 ( .A(sample_data[11]), .B(n869), .C(fir_out[11]), .D(n868), .Y(
        n852) );
  AOI22X1 U898 ( .A(f1_coefficient[11]), .B(n789), .C(f0_coefficient[11]), .D(
        n791), .Y(n850) );
  AOI21X1 U899 ( .A(hrdata[11]), .B(n793), .C(n883), .Y(n851) );
  NAND3X1 U900 ( .A(n853), .B(n852), .C(n851), .Y(N504) );
  AOI22X1 U901 ( .A(f3_coefficient[12]), .B(n867), .C(f2_coefficient[12]), .D(
        n866), .Y(n857) );
  AOI22X1 U902 ( .A(sample_data[12]), .B(n869), .C(fir_out[12]), .D(n868), .Y(
        n856) );
  AOI22X1 U903 ( .A(f1_coefficient[12]), .B(n789), .C(f0_coefficient[12]), .D(
        n791), .Y(n854) );
  AOI21X1 U904 ( .A(hrdata[12]), .B(n793), .C(n882), .Y(n855) );
  NAND3X1 U905 ( .A(n857), .B(n856), .C(n855), .Y(N505) );
  AOI22X1 U906 ( .A(f3_coefficient[13]), .B(n867), .C(f2_coefficient[13]), .D(
        n866), .Y(n861) );
  AOI22X1 U907 ( .A(sample_data[13]), .B(n869), .C(fir_out[13]), .D(n868), .Y(
        n860) );
  AOI22X1 U908 ( .A(f1_coefficient[13]), .B(n789), .C(f0_coefficient[13]), .D(
        n791), .Y(n858) );
  AOI21X1 U909 ( .A(hrdata[13]), .B(n793), .C(n881), .Y(n859) );
  NAND3X1 U910 ( .A(n861), .B(n860), .C(n859), .Y(N506) );
  AOI22X1 U911 ( .A(f3_coefficient[14]), .B(n867), .C(f2_coefficient[14]), .D(
        n866), .Y(n865) );
  AOI22X1 U912 ( .A(sample_data[14]), .B(n869), .C(fir_out[14]), .D(n868), .Y(
        n864) );
  AOI22X1 U913 ( .A(f1_coefficient[14]), .B(n789), .C(f0_coefficient[14]), .D(
        n791), .Y(n862) );
  AOI21X1 U914 ( .A(hrdata[14]), .B(n793), .C(n880), .Y(n863) );
  NAND3X1 U915 ( .A(n865), .B(n864), .C(n863), .Y(N507) );
  AOI22X1 U916 ( .A(f3_coefficient[15]), .B(n867), .C(f2_coefficient[15]), .D(
        n866), .Y(n876) );
  AOI22X1 U917 ( .A(sample_data[15]), .B(n869), .C(fir_out[15]), .D(n868), .Y(
        n875) );
  AOI22X1 U918 ( .A(f1_coefficient[15]), .B(n789), .C(f0_coefficient[15]), .D(
        n791), .Y(n872) );
  AOI21X1 U919 ( .A(hrdata[15]), .B(n793), .C(n879), .Y(n874) );
  NAND3X1 U920 ( .A(n876), .B(n875), .C(n874), .Y(N508) );
  INVX2 U921 ( .A(haddr[2]), .Y(n877) );
  INVX2 U922 ( .A(haddr[3]), .Y(n878) );
  INVX2 U923 ( .A(n872), .Y(n879) );
  INVX2 U924 ( .A(n862), .Y(n880) );
  INVX2 U925 ( .A(n858), .Y(n881) );
  INVX2 U926 ( .A(n854), .Y(n882) );
  INVX2 U927 ( .A(n850), .Y(n883) );
  INVX2 U928 ( .A(n846), .Y(n884) );
  INVX2 U929 ( .A(n842), .Y(n885) );
  INVX2 U930 ( .A(n831), .Y(n886) );
  INVX2 U931 ( .A(n827), .Y(n887) );
  INVX2 U932 ( .A(n823), .Y(n888) );
  INVX2 U933 ( .A(n819), .Y(n889) );
  INVX2 U934 ( .A(n815), .Y(n890) );
  INVX2 U935 ( .A(n811), .Y(n891) );
  INVX2 U936 ( .A(n807), .Y(n892) );
  OAI21X1 U937 ( .A(n893), .B(n894), .C(n895), .Y(n1304) );
  AOI22X1 U938 ( .A(hwdata[15]), .B(n896), .C(hwdata[7]), .D(n897), .Y(n895)
         );
  MUX2X1 U939 ( .B(n898), .A(n899), .S(n900), .Y(n1305) );
  INVX1 U940 ( .A(f1_coefficient[7]), .Y(n898) );
  MUX2X1 U941 ( .B(n899), .A(n901), .S(n902), .Y(n1306) );
  INVX1 U942 ( .A(f3_coefficient[7]), .Y(n901) );
  MUX2X1 U943 ( .B(n903), .A(n899), .S(n904), .Y(n1307) );
  MUX2X1 U944 ( .B(n905), .A(n906), .S(n900), .Y(n1308) );
  INVX1 U945 ( .A(f1_coefficient[6]), .Y(n905) );
  MUX2X1 U946 ( .B(n906), .A(n907), .S(n902), .Y(n1309) );
  INVX1 U947 ( .A(f3_coefficient[6]), .Y(n907) );
  MUX2X1 U948 ( .B(n908), .A(n906), .S(n904), .Y(n1310) );
  MUX2X1 U949 ( .B(n909), .A(n910), .S(n900), .Y(n1311) );
  INVX1 U950 ( .A(f1_coefficient[5]), .Y(n909) );
  MUX2X1 U951 ( .B(n910), .A(n911), .S(n902), .Y(n1312) );
  INVX1 U952 ( .A(f3_coefficient[5]), .Y(n911) );
  MUX2X1 U953 ( .B(n912), .A(n910), .S(n904), .Y(n1313) );
  MUX2X1 U954 ( .B(n913), .A(n914), .S(n900), .Y(n1314) );
  INVX1 U955 ( .A(f1_coefficient[4]), .Y(n913) );
  MUX2X1 U956 ( .B(n914), .A(n915), .S(n902), .Y(n1315) );
  INVX1 U957 ( .A(f3_coefficient[4]), .Y(n915) );
  MUX2X1 U958 ( .B(n916), .A(n914), .S(n904), .Y(n1316) );
  MUX2X1 U959 ( .B(n917), .A(n918), .S(n900), .Y(n1317) );
  INVX1 U960 ( .A(f1_coefficient[3]), .Y(n917) );
  MUX2X1 U961 ( .B(n918), .A(n919), .S(n902), .Y(n1318) );
  INVX1 U962 ( .A(f3_coefficient[3]), .Y(n919) );
  MUX2X1 U963 ( .B(n920), .A(n918), .S(n904), .Y(n1319) );
  MUX2X1 U964 ( .B(n921), .A(n922), .S(n900), .Y(n1320) );
  INVX1 U965 ( .A(f1_coefficient[2]), .Y(n921) );
  MUX2X1 U966 ( .B(n922), .A(n923), .S(n902), .Y(n1321) );
  INVX1 U967 ( .A(f3_coefficient[2]), .Y(n923) );
  MUX2X1 U968 ( .B(n924), .A(n922), .S(n904), .Y(n1322) );
  MUX2X1 U969 ( .B(n925), .A(n926), .S(n900), .Y(n1323) );
  INVX1 U970 ( .A(f1_coefficient[1]), .Y(n925) );
  MUX2X1 U971 ( .B(n926), .A(n927), .S(n902), .Y(n1324) );
  INVX1 U972 ( .A(f3_coefficient[1]), .Y(n927) );
  MUX2X1 U973 ( .B(n928), .A(n926), .S(n904), .Y(n1325) );
  MUX2X1 U974 ( .B(n929), .A(n930), .S(n931), .Y(n1326) );
  INVX1 U975 ( .A(f0_coefficient[0]), .Y(n929) );
  MUX2X1 U976 ( .B(n932), .A(n930), .S(n933), .Y(n1327) );
  MUX2X1 U977 ( .B(n934), .A(n930), .S(n935), .Y(n1328) );
  NOR2X1 U978 ( .A(n936), .B(n937), .Y(n935) );
  NAND2X1 U979 ( .A(next_haddr[1]), .B(next_haddr[3]), .Y(n937) );
  NAND3X1 U980 ( .A(next_haddr[2]), .B(n938), .C(n939), .Y(n936) );
  INVX1 U981 ( .A(new_coefficient_set), .Y(n934) );
  MUX2X1 U982 ( .B(n940), .A(n930), .S(n904), .Y(n663) );
  OAI21X1 U983 ( .A(n941), .B(n942), .C(n943), .Y(n904) );
  NAND2X1 U984 ( .A(n939), .B(n944), .Y(n942) );
  INVX1 U985 ( .A(f2_coefficient[0]), .Y(n940) );
  OAI21X1 U986 ( .A(n893), .B(n945), .C(n946), .Y(n662) );
  AOI22X1 U987 ( .A(hwdata[8]), .B(n896), .C(hwdata[0]), .D(n897), .Y(n946) );
  INVX1 U988 ( .A(f2_coefficient[8]), .Y(n945) );
  OAI21X1 U989 ( .A(n893), .B(n947), .C(n948), .Y(n661) );
  AOI22X1 U990 ( .A(hwdata[9]), .B(n896), .C(hwdata[1]), .D(n897), .Y(n948) );
  OAI21X1 U991 ( .A(n893), .B(n949), .C(n950), .Y(n660) );
  AOI22X1 U992 ( .A(hwdata[10]), .B(n896), .C(hwdata[2]), .D(n897), .Y(n950)
         );
  OAI21X1 U993 ( .A(n893), .B(n951), .C(n952), .Y(n659) );
  AOI22X1 U994 ( .A(hwdata[11]), .B(n896), .C(hwdata[3]), .D(n897), .Y(n952)
         );
  OAI21X1 U995 ( .A(n893), .B(n953), .C(n954), .Y(n658) );
  AOI22X1 U996 ( .A(hwdata[12]), .B(n896), .C(hwdata[4]), .D(n897), .Y(n954)
         );
  OAI21X1 U997 ( .A(n893), .B(n955), .C(n956), .Y(n657) );
  AOI22X1 U998 ( .A(hwdata[13]), .B(n896), .C(hwdata[5]), .D(n897), .Y(n956)
         );
  OAI21X1 U999 ( .A(n893), .B(n957), .C(n958), .Y(n656) );
  AOI22X1 U1000 ( .A(hwdata[14]), .B(n896), .C(hwdata[6]), .D(n897), .Y(n958)
         );
  AND2X1 U1001 ( .A(n959), .B(n960), .Y(n897) );
  INVX1 U1002 ( .A(n943), .Y(n896) );
  OAI21X1 U1003 ( .A(n961), .B(n962), .C(n943), .Y(n893) );
  NAND2X1 U1004 ( .A(n963), .B(n944), .Y(n943) );
  OAI21X1 U1005 ( .A(n941), .B(n964), .C(n962), .Y(n944) );
  INVX1 U1006 ( .A(n959), .Y(n962) );
  NOR2X1 U1007 ( .A(n965), .B(n964), .Y(n959) );
  MUX2X1 U1008 ( .B(n930), .A(n966), .S(n902), .Y(n655) );
  OAI21X1 U1009 ( .A(n967), .B(n968), .C(n939), .Y(n902) );
  NOR2X1 U1010 ( .A(next_haddr[0]), .B(n969), .Y(n968) );
  OAI21X1 U1011 ( .A(n930), .B(n970), .C(n971), .Y(n654) );
  AOI22X1 U1012 ( .A(f3_coefficient[8]), .B(n972), .C(n973), .D(hwdata[8]), 
        .Y(n971) );
  OAI21X1 U1013 ( .A(n926), .B(n970), .C(n974), .Y(n653) );
  AOI22X1 U1014 ( .A(f3_coefficient[9]), .B(n972), .C(n973), .D(hwdata[9]), 
        .Y(n974) );
  OAI21X1 U1015 ( .A(n922), .B(n970), .C(n975), .Y(n652) );
  AOI22X1 U1016 ( .A(f3_coefficient[10]), .B(n972), .C(n973), .D(hwdata[10]), 
        .Y(n975) );
  OAI21X1 U1017 ( .A(n918), .B(n970), .C(n976), .Y(n651) );
  AOI22X1 U1018 ( .A(f3_coefficient[11]), .B(n972), .C(n973), .D(hwdata[11]), 
        .Y(n976) );
  OAI21X1 U1019 ( .A(n914), .B(n970), .C(n977), .Y(n650) );
  AOI22X1 U1020 ( .A(f3_coefficient[12]), .B(n972), .C(n973), .D(hwdata[12]), 
        .Y(n977) );
  OAI21X1 U1021 ( .A(n910), .B(n970), .C(n978), .Y(n649) );
  AOI22X1 U1022 ( .A(f3_coefficient[13]), .B(n972), .C(n973), .D(hwdata[13]), 
        .Y(n978) );
  OAI21X1 U1023 ( .A(n906), .B(n970), .C(n979), .Y(n648) );
  AOI22X1 U1024 ( .A(f3_coefficient[14]), .B(n972), .C(n973), .D(hwdata[14]), 
        .Y(n979) );
  OAI21X1 U1025 ( .A(n899), .B(n970), .C(n980), .Y(n647) );
  AOI22X1 U1026 ( .A(f3_coefficient[15]), .B(n972), .C(n973), .D(hwdata[15]), 
        .Y(n980) );
  AND2X1 U1027 ( .A(n967), .B(n939), .Y(n973) );
  NOR2X1 U1028 ( .A(n969), .B(n981), .Y(n967) );
  OR2X1 U1029 ( .A(n969), .B(n982), .Y(n972) );
  OAI21X1 U1030 ( .A(next_hsize), .B(n983), .C(n939), .Y(n982) );
  NAND2X1 U1031 ( .A(n983), .B(n960), .Y(n970) );
  NOR2X1 U1032 ( .A(n969), .B(n938), .Y(n983) );
  NAND3X1 U1033 ( .A(next_haddr[2]), .B(n964), .C(next_haddr[3]), .Y(n969) );
  MUX2X1 U1034 ( .B(n984), .A(n926), .S(n933), .Y(n646) );
  INVX1 U1035 ( .A(sample_data[1]), .Y(n984) );
  MUX2X1 U1036 ( .B(n985), .A(n922), .S(n933), .Y(n645) );
  INVX1 U1037 ( .A(sample_data[2]), .Y(n985) );
  MUX2X1 U1038 ( .B(n986), .A(n918), .S(n933), .Y(n644) );
  INVX1 U1039 ( .A(sample_data[3]), .Y(n986) );
  MUX2X1 U1040 ( .B(n987), .A(n914), .S(n933), .Y(n643) );
  INVX1 U1041 ( .A(sample_data[4]), .Y(n987) );
  MUX2X1 U1042 ( .B(n988), .A(n910), .S(n933), .Y(n642) );
  INVX1 U1043 ( .A(sample_data[5]), .Y(n988) );
  MUX2X1 U1044 ( .B(n989), .A(n906), .S(n933), .Y(n641) );
  INVX1 U1045 ( .A(sample_data[6]), .Y(n989) );
  MUX2X1 U1046 ( .B(n990), .A(n899), .S(n933), .Y(n640) );
  OAI21X1 U1047 ( .A(n991), .B(n992), .C(n993), .Y(n933) );
  NAND2X1 U1048 ( .A(n939), .B(n938), .Y(n992) );
  INVX1 U1049 ( .A(sample_data[7]), .Y(n990) );
  OAI21X1 U1050 ( .A(n994), .B(n995), .C(n996), .Y(n639) );
  AOI22X1 U1051 ( .A(n997), .B(hwdata[8]), .C(n998), .D(hwdata[0]), .Y(n996)
         );
  INVX1 U1052 ( .A(sample_data[8]), .Y(n995) );
  OAI21X1 U1053 ( .A(n994), .B(n999), .C(n1000), .Y(n638) );
  AOI22X1 U1054 ( .A(n997), .B(hwdata[9]), .C(n998), .D(hwdata[1]), .Y(n1000)
         );
  INVX1 U1055 ( .A(sample_data[9]), .Y(n999) );
  OAI21X1 U1056 ( .A(n994), .B(n1001), .C(n1002), .Y(n637) );
  AOI22X1 U1057 ( .A(n997), .B(hwdata[10]), .C(n998), .D(hwdata[2]), .Y(n1002)
         );
  INVX1 U1058 ( .A(sample_data[10]), .Y(n1001) );
  OAI21X1 U1059 ( .A(n994), .B(n1003), .C(n1004), .Y(n636) );
  AOI22X1 U1060 ( .A(n997), .B(hwdata[11]), .C(n998), .D(hwdata[3]), .Y(n1004)
         );
  INVX1 U1061 ( .A(sample_data[11]), .Y(n1003) );
  OAI21X1 U1062 ( .A(n994), .B(n1005), .C(n1006), .Y(n635) );
  AOI22X1 U1063 ( .A(n997), .B(hwdata[12]), .C(n998), .D(hwdata[4]), .Y(n1006)
         );
  INVX1 U1064 ( .A(sample_data[12]), .Y(n1005) );
  OAI21X1 U1065 ( .A(n994), .B(n1007), .C(n1008), .Y(n634) );
  AOI22X1 U1066 ( .A(n997), .B(hwdata[13]), .C(n998), .D(hwdata[5]), .Y(n1008)
         );
  INVX1 U1067 ( .A(sample_data[13]), .Y(n1007) );
  OAI21X1 U1068 ( .A(n994), .B(n1009), .C(n1010), .Y(n633) );
  AOI22X1 U1069 ( .A(n997), .B(hwdata[14]), .C(n998), .D(hwdata[6]), .Y(n1010)
         );
  INVX1 U1070 ( .A(sample_data[14]), .Y(n1009) );
  OAI21X1 U1071 ( .A(n994), .B(n1011), .C(n1012), .Y(n632) );
  AOI22X1 U1072 ( .A(n997), .B(hwdata[15]), .C(n998), .D(hwdata[7]), .Y(n1012)
         );
  AND2X1 U1073 ( .A(n1013), .B(n960), .Y(n998) );
  INVX1 U1074 ( .A(sample_data[15]), .Y(n1011) );
  OAI21X1 U1075 ( .A(n961), .B(n1014), .C(n993), .Y(n994) );
  INVX1 U1076 ( .A(n997), .Y(n993) );
  NOR2X1 U1077 ( .A(n1015), .B(n991), .Y(n997) );
  INVX1 U1078 ( .A(n1013), .Y(n1014) );
  NOR2X1 U1079 ( .A(n1016), .B(next_haddr[1]), .Y(n1013) );
  MUX2X1 U1080 ( .B(n1017), .A(n926), .S(n931), .Y(n631) );
  INVX1 U1081 ( .A(hwdata[1]), .Y(n926) );
  INVX1 U1082 ( .A(f0_coefficient[1]), .Y(n1017) );
  MUX2X1 U1083 ( .B(n1018), .A(n922), .S(n931), .Y(n630) );
  INVX1 U1084 ( .A(hwdata[2]), .Y(n922) );
  INVX1 U1085 ( .A(f0_coefficient[2]), .Y(n1018) );
  MUX2X1 U1086 ( .B(n1019), .A(n918), .S(n931), .Y(n629) );
  INVX1 U1087 ( .A(hwdata[3]), .Y(n918) );
  INVX1 U1088 ( .A(f0_coefficient[3]), .Y(n1019) );
  MUX2X1 U1089 ( .B(n1020), .A(n914), .S(n931), .Y(n628) );
  INVX1 U1090 ( .A(hwdata[4]), .Y(n914) );
  INVX1 U1091 ( .A(f0_coefficient[4]), .Y(n1020) );
  MUX2X1 U1092 ( .B(n1021), .A(n910), .S(n931), .Y(n627) );
  INVX1 U1093 ( .A(hwdata[5]), .Y(n910) );
  INVX1 U1094 ( .A(f0_coefficient[5]), .Y(n1021) );
  MUX2X1 U1095 ( .B(n1022), .A(n906), .S(n931), .Y(n626) );
  INVX1 U1096 ( .A(hwdata[6]), .Y(n906) );
  INVX1 U1097 ( .A(f0_coefficient[6]), .Y(n1022) );
  MUX2X1 U1098 ( .B(n1023), .A(n899), .S(n931), .Y(n625) );
  AND2X1 U1099 ( .A(n939), .B(n1024), .Y(n931) );
  OAI21X1 U1100 ( .A(n1025), .B(n981), .C(n1026), .Y(n1024) );
  INVX1 U1101 ( .A(next_hsize), .Y(n981) );
  INVX1 U1102 ( .A(hwdata[7]), .Y(n899) );
  INVX1 U1103 ( .A(f0_coefficient[7]), .Y(n1023) );
  OAI21X1 U1104 ( .A(n1027), .B(n1028), .C(n1029), .Y(n624) );
  AOI22X1 U1105 ( .A(n1030), .B(hwdata[8]), .C(n1031), .D(hwdata[0]), .Y(n1029) );
  INVX1 U1106 ( .A(f0_coefficient[8]), .Y(n1028) );
  OAI21X1 U1107 ( .A(n1027), .B(n1032), .C(n1033), .Y(n623) );
  AOI22X1 U1108 ( .A(n1030), .B(hwdata[9]), .C(n1031), .D(hwdata[1]), .Y(n1033) );
  INVX1 U1109 ( .A(f0_coefficient[9]), .Y(n1032) );
  OAI21X1 U1110 ( .A(n1027), .B(n1034), .C(n1035), .Y(n622) );
  AOI22X1 U1111 ( .A(n1030), .B(hwdata[10]), .C(n1031), .D(hwdata[2]), .Y(
        n1035) );
  INVX1 U1112 ( .A(f0_coefficient[10]), .Y(n1034) );
  OAI21X1 U1113 ( .A(n1027), .B(n1036), .C(n1037), .Y(n621) );
  AOI22X1 U1114 ( .A(n1030), .B(hwdata[11]), .C(n1031), .D(hwdata[3]), .Y(
        n1037) );
  INVX1 U1115 ( .A(f0_coefficient[11]), .Y(n1036) );
  OAI21X1 U1116 ( .A(n1027), .B(n1038), .C(n1039), .Y(n620) );
  AOI22X1 U1117 ( .A(n1030), .B(hwdata[12]), .C(n1031), .D(hwdata[4]), .Y(
        n1039) );
  INVX1 U1118 ( .A(f0_coefficient[12]), .Y(n1038) );
  OAI21X1 U1119 ( .A(n1027), .B(n1040), .C(n1041), .Y(n619) );
  AOI22X1 U1120 ( .A(n1030), .B(hwdata[13]), .C(n1031), .D(hwdata[5]), .Y(
        n1041) );
  INVX1 U1121 ( .A(f0_coefficient[13]), .Y(n1040) );
  OAI21X1 U1122 ( .A(n1027), .B(n1042), .C(n1043), .Y(n618) );
  AOI22X1 U1123 ( .A(n1030), .B(hwdata[14]), .C(n1031), .D(hwdata[6]), .Y(
        n1043) );
  INVX1 U1124 ( .A(f0_coefficient[14]), .Y(n1042) );
  OAI21X1 U1125 ( .A(n1027), .B(n1044), .C(n1045), .Y(n617) );
  AOI22X1 U1126 ( .A(n1030), .B(hwdata[15]), .C(n1031), .D(hwdata[7]), .Y(
        n1045) );
  AND2X1 U1127 ( .A(n1046), .B(n960), .Y(n1031) );
  INVX1 U1128 ( .A(f0_coefficient[15]), .Y(n1044) );
  OAI21X1 U1129 ( .A(n961), .B(n1047), .C(n1048), .Y(n1027) );
  INVX1 U1130 ( .A(n1030), .Y(n1048) );
  NOR2X1 U1131 ( .A(n1015), .B(n1025), .Y(n1030) );
  AND2X1 U1132 ( .A(n1047), .B(n1026), .Y(n1025) );
  NAND3X1 U1133 ( .A(next_haddr[1]), .B(next_haddr[2]), .C(n1049), .Y(n1026)
         );
  NOR2X1 U1134 ( .A(next_haddr[3]), .B(next_haddr[0]), .Y(n1049) );
  INVX1 U1135 ( .A(n1046), .Y(n1047) );
  NOR2X1 U1136 ( .A(n1016), .B(n964), .Y(n1046) );
  NAND3X1 U1137 ( .A(next_haddr[2]), .B(n1050), .C(next_haddr[0]), .Y(n1016)
         );
  MUX2X1 U1138 ( .B(n1051), .A(n930), .S(n900), .Y(n616) );
  OAI21X1 U1139 ( .A(n941), .B(n1052), .C(n1053), .Y(n900) );
  NAND2X1 U1140 ( .A(n939), .B(n1054), .Y(n1052) );
  INVX1 U1141 ( .A(hwdata[0]), .Y(n930) );
  INVX1 U1142 ( .A(f1_coefficient[0]), .Y(n1051) );
  OAI21X1 U1143 ( .A(n1055), .B(n1056), .C(n1057), .Y(n615) );
  AOI22X1 U1144 ( .A(n1058), .B(hwdata[8]), .C(n1059), .D(hwdata[0]), .Y(n1057) );
  INVX1 U1145 ( .A(f1_coefficient[8]), .Y(n1056) );
  OAI21X1 U1146 ( .A(n1055), .B(n1060), .C(n1061), .Y(n614) );
  AOI22X1 U1147 ( .A(n1058), .B(hwdata[9]), .C(n1059), .D(hwdata[1]), .Y(n1061) );
  INVX1 U1148 ( .A(f1_coefficient[9]), .Y(n1060) );
  OAI21X1 U1149 ( .A(n1055), .B(n1062), .C(n1063), .Y(n613) );
  AOI22X1 U1150 ( .A(n1058), .B(hwdata[10]), .C(n1059), .D(hwdata[2]), .Y(
        n1063) );
  INVX1 U1151 ( .A(f1_coefficient[10]), .Y(n1062) );
  OAI21X1 U1152 ( .A(n1055), .B(n1064), .C(n1065), .Y(n612) );
  AOI22X1 U1153 ( .A(n1058), .B(hwdata[11]), .C(n1059), .D(hwdata[3]), .Y(
        n1065) );
  INVX1 U1154 ( .A(f1_coefficient[11]), .Y(n1064) );
  OAI21X1 U1155 ( .A(n1055), .B(n1066), .C(n1067), .Y(n611) );
  AOI22X1 U1156 ( .A(n1058), .B(hwdata[12]), .C(n1059), .D(hwdata[4]), .Y(
        n1067) );
  INVX1 U1157 ( .A(f1_coefficient[12]), .Y(n1066) );
  OAI21X1 U1158 ( .A(n1055), .B(n1068), .C(n1069), .Y(n610) );
  AOI22X1 U1159 ( .A(n1058), .B(hwdata[13]), .C(n1059), .D(hwdata[5]), .Y(
        n1069) );
  INVX1 U1160 ( .A(f1_coefficient[13]), .Y(n1068) );
  OAI21X1 U1161 ( .A(n1055), .B(n1070), .C(n1071), .Y(n609) );
  AOI22X1 U1162 ( .A(n1058), .B(hwdata[14]), .C(n1059), .D(hwdata[6]), .Y(
        n1071) );
  INVX1 U1163 ( .A(f1_coefficient[14]), .Y(n1070) );
  OAI21X1 U1164 ( .A(n1055), .B(n1072), .C(n1073), .Y(n608) );
  AOI22X1 U1165 ( .A(n1058), .B(hwdata[15]), .C(n1059), .D(hwdata[7]), .Y(
        n1073) );
  AND2X1 U1166 ( .A(n1074), .B(n960), .Y(n1059) );
  NOR2X1 U1167 ( .A(n961), .B(next_hsize), .Y(n960) );
  INVX1 U1168 ( .A(n1053), .Y(n1058) );
  INVX1 U1169 ( .A(f1_coefficient[15]), .Y(n1072) );
  OAI21X1 U1170 ( .A(n961), .B(n1075), .C(n1053), .Y(n1055) );
  NAND2X1 U1171 ( .A(n963), .B(n1054), .Y(n1053) );
  OAI21X1 U1172 ( .A(next_haddr[1]), .B(n941), .C(n1075), .Y(n1054) );
  NAND3X1 U1173 ( .A(n938), .B(n1076), .C(next_haddr[3]), .Y(n941) );
  INVX1 U1174 ( .A(next_haddr[0]), .Y(n938) );
  INVX1 U1175 ( .A(n1015), .Y(n963) );
  NAND2X1 U1176 ( .A(next_hsize), .B(n939), .Y(n1015) );
  INVX1 U1177 ( .A(n961), .Y(n939) );
  INVX1 U1178 ( .A(n1074), .Y(n1075) );
  NOR2X1 U1179 ( .A(n965), .B(next_haddr[1]), .Y(n1074) );
  NAND3X1 U1180 ( .A(next_haddr[3]), .B(n1076), .C(next_haddr[0]), .Y(n965) );
  INVX1 U1181 ( .A(next_haddr[2]), .Y(n1076) );
  NAND2X1 U1182 ( .A(n1077), .B(n1078), .Y(n607) );
  AOI22X1 U1183 ( .A(n1079), .B(n1080), .C(N493), .D(n1081), .Y(n1078) );
  NAND3X1 U1184 ( .A(n1082), .B(n1083), .C(n1084), .Y(n1080) );
  NOR2X1 U1185 ( .A(n1085), .B(n1086), .Y(n1084) );
  OAI21X1 U1186 ( .A(n932), .B(n1087), .C(n1088), .Y(n1086) );
  NAND2X1 U1187 ( .A(fir_out[0]), .B(n1089), .Y(n1088) );
  INVX1 U1188 ( .A(sample_data[0]), .Y(n932) );
  OAI21X1 U1189 ( .A(n966), .B(n1090), .C(n1091), .Y(n1085) );
  AOI22X1 U1190 ( .A(hrdata[0]), .B(n1092), .C(n1093), .D(N492), .Y(n1091) );
  INVX1 U1191 ( .A(f3_coefficient[0]), .Y(n966) );
  AOI22X1 U1192 ( .A(n1094), .B(f0_coefficient[0]), .C(n1095), .D(
        f1_coefficient[0]), .Y(n1083) );
  AOI22X1 U1193 ( .A(n1096), .B(f2_coefficient[0]), .C(n1097), .D(
        new_coefficient_set), .Y(n1082) );
  AOI22X1 U1194 ( .A(n1098), .B(hrdata[0]), .C(n1099), .D(hwdata[0]), .Y(n1077) );
  NAND3X1 U1195 ( .A(n1100), .B(n1101), .C(n1102), .Y(n606) );
  AOI22X1 U1196 ( .A(n1099), .B(hwdata[1]), .C(hrdata[1]), .D(n1098), .Y(n1102) );
  OAI21X1 U1197 ( .A(n1103), .B(n1104), .C(n1079), .Y(n1101) );
  OAI21X1 U1198 ( .A(n928), .B(n1105), .C(n1106), .Y(n1104) );
  AOI22X1 U1199 ( .A(n1094), .B(f0_coefficient[1]), .C(n1095), .D(
        f1_coefficient[1]), .Y(n1106) );
  INVX1 U1200 ( .A(f2_coefficient[1]), .Y(n928) );
  NAND2X1 U1201 ( .A(n1107), .B(n1108), .Y(n1103) );
  AOI22X1 U1202 ( .A(hrdata[1]), .B(n1092), .C(n1109), .D(f3_coefficient[1]), 
        .Y(n1108) );
  AOI22X1 U1203 ( .A(n1110), .B(sample_data[1]), .C(fir_out[1]), .D(n1089), 
        .Y(n1107) );
  NAND2X1 U1204 ( .A(N494), .B(n1081), .Y(n1100) );
  NAND3X1 U1205 ( .A(n1111), .B(n1112), .C(n1113), .Y(n605) );
  AOI22X1 U1206 ( .A(n1099), .B(hwdata[2]), .C(hrdata[2]), .D(n1098), .Y(n1113) );
  OAI21X1 U1207 ( .A(n1114), .B(n1115), .C(n1079), .Y(n1112) );
  OAI21X1 U1208 ( .A(n924), .B(n1105), .C(n1116), .Y(n1115) );
  AOI22X1 U1209 ( .A(n1094), .B(f0_coefficient[2]), .C(n1095), .D(
        f1_coefficient[2]), .Y(n1116) );
  INVX1 U1210 ( .A(f2_coefficient[2]), .Y(n924) );
  NAND2X1 U1211 ( .A(n1117), .B(n1118), .Y(n1114) );
  AOI22X1 U1212 ( .A(hrdata[2]), .B(n1092), .C(n1109), .D(f3_coefficient[2]), 
        .Y(n1118) );
  AOI22X1 U1213 ( .A(n1110), .B(sample_data[2]), .C(fir_out[2]), .D(n1089), 
        .Y(n1117) );
  NAND2X1 U1214 ( .A(N495), .B(n1081), .Y(n1111) );
  NAND3X1 U1215 ( .A(n1119), .B(n1120), .C(n1121), .Y(n604) );
  AOI22X1 U1216 ( .A(n1099), .B(hwdata[3]), .C(hrdata[3]), .D(n1098), .Y(n1121) );
  OAI21X1 U1217 ( .A(n1122), .B(n1123), .C(n1079), .Y(n1120) );
  OAI21X1 U1218 ( .A(n920), .B(n1105), .C(n1124), .Y(n1123) );
  AOI22X1 U1219 ( .A(n1094), .B(f0_coefficient[3]), .C(n1095), .D(
        f1_coefficient[3]), .Y(n1124) );
  INVX1 U1220 ( .A(f2_coefficient[3]), .Y(n920) );
  NAND2X1 U1221 ( .A(n1125), .B(n1126), .Y(n1122) );
  AOI22X1 U1222 ( .A(hrdata[3]), .B(n1092), .C(n1109), .D(f3_coefficient[3]), 
        .Y(n1126) );
  AOI22X1 U1223 ( .A(n1110), .B(sample_data[3]), .C(fir_out[3]), .D(n1089), 
        .Y(n1125) );
  NAND2X1 U1224 ( .A(N496), .B(n1081), .Y(n1119) );
  NAND3X1 U1225 ( .A(n1127), .B(n1128), .C(n1129), .Y(n603) );
  AOI22X1 U1226 ( .A(n1099), .B(hwdata[4]), .C(hrdata[4]), .D(n1098), .Y(n1129) );
  OAI21X1 U1227 ( .A(n1130), .B(n1131), .C(n1079), .Y(n1128) );
  OAI21X1 U1228 ( .A(n916), .B(n1105), .C(n1132), .Y(n1131) );
  AOI22X1 U1229 ( .A(n1094), .B(f0_coefficient[4]), .C(n1095), .D(
        f1_coefficient[4]), .Y(n1132) );
  INVX1 U1230 ( .A(f2_coefficient[4]), .Y(n916) );
  NAND2X1 U1231 ( .A(n1133), .B(n1134), .Y(n1130) );
  AOI22X1 U1232 ( .A(hrdata[4]), .B(n1092), .C(n1109), .D(f3_coefficient[4]), 
        .Y(n1134) );
  AOI22X1 U1233 ( .A(n1110), .B(sample_data[4]), .C(fir_out[4]), .D(n1089), 
        .Y(n1133) );
  NAND2X1 U1234 ( .A(N497), .B(n1081), .Y(n1127) );
  NAND3X1 U1235 ( .A(n1135), .B(n1136), .C(n1137), .Y(n602) );
  AOI22X1 U1236 ( .A(n1099), .B(hwdata[5]), .C(hrdata[5]), .D(n1098), .Y(n1137) );
  OAI21X1 U1237 ( .A(n1138), .B(n1139), .C(n1079), .Y(n1136) );
  OAI21X1 U1238 ( .A(n912), .B(n1105), .C(n1140), .Y(n1139) );
  AOI22X1 U1239 ( .A(n1094), .B(f0_coefficient[5]), .C(n1095), .D(
        f1_coefficient[5]), .Y(n1140) );
  INVX1 U1240 ( .A(f2_coefficient[5]), .Y(n912) );
  NAND2X1 U1241 ( .A(n1141), .B(n1142), .Y(n1138) );
  AOI22X1 U1242 ( .A(hrdata[5]), .B(n1092), .C(n1109), .D(f3_coefficient[5]), 
        .Y(n1142) );
  AOI22X1 U1243 ( .A(n1110), .B(sample_data[5]), .C(fir_out[5]), .D(n1089), 
        .Y(n1141) );
  NAND2X1 U1244 ( .A(N498), .B(n1081), .Y(n1135) );
  NAND3X1 U1245 ( .A(n1143), .B(n1144), .C(n1145), .Y(n601) );
  AOI22X1 U1246 ( .A(n1099), .B(hwdata[6]), .C(hrdata[6]), .D(n1098), .Y(n1145) );
  OAI21X1 U1247 ( .A(n1146), .B(n1147), .C(n1079), .Y(n1144) );
  OAI21X1 U1248 ( .A(n908), .B(n1105), .C(n1148), .Y(n1147) );
  AOI22X1 U1249 ( .A(n1094), .B(f0_coefficient[6]), .C(n1095), .D(
        f1_coefficient[6]), .Y(n1148) );
  INVX1 U1250 ( .A(f2_coefficient[6]), .Y(n908) );
  NAND2X1 U1251 ( .A(n1149), .B(n1150), .Y(n1146) );
  AOI22X1 U1252 ( .A(hrdata[6]), .B(n1092), .C(n1109), .D(f3_coefficient[6]), 
        .Y(n1150) );
  AOI22X1 U1253 ( .A(n1110), .B(sample_data[6]), .C(fir_out[6]), .D(n1089), 
        .Y(n1149) );
  NAND2X1 U1254 ( .A(N499), .B(n1081), .Y(n1143) );
  NAND3X1 U1255 ( .A(n1151), .B(n1152), .C(n1153), .Y(n600) );
  AOI22X1 U1256 ( .A(n1099), .B(hwdata[7]), .C(hrdata[7]), .D(n1098), .Y(n1153) );
  OAI21X1 U1257 ( .A(n1154), .B(n1155), .C(n1079), .Y(n1152) );
  OAI21X1 U1258 ( .A(n903), .B(n1105), .C(n1156), .Y(n1155) );
  AOI22X1 U1259 ( .A(n1094), .B(f0_coefficient[7]), .C(n1095), .D(
        f1_coefficient[7]), .Y(n1156) );
  INVX1 U1260 ( .A(f2_coefficient[7]), .Y(n903) );
  NAND2X1 U1261 ( .A(n1157), .B(n1158), .Y(n1154) );
  AOI22X1 U1262 ( .A(hrdata[7]), .B(n1092), .C(n1109), .D(f3_coefficient[7]), 
        .Y(n1158) );
  INVX1 U1263 ( .A(n1090), .Y(n1109) );
  NOR2X1 U1264 ( .A(n1159), .B(n1160), .Y(n1092) );
  NAND3X1 U1265 ( .A(n1090), .B(n1087), .C(n1161), .Y(n1160) );
  NOR2X1 U1266 ( .A(n1095), .B(n1094), .Y(n1161) );
  NOR2X1 U1267 ( .A(n1162), .B(haddr[0]), .Y(n1094) );
  INVX1 U1268 ( .A(n1163), .Y(n1095) );
  NAND3X1 U1269 ( .A(n1164), .B(n1165), .C(n1166), .Y(n1163) );
  NAND3X1 U1270 ( .A(haddr[3]), .B(n1164), .C(n1167), .Y(n1090) );
  NAND3X1 U1271 ( .A(n1168), .B(n1169), .C(n1170), .Y(n1159) );
  NOR2X1 U1272 ( .A(n1093), .B(n1096), .Y(n1170) );
  INVX1 U1273 ( .A(n1105), .Y(n1096) );
  NAND3X1 U1274 ( .A(haddr[1]), .B(n1164), .C(n1166), .Y(n1105) );
  INVX1 U1275 ( .A(n1171), .Y(n1093) );
  NAND3X1 U1276 ( .A(n1164), .B(n1165), .C(n1172), .Y(n1171) );
  INVX1 U1277 ( .A(n1097), .Y(n1169) );
  AOI22X1 U1278 ( .A(n1110), .B(sample_data[7]), .C(fir_out[7]), .D(n1089), 
        .Y(n1157) );
  INVX1 U1279 ( .A(n1168), .Y(n1089) );
  NAND3X1 U1280 ( .A(haddr[1]), .B(n1164), .C(n1172), .Y(n1168) );
  INVX1 U1281 ( .A(n1087), .Y(n1110) );
  NAND3X1 U1282 ( .A(n1164), .B(n878), .C(n1167), .Y(n1087) );
  NAND2X1 U1283 ( .A(N500), .B(n1081), .Y(n1151) );
  NAND3X1 U1284 ( .A(n1173), .B(n1174), .C(n1175), .Y(n599) );
  AOI22X1 U1285 ( .A(hrdata[8]), .B(n1098), .C(n1099), .D(hwdata[8]), .Y(n1175) );
  OAI21X1 U1286 ( .A(n1176), .B(n1177), .C(n1079), .Y(n1174) );
  NAND2X1 U1287 ( .A(n1178), .B(n1179), .Y(n1177) );
  AOI22X1 U1288 ( .A(fir_out[8]), .B(n1180), .C(n1181), .D(f0_coefficient[8]), 
        .Y(n1179) );
  AOI22X1 U1289 ( .A(n1182), .B(f1_coefficient[8]), .C(n1183), .D(
        f2_coefficient[8]), .Y(n1178) );
  INVX1 U1290 ( .A(n1184), .Y(n1183) );
  NAND2X1 U1291 ( .A(n1185), .B(n1186), .Y(n1176) );
  AOI22X1 U1292 ( .A(hrdata[8]), .B(n1187), .C(err), .D(n1188), .Y(n1186) );
  INVX1 U1293 ( .A(n1189), .Y(n1188) );
  AOI22X1 U1294 ( .A(n1190), .B(f3_coefficient[8]), .C(n1191), .D(
        sample_data[8]), .Y(n1185) );
  NAND2X1 U1295 ( .A(N501), .B(n1081), .Y(n1173) );
  NAND3X1 U1296 ( .A(n1192), .B(n1193), .C(n1194), .Y(n598) );
  AOI22X1 U1297 ( .A(n1099), .B(hwdata[9]), .C(hrdata[9]), .D(n1098), .Y(n1194) );
  OAI21X1 U1298 ( .A(n1195), .B(n1196), .C(n1079), .Y(n1193) );
  OAI21X1 U1299 ( .A(n947), .B(n1184), .C(n1197), .Y(n1196) );
  AOI22X1 U1300 ( .A(n1181), .B(f0_coefficient[9]), .C(n1182), .D(
        f1_coefficient[9]), .Y(n1197) );
  INVX1 U1301 ( .A(f2_coefficient[9]), .Y(n947) );
  NAND2X1 U1302 ( .A(n1198), .B(n1199), .Y(n1195) );
  AOI22X1 U1303 ( .A(hrdata[9]), .B(n1187), .C(n1190), .D(f3_coefficient[9]), 
        .Y(n1199) );
  AOI22X1 U1304 ( .A(n1191), .B(sample_data[9]), .C(fir_out[9]), .D(n1180), 
        .Y(n1198) );
  NAND2X1 U1305 ( .A(N502), .B(n1081), .Y(n1192) );
  NAND3X1 U1306 ( .A(n1200), .B(n1201), .C(n1202), .Y(n597) );
  AOI22X1 U1307 ( .A(n1099), .B(hwdata[10]), .C(hrdata[10]), .D(n1098), .Y(
        n1202) );
  OAI21X1 U1308 ( .A(n1203), .B(n1204), .C(n1079), .Y(n1201) );
  OAI21X1 U1309 ( .A(n949), .B(n1184), .C(n1205), .Y(n1204) );
  AOI22X1 U1310 ( .A(n1181), .B(f0_coefficient[10]), .C(n1182), .D(
        f1_coefficient[10]), .Y(n1205) );
  INVX1 U1311 ( .A(f2_coefficient[10]), .Y(n949) );
  NAND2X1 U1312 ( .A(n1206), .B(n1207), .Y(n1203) );
  AOI22X1 U1313 ( .A(hrdata[10]), .B(n1187), .C(n1190), .D(f3_coefficient[10]), 
        .Y(n1207) );
  AOI22X1 U1314 ( .A(n1191), .B(sample_data[10]), .C(fir_out[10]), .D(n1180), 
        .Y(n1206) );
  NAND2X1 U1315 ( .A(N503), .B(n1081), .Y(n1200) );
  NAND3X1 U1316 ( .A(n1208), .B(n1209), .C(n1210), .Y(n596) );
  AOI22X1 U1317 ( .A(n1099), .B(hwdata[11]), .C(hrdata[11]), .D(n1098), .Y(
        n1210) );
  OAI21X1 U1318 ( .A(n1211), .B(n1212), .C(n1079), .Y(n1209) );
  OAI21X1 U1319 ( .A(n951), .B(n1184), .C(n1213), .Y(n1212) );
  AOI22X1 U1320 ( .A(n1181), .B(f0_coefficient[11]), .C(n1182), .D(
        f1_coefficient[11]), .Y(n1213) );
  INVX1 U1321 ( .A(f2_coefficient[11]), .Y(n951) );
  NAND2X1 U1322 ( .A(n1214), .B(n1215), .Y(n1211) );
  AOI22X1 U1323 ( .A(hrdata[11]), .B(n1187), .C(n1190), .D(f3_coefficient[11]), 
        .Y(n1215) );
  AOI22X1 U1324 ( .A(n1191), .B(sample_data[11]), .C(fir_out[11]), .D(n1180), 
        .Y(n1214) );
  NAND2X1 U1325 ( .A(N504), .B(n1081), .Y(n1208) );
  NAND3X1 U1326 ( .A(n1216), .B(n1217), .C(n1218), .Y(n595) );
  AOI22X1 U1327 ( .A(n1099), .B(hwdata[12]), .C(hrdata[12]), .D(n1098), .Y(
        n1218) );
  OAI21X1 U1328 ( .A(n1219), .B(n1220), .C(n1079), .Y(n1217) );
  OAI21X1 U1329 ( .A(n953), .B(n1184), .C(n1221), .Y(n1220) );
  AOI22X1 U1330 ( .A(n1181), .B(f0_coefficient[12]), .C(n1182), .D(
        f1_coefficient[12]), .Y(n1221) );
  INVX1 U1331 ( .A(f2_coefficient[12]), .Y(n953) );
  NAND2X1 U1332 ( .A(n1222), .B(n1223), .Y(n1219) );
  AOI22X1 U1333 ( .A(hrdata[12]), .B(n1187), .C(n1190), .D(f3_coefficient[12]), 
        .Y(n1223) );
  AOI22X1 U1334 ( .A(n1191), .B(sample_data[12]), .C(fir_out[12]), .D(n1180), 
        .Y(n1222) );
  NAND2X1 U1335 ( .A(N505), .B(n1081), .Y(n1216) );
  NAND3X1 U1336 ( .A(n1224), .B(n1225), .C(n1226), .Y(n594) );
  AOI22X1 U1337 ( .A(n1099), .B(hwdata[13]), .C(hrdata[13]), .D(n1098), .Y(
        n1226) );
  OAI21X1 U1338 ( .A(n1227), .B(n1228), .C(n1079), .Y(n1225) );
  OAI21X1 U1339 ( .A(n955), .B(n1184), .C(n1229), .Y(n1228) );
  AOI22X1 U1340 ( .A(n1181), .B(f0_coefficient[13]), .C(n1182), .D(
        f1_coefficient[13]), .Y(n1229) );
  INVX1 U1341 ( .A(f2_coefficient[13]), .Y(n955) );
  NAND2X1 U1342 ( .A(n1230), .B(n1231), .Y(n1227) );
  AOI22X1 U1343 ( .A(hrdata[13]), .B(n1187), .C(n1190), .D(f3_coefficient[13]), 
        .Y(n1231) );
  AOI22X1 U1344 ( .A(n1191), .B(sample_data[13]), .C(fir_out[13]), .D(n1180), 
        .Y(n1230) );
  NAND2X1 U1345 ( .A(N506), .B(n1081), .Y(n1224) );
  NAND3X1 U1346 ( .A(n1232), .B(n1233), .C(n1234), .Y(n593) );
  AOI22X1 U1347 ( .A(n1099), .B(hwdata[14]), .C(hrdata[14]), .D(n1098), .Y(
        n1234) );
  OAI21X1 U1348 ( .A(n1235), .B(n1236), .C(n1079), .Y(n1233) );
  OAI21X1 U1349 ( .A(n957), .B(n1184), .C(n1237), .Y(n1236) );
  AOI22X1 U1350 ( .A(n1181), .B(f0_coefficient[14]), .C(n1182), .D(
        f1_coefficient[14]), .Y(n1237) );
  INVX1 U1351 ( .A(f2_coefficient[14]), .Y(n957) );
  NAND2X1 U1352 ( .A(n1238), .B(n1239), .Y(n1235) );
  AOI22X1 U1353 ( .A(hrdata[14]), .B(n1187), .C(n1190), .D(f3_coefficient[14]), 
        .Y(n1239) );
  AOI22X1 U1354 ( .A(n1191), .B(sample_data[14]), .C(fir_out[14]), .D(n1180), 
        .Y(n1238) );
  NAND2X1 U1355 ( .A(N507), .B(n1081), .Y(n1232) );
  NAND3X1 U1356 ( .A(n1240), .B(n1241), .C(n1242), .Y(n592) );
  AOI22X1 U1357 ( .A(n1099), .B(hwdata[15]), .C(hrdata[15]), .D(n1098), .Y(
        n1242) );
  NAND3X1 U1358 ( .A(next_hwrite), .B(n1245), .C(hsel), .Y(n1244) );
  OAI21X1 U1359 ( .A(n1246), .B(n1247), .C(n1079), .Y(n1241) );
  NOR2X1 U1360 ( .A(n1248), .B(hsize), .Y(n1079) );
  OAI21X1 U1361 ( .A(n894), .B(n1184), .C(n1249), .Y(n1247) );
  AOI22X1 U1362 ( .A(n1181), .B(f0_coefficient[15]), .C(n1182), .D(
        f1_coefficient[15]), .Y(n1249) );
  INVX1 U1363 ( .A(n1250), .Y(n1182) );
  INVX1 U1364 ( .A(f2_coefficient[15]), .Y(n894) );
  NAND2X1 U1365 ( .A(n1251), .B(n1252), .Y(n1246) );
  AOI22X1 U1366 ( .A(hrdata[15]), .B(n1187), .C(n1190), .D(f3_coefficient[15]), 
        .Y(n1252) );
  NOR2X1 U1367 ( .A(n1253), .B(n1254), .Y(n1187) );
  NAND3X1 U1368 ( .A(n1255), .B(n1250), .C(n1256), .Y(n1254) );
  NOR2X1 U1369 ( .A(n1191), .B(n1190), .Y(n1256) );
  INVX1 U1370 ( .A(n1257), .Y(n1190) );
  NAND3X1 U1371 ( .A(n1167), .B(haddr[3]), .C(haddr[0]), .Y(n1257) );
  NAND3X1 U1372 ( .A(n1166), .B(n1165), .C(haddr[0]), .Y(n1250) );
  INVX1 U1373 ( .A(n1181), .Y(n1255) );
  NOR2X1 U1374 ( .A(n1164), .B(n1162), .Y(n1181) );
  NAND3X1 U1375 ( .A(haddr[1]), .B(n878), .C(haddr[2]), .Y(n1162) );
  NAND3X1 U1376 ( .A(n1184), .B(n1189), .C(n1258), .Y(n1253) );
  NOR2X1 U1377 ( .A(n1180), .B(n1097), .Y(n1258) );
  NOR2X1 U1378 ( .A(n1259), .B(haddr[0]), .Y(n1097) );
  NAND3X1 U1379 ( .A(n1172), .B(n1165), .C(haddr[0]), .Y(n1189) );
  NAND3X1 U1380 ( .A(n1166), .B(haddr[1]), .C(haddr[0]), .Y(n1184) );
  NOR2X1 U1381 ( .A(n878), .B(haddr[2]), .Y(n1166) );
  AOI22X1 U1382 ( .A(n1191), .B(sample_data[15]), .C(fir_out[15]), .D(n1180), 
        .Y(n1251) );
  INVX1 U1383 ( .A(n1260), .Y(n1180) );
  NAND3X1 U1384 ( .A(n1172), .B(haddr[1]), .C(haddr[0]), .Y(n1260) );
  INVX1 U1385 ( .A(n1261), .Y(n1191) );
  NAND3X1 U1386 ( .A(n1167), .B(n878), .C(haddr[0]), .Y(n1261) );
  AND2X1 U1387 ( .A(haddr[2]), .B(n1165), .Y(n1167) );
  INVX1 U1388 ( .A(haddr[1]), .Y(n1165) );
  NAND2X1 U1389 ( .A(N508), .B(n1081), .Y(n1240) );
  NOR2X1 U1390 ( .A(n1262), .B(n1248), .Y(n1081) );
  NAND2X1 U1391 ( .A(n1263), .B(n1243), .Y(n1248) );
  NAND2X1 U1392 ( .A(hwrite), .B(n1263), .Y(n1243) );
  AOI21X1 U1393 ( .A(n1245), .B(next_hwrite), .C(n1264), .Y(n1263) );
  INVX1 U1394 ( .A(hsel), .Y(n1264) );
  INVX1 U1395 ( .A(hsize), .Y(n1262) );
  OAI22X1 U1396 ( .A(n1245), .B(n1265), .C(n1259), .D(n1164), .Y(hresp) );
  INVX1 U1397 ( .A(haddr[0]), .Y(n1164) );
  NAND3X1 U1398 ( .A(haddr[2]), .B(haddr[1]), .C(haddr[3]), .Y(n1259) );
  INVX1 U1399 ( .A(n1172), .Y(n1265) );
  NOR2X1 U1400 ( .A(haddr[2]), .B(haddr[3]), .Y(n1172) );
  INVX1 U1401 ( .A(hwrite), .Y(n1245) );
  NAND2X1 U1402 ( .A(n1266), .B(n1267), .Y(fir_coefficient[9]) );
  AOI22X1 U1403 ( .A(n1268), .B(f2_coefficient[9]), .C(n1269), .D(
        f3_coefficient[9]), .Y(n1267) );
  AOI22X1 U1404 ( .A(n790), .B(f0_coefficient[9]), .C(n792), .D(
        f1_coefficient[9]), .Y(n1266) );
  NAND2X1 U1405 ( .A(n1272), .B(n1273), .Y(fir_coefficient[8]) );
  AOI22X1 U1406 ( .A(n1268), .B(f2_coefficient[8]), .C(n1269), .D(
        f3_coefficient[8]), .Y(n1273) );
  AOI22X1 U1407 ( .A(n790), .B(f0_coefficient[8]), .C(n792), .D(
        f1_coefficient[8]), .Y(n1272) );
  NAND2X1 U1408 ( .A(n1274), .B(n1275), .Y(fir_coefficient[7]) );
  AOI22X1 U1409 ( .A(n1268), .B(f2_coefficient[7]), .C(n1269), .D(
        f3_coefficient[7]), .Y(n1275) );
  AOI22X1 U1410 ( .A(n790), .B(f0_coefficient[7]), .C(n792), .D(
        f1_coefficient[7]), .Y(n1274) );
  NAND2X1 U1411 ( .A(n1276), .B(n1277), .Y(fir_coefficient[6]) );
  AOI22X1 U1412 ( .A(n1268), .B(f2_coefficient[6]), .C(n1269), .D(
        f3_coefficient[6]), .Y(n1277) );
  AOI22X1 U1413 ( .A(n790), .B(f0_coefficient[6]), .C(n792), .D(
        f1_coefficient[6]), .Y(n1276) );
  NAND2X1 U1414 ( .A(n1278), .B(n1279), .Y(fir_coefficient[5]) );
  AOI22X1 U1415 ( .A(n1268), .B(f2_coefficient[5]), .C(n1269), .D(
        f3_coefficient[5]), .Y(n1279) );
  AOI22X1 U1416 ( .A(n790), .B(f0_coefficient[5]), .C(n792), .D(
        f1_coefficient[5]), .Y(n1278) );
  NAND2X1 U1417 ( .A(n1280), .B(n1281), .Y(fir_coefficient[4]) );
  AOI22X1 U1418 ( .A(n1268), .B(f2_coefficient[4]), .C(n1269), .D(
        f3_coefficient[4]), .Y(n1281) );
  AOI22X1 U1419 ( .A(n790), .B(f0_coefficient[4]), .C(n792), .D(
        f1_coefficient[4]), .Y(n1280) );
  NAND2X1 U1420 ( .A(n1282), .B(n1283), .Y(fir_coefficient[3]) );
  AOI22X1 U1421 ( .A(n1268), .B(f2_coefficient[3]), .C(n1269), .D(
        f3_coefficient[3]), .Y(n1283) );
  AOI22X1 U1422 ( .A(n790), .B(f0_coefficient[3]), .C(n792), .D(
        f1_coefficient[3]), .Y(n1282) );
  NAND2X1 U1423 ( .A(n1284), .B(n1285), .Y(fir_coefficient[2]) );
  AOI22X1 U1424 ( .A(n1268), .B(f2_coefficient[2]), .C(n1269), .D(
        f3_coefficient[2]), .Y(n1285) );
  AOI22X1 U1425 ( .A(n790), .B(f0_coefficient[2]), .C(n792), .D(
        f1_coefficient[2]), .Y(n1284) );
  NAND2X1 U1426 ( .A(n1286), .B(n1287), .Y(fir_coefficient[1]) );
  AOI22X1 U1427 ( .A(n1268), .B(f2_coefficient[1]), .C(n1269), .D(
        f3_coefficient[1]), .Y(n1287) );
  AOI22X1 U1428 ( .A(n790), .B(f0_coefficient[1]), .C(n792), .D(
        f1_coefficient[1]), .Y(n1286) );
  NAND2X1 U1429 ( .A(n1288), .B(n1289), .Y(fir_coefficient[15]) );
  AOI22X1 U1430 ( .A(n1268), .B(f2_coefficient[15]), .C(n1269), .D(
        f3_coefficient[15]), .Y(n1289) );
  AOI22X1 U1431 ( .A(n790), .B(f0_coefficient[15]), .C(n792), .D(
        f1_coefficient[15]), .Y(n1288) );
  NAND2X1 U1432 ( .A(n1290), .B(n1291), .Y(fir_coefficient[14]) );
  AOI22X1 U1433 ( .A(n1268), .B(f2_coefficient[14]), .C(n1269), .D(
        f3_coefficient[14]), .Y(n1291) );
  AOI22X1 U1434 ( .A(n790), .B(f0_coefficient[14]), .C(n792), .D(
        f1_coefficient[14]), .Y(n1290) );
  NAND2X1 U1435 ( .A(n1292), .B(n1293), .Y(fir_coefficient[13]) );
  AOI22X1 U1436 ( .A(n1268), .B(f2_coefficient[13]), .C(n1269), .D(
        f3_coefficient[13]), .Y(n1293) );
  AOI22X1 U1437 ( .A(n790), .B(f0_coefficient[13]), .C(n792), .D(
        f1_coefficient[13]), .Y(n1292) );
  NAND2X1 U1438 ( .A(n1294), .B(n1295), .Y(fir_coefficient[12]) );
  AOI22X1 U1439 ( .A(n1268), .B(f2_coefficient[12]), .C(n1269), .D(
        f3_coefficient[12]), .Y(n1295) );
  AOI22X1 U1440 ( .A(n790), .B(f0_coefficient[12]), .C(n792), .D(
        f1_coefficient[12]), .Y(n1294) );
  NAND2X1 U1441 ( .A(n1296), .B(n1297), .Y(fir_coefficient[11]) );
  AOI22X1 U1442 ( .A(n1268), .B(f2_coefficient[11]), .C(n1269), .D(
        f3_coefficient[11]), .Y(n1297) );
  AOI22X1 U1443 ( .A(n790), .B(f0_coefficient[11]), .C(n792), .D(
        f1_coefficient[11]), .Y(n1296) );
  NAND2X1 U1444 ( .A(n1298), .B(n1299), .Y(fir_coefficient[10]) );
  AOI22X1 U1445 ( .A(n1268), .B(f2_coefficient[10]), .C(n1269), .D(
        f3_coefficient[10]), .Y(n1299) );
  AOI22X1 U1446 ( .A(n790), .B(f0_coefficient[10]), .C(n792), .D(
        f1_coefficient[10]), .Y(n1298) );
  NAND2X1 U1447 ( .A(n1300), .B(n1301), .Y(fir_coefficient[0]) );
  AOI22X1 U1448 ( .A(n1268), .B(f2_coefficient[0]), .C(n1269), .D(
        f3_coefficient[0]), .Y(n1301) );
  AOI22X1 U1449 ( .A(n790), .B(f0_coefficient[0]), .C(n792), .D(
        f1_coefficient[0]), .Y(n1300) );
  NOR2X1 U1450 ( .A(n1302), .B(coefficient_num[1]), .Y(n1271) );
  INVX1 U1451 ( .A(coefficient_num[0]), .Y(n1302) );
  NOR2X1 U1452 ( .A(coefficient_num[0]), .B(coefficient_num[1]), .Y(n1270) );
  OAI21X1 U1453 ( .A(n961), .B(n991), .C(n1303), .Y(next_data_ready) );
  INVX1 U1454 ( .A(next_next_data_ready), .Y(n1303) );
  NAND3X1 U1455 ( .A(n964), .B(n1050), .C(next_haddr[2]), .Y(n991) );
  INVX1 U1456 ( .A(next_haddr[3]), .Y(n1050) );
  INVX1 U1457 ( .A(next_haddr[1]), .Y(n964) );
  NAND2X1 U1458 ( .A(next_hwrite), .B(next_hsel), .Y(n961) );
  OR2X1 U1459 ( .A(modwait), .B(new_coefficient_set), .Y(N492) );
endmodule

