<?php
/* 解密版联系QQ：2337350403 - 官网：www.mfxw.cc */
 goto TbrF5; P31qU: if (!(!file_exists(SITEDIR . "\x69\156\163\x74\141\154\x6c\57" . $sqlFile) || !file_exists(SITEDIR . "\151\156\x73\164\141\154\x6c\57" . $configFile))) { goto Pp1KB; } echo "\347\274\xba\345\xb0\221\345\277\x85\350\xa6\201\347\x9a\x84\345\xae\x89\xe8\xa3\205\346\226\x87\xe4\273\266\xef\xbc\210{$sqlFile}\40\xe6\x88\226\40{$configFile}\357\xbc\211\x21"; exit; Pp1KB: $Title = "\x41\120\x49\346\224\xaf\xe4\xbb\x98\344\273\243\xe7\x90\x86\xe7\x89\x88\350\207\252\xe5\x8a\250\345\x8f\221\345\215\241\xe5\271\263\345\x8f\xb0\347\xb3\xbb\xe7\273\x9f\xe5\xae\211\xe8\xa3\x85\xe5\220\x91\345\xaf\xbc"; $Powered = "\x50\x6f\x77\x65\162\145\144\40\142\x79\40\347\210\xb1\345\x8f\221\xe8\x87\252\xe5\x8a\xa8\345\217\x91\xe5\215\xa1\xe5\271\xb3\xe5\x8f\260"; $steps = array("\61" => "\xe5\256\x89\xe8\243\205\xe8\256\270\xe5\217\xaf\xe5\215\x8f\350\256\xae", "\62" => "\xe8\277\220\xe8\xa1\214\xe7\x8e\xaf\xe5\242\x83\346\xa3\200\346\265\x8b", "\63" => "\345\256\211\xe8\243\x85\xe5\x8f\x82\346\x95\260\xe8\xae\xbe\347\xbd\256", "\64" => "\345\xae\x89\xe8\243\x85\xe8\xaf\246\347\xbb\x86\350\xbf\207\347\250\213", "\x35" => "\xe5\xae\211\xe8\xa3\x85\xe5\256\x8c\346\210\220"); $step = isset($_GET["\x73\164\145\160"]) ? $_GET["\163\164\x65\x70"] : 1; $scriptName = !empty($_SERVER["\x52\105\x51\x55\105\x53\124\137\x55\122\111"]) ? $scriptName = $_SERVER["\x52\x45\x51\125\105\123\x54\x5f\125\x52\x49"] : ($scriptName = $_SERVER["\120\110\x50\137\123\105\x4c\106"]); $rootpath = @preg_replace("\57\x5c\57\50\x49\x7c\x69\51\156\163\x74\x61\x6c\x6c\134\57\151\156\x64\145\170\x5c\x2e\160\150\x70\x28\x2e\52\x29\x24\57", '', $scriptName); goto ru_LF; yJATn: function sql_split($sql, $tablepre) { if (!($tablepre != "\x65\x79\137")) { goto oiyEI; } $sql = str_replace("\145\x79\x5f", $tablepre, $sql); oiyEI: $sql = preg_replace("\57\124\x59\120\105\75\50\111\x6e\156\x6f\104\x42\174\115\171\x49\x53\101\115\174\115\105\x4d\x4f\x52\131\51\x28\x20\x44\105\106\x41\x55\x4c\x54\40\x43\110\101\122\x53\105\124\x3d\x5b\x5e\73\x20\x5d\53\x29\77\57", "\105\x4e\107\x49\116\x45\75\x5c\61\x20\x44\x45\106\101\x55\114\x54\40\103\x48\x41\x52\x53\105\x54\75\165\164\146\x38", $sql); $sql = str_replace("\xd", "\12", $sql); $ret = array(); $num = 0; $queriesarray = explode("\x3b\xa", trim($sql)); unset($sql); foreach ($queriesarray as $query) { $ret[$num] = ''; $queries = explode("\12", trim($query)); $queries = array_filter($queries); foreach ($queries as $query) { $str1 = substr($query, 0, 1); if (!($str1 != "\x23" && $str1 != "\55")) { goto DFmKD; } $ret[$num] .= $query; DFmKD: BqFbg: } lErSK: $num++; AqoNt: } WHpSm: return $ret; } function _dir_path($path) { $path = str_replace("\134", "\57", $path); if (!(substr($path, -1) != "\57")) { goto QWiS1; } $path = $path . "\x2f"; QWiS1: return $path; } function get_client_ip() { goto rfNmn; oeVTn: $ip = $_SERVER["\x52\x45\115\117\x54\105\x5f\x41\x44\x44\x52"]; UprSH: $ip = false !== ip2long($ip) ? $ip : "\x30\56\60\56\60\56\60"; return $ip; goto R2201; s1ob_: $pos = array_search("\x75\156\x6b\156\x6f\167\x6e", $arr); if (!(false !== $pos)) { goto WXrdQ; } unset($arr[$pos]); WXrdQ: $ip = trim($arr[0]); goto UprSH; g85qc: $ip = $_SERVER["\x48\x54\124\x50\137\103\x4c\x49\x45\x4e\124\137\111\120"]; goto UprSH; MMiFx: goto oeVTn; rfNmn: static $ip = NULL; if (!($ip !== NULL)) { goto cX1a1; } return $ip; cX1a1: if (isset($_SERVER["\x48\x54\124\x50\x5f\x58\137\x46\117\122\x57\101\x52\104\105\x44\x5f\106\117\x52"])) { goto f0kEr; } if (isset($_SERVER["\110\x54\x54\120\x5f\x43\x4c\x49\105\116\x54\x5f\111\120"])) { goto g85qc; } if (isset($_SERVER["\x52\105\115\117\x54\x45\137\101\x44\x44\122"])) { goto MMiFx; } goto UprSH; f0kEr: $arr = explode("\x2c", $_SERVER["\110\124\124\x50\137\x58\137\106\117\x52\127\101\122\x44\x45\104\137\106\117\x52"]); goto s1ob_; R2201: } function get_server_ip() { return gethostbyname($_SERVER["\x53\x45\x52\126\105\122\x5f\116\x41\x4d\105"]); } function dir_create($path, $mode = 0777) { goto fk9ti; fk9ti: if (!is_dir($path)) { goto GzUck; } return TRUE; GzUck: $ftp_enable = 0; $path = dir_path($path); $temp = explode("\x2f", $path); $cur_dir = ''; $max = count($temp) - 1; $i = 0; hzkdf: goto Spntu; Vgod8: psIbO: return is_dir($path); goto pF0gT; Spntu: if (!($i < $max)) { goto psIbO; } $cur_dir .= $temp[$i] . "\57"; if (!@is_dir($cur_dir)) { goto CeLAy; } goto xWC3a; CeLAy: @mkdir($cur_dir, 0777, true); @chmod($cur_dir, 0777); xWC3a: $i++; goto hzkdf; goto Vgod8; pF0gT: } function dir_path($path) { $path = str_replace("\x5c", "\x2f", $path); if (!(substr($path, -1) != "\x2f")) { goto icpWA; } $path = $path . "\57"; icpWA: return $path; } function sp_password($pw, $pre) { $decor = md5($pre); $mi = md5($pw); return substr($decor, 0, 12) . $mi . substr($decor, -4, 4); } function sp_random_string($len = 8) { $chars = array("\141", "\x62", "\143", "\x64", "\145", "\146", "\147", "\x68", "\x69", "\152", "\x6b", "\154", "\x6d", "\x6e", "\157", "\160", "\161", "\162", "\163", "\x74", "\165", "\x76", "\x77", "\170", "\x79", "\x7a", "\101", "\102", "\x43", "\104", "\105", "\106", "\x47", "\110", "\x49", "\112", "\113", "\114", "\115", "\116", "\117", "\120", "\x51", "\x52", "\123", "\x54", "\125", "\x56", "\127", "\130", "\131", "\x5a", "\x30", "\61", "\x32", "\x33", "\64", "\65", "\66", "\67", "\x38", "\71"); $charsLen = count($chars) - 1; shuffle($chars); $output = ''; $i = 0; VTDC5: if (!($i < $len)) { goto b12CO; } $output .= $chars[mt_rand(0, $charsLen)]; oe0H5: $i++; goto VTDC5; b12CO: return $output; } goto xIUc3; ru_LF: $domain = empty($_SERVER["\110\x54\x54\120\x5f\110\117\x53\124"]) ? $_SERVER["\110\124\124\120\137\x48\x4f\123\x54"] : $_SERVER["\123\105\122\x56\x45\x52\x5f\116\x41\115\105"]; if (!((int) $_SERVER["\123\105\122\x56\x45\x52\x5f\x50\x4f\122\124"] != 80)) { goto fKCAr; } $domain .= "\x3a" . $_SERVER["\x53\x45\122\126\x45\x52\x5f\120\117\122\x54"]; fKCAr: $domain = $domain . $rootpath; switch ($step) { case "\x31": include_once "\x2e\x2f\x73\x68\x75\x79\x61\x6e\57\163\164\x65\160\61\x2e\x70\x68\160"; exit; case "\x32": goto uvpfb; bg0P3: $mbstring = "\x3c\151\x6d\147\x20\x73\x72\143\x3d\42\x69\155\x61\x67\145\x73\57\157\x6b\56\160\x6e\x67\42\76"; gb0vT: if (function_exists("\x63\165\162\x6c\137\x69\156\151\x74")) { goto dV4yX; } $curl = "\74\151\155\147\40\x73\x72\143\x3d\x22\151\155\141\x67\x65\163\x2f\x64\145\154\x2e\x70\x6e\x67\x22\76"; $err++; goto A62mI; dV4yX: $curl = "\74\151\x6d\147\40\163\x72\x63\x3d\42\x69\155\141\x67\145\163\x2f\157\153\x2e\x70\156\x67\x22\x3e"; A62mI: if (function_exists("\146\151\x6c\x65\x5f\x70\165\x74\137\x63\157\156\x74\x65\x6e\164\163")) { goto NYjn3; } goto TWKyb; H8c8E: $safe_mode = ini_get("\163\141\x66\x65\137\x6d\157\144\145") ? "\74\x69\x6d\147\x20\163\162\x63\x3d\x22\x69\155\x61\147\x65\x73\57\x64\145\154\x2e\x70\x6e\147\x22\x3e" : "\x3c\x69\155\147\x20\163\x72\143\x3d\42\x69\x6d\141\147\145\163\x2f\157\153\x2e\160\156\x67\42\x3e"; if (empty($tmp["\x47\x44\x20\x56\x65\x72\x73\x69\157\156"])) { goto boo3U; } $gd = "\74\151\155\x67\40\163\162\143\x3d\x22\151\x6d\x61\x67\x65\163\57\x6f\x6b\x2e\160\x6e\x67\x22\x3e"; goto F2S5f; boo3U: $gd = "\x3c\151\155\x67\x20\x73\162\143\75\42\x69\155\x61\x67\x65\x73\57\144\x65\154\x2e\x70\x6e\147\42\x3e"; $err++; F2S5f: if (function_exists("\155\x79\163\161\x6c\151\137\143\x6f\156\156\145\143\x74")) { goto aGldZ; } $mysql = "\74\151\155\x67\x20\x73\162\143\75\x22\x69\x6d\x61\147\x65\x73\x2f\144\x65\154\56\160\x6e\147\x22\x3e\x20\350\xaf\267\xe5\256\x89\xe8\243\205\x6d\171\x73\x71\x6c\151\346\211\251\xe5\261\x95"; goto U06P1; pIG2u: $err++; goto j1pNS; xwF83: $pdo_mysql = "\x3c\151\x6d\147\x20\163\x72\143\x3d\42\x69\155\141\x67\x65\x73\57\x6f\153\x2e\x70\156\x67\x22\x3e"; j1pNS: if (function_exists("\x6d\x62\x5f\163\164\162\154\x65\156")) { goto Ayy2g; } $mbstring = "\x3c\x69\x6d\x67\40\x73\x72\143\75\x22\151\155\x61\147\145\x73\x2f\x64\x65\154\56\160\x6e\147\x22\x3e"; $err++; goto gb0vT; Ayy2g: goto bg0P3; TWKyb: $file_put_contents = "\74\x69\155\147\x20\163\162\x63\x3d\x22\x69\x6d\x61\x67\145\x73\57\144\x65\x6c\x2e\x70\156\x67\42\x3e"; $err++; goto I_4yi; NYjn3: $file_put_contents = "\74\151\x6d\x67\40\163\162\x63\75\x22\x69\x6d\x61\147\x65\163\x2f\157\x6b\x2e\x70\156\147\42\x3e"; I_4yi: $folder = array("\x69\156\163\164\x61\x6c\154"); include_once "\56\57\163\x68\x75\x79\x61\x6e\57\x73\164\x65\x70\62\x2e\x70\150\160"; exit; goto OrtOO; NErL1: KiEbj: if (class_exists("\160\x64\x6f")) { goto ctEtM; } $pdo = "\74\x69\155\147\x20\163\162\x63\75\42\x69\155\141\x67\145\163\x2f\x64\x65\x6c\x2e\x70\x6e\147\42\x3e"; $err++; goto FyBcx; ctEtM: $pdo = "\x3c\x69\x6d\147\40\163\162\143\x3d\x22\151\155\x61\147\x65\163\57\x6f\153\56\x70\156\147\x22\x3e"; FyBcx: if (extension_loaded("\x70\144\x6f\x5f\155\171\x73\x71\x6c")) { goto xwF83; } $pdo_mysql = "\x3c\x69\155\x67\40\x73\162\x63\x3d\x22\151\155\x61\x67\x65\163\57\144\x65\x6c\x2e\x70\156\x67\42\x3e"; goto pIG2u; uvpfb: if (!(phpversion() < 7)) { goto e9YBO; } die("\346\x9c\254\xe7\263\xbb\xe7\xbb\237\351\234\200\350\246\x81\x50\110\120\67\56\60\56\60\344\xbb\xa5\344\270\x8a\40\x2b\40\x4d\131\123\121\x4c\40\x3e\75\40\x35\56\x35\347\x8e\257\xe5\xa2\203\xef\xbc\214\xe5\275\223\xe5\x89\x8d\120\x48\120\347\211\x88\xe6\234\xac\344\xb8\xba\xef\xbc\232" . phpversion()); e9YBO: $err = 0; $phpv = @phpversion(); if ($mini_php <= phpversion()) { goto bQuS9; } $phpvStr = "\x3c\x69\x6d\x67\40\163\162\x63\x3d\42\x69\155\141\147\x65\163\57\x64\x65\154\x2e\x70\156\x67\42\x3e\x20\xe5\275\x93\345\211\215\347\x89\210\xe6\x9c\xac\50" . phpversion() . "\51\344\xb8\215\346\x94\257\xe6\x8c\201"; $err++; goto UeJLN; bQuS9: goto Qsruc; Qsruc: $phpvStr = "\74\151\x6d\x67\x20\163\162\143\75\42\x69\155\141\147\x65\x73\x2f\x6f\x6b\x2e\x70\x6e\x67\42\76"; UeJLN: $os = PHP_OS; $tmp = function_exists("\x67\144\137\x69\x6e\146\157") ? gd_info() : array(); $server = $_SERVER["\123\105\x52\x56\x45\122\x5f\x53\x4f\106\124\127\101\x52\105"]; $host = empty($_SERVER["\123\105\x52\x56\105\x52\x5f\x41\104\x44\122"]) ? $_SERVER["\x53\x45\122\126\105\122\137\x48\x4f\123\x54"] : $_SERVER["\123\x45\x52\126\105\x52\x5f\101\x44\x44\x52"]; $name = $_SERVER["\x53\105\122\126\105\x52\137\x4e\x41\x4d\x45"]; $max_execution_time = ini_get("\x6d\x61\170\x5f\145\x78\x65\x63\165\164\x69\x6f\156\137\164\151\155\x65"); $allow_reference = ini_get("\141\154\x6c\x6f\x77\x5f\x63\x61\154\154\137\x74\151\x6d\145\x5f\x70\x61\163\163\137\162\x65\146\x65\162\145\x6e\x63\145") ? "\x3c\x69\155\x67\x20\163\162\143\x3d\42\x69\x6d\141\x67\x65\x73\x2f\x6f\153\56\160\x6e\147\42\76" : "\74\151\x6d\147\40\x73\x72\143\75\42\151\155\141\147\145\x73\x2f\x64\x65\x6c\56\x70\x6e\x67\x22\x3e"; $allow_url_fopen = ini_get("\x61\x6c\154\157\167\x5f\x75\162\x6c\x5f\146\157\160\145\x6e") ? "\x3c\151\155\147\x20\163\x72\x63\75\42\151\155\141\147\145\x73\57\157\x6b\x2e\160\x6e\x67\42\76" : "\x3c\x69\x6d\x67\x20\x73\162\143\x3d\42\x69\155\141\x67\145\x73\57\144\145\154\x2e\x70\x6e\x67\42\76"; goto H8c8E; U06P1: $err++; goto L06zR; aGldZ: $mysql = "\x3c\151\155\x67\40\x73\162\143\x3d\x22\x69\155\141\x67\145\x73\57\157\x6b\56\x70\156\x67\42\76"; L06zR: if (ini_get("\146\x69\x6c\145\137\x75\160\154\157\x61\x64\163")) { goto RhsIH; } $uploadSize = "\x3c\x69\155\x67\40\x73\162\x63\x3d\x22\x69\155\x61\x67\145\x73\x2f\x64\145\154\x2e\x70\x6e\x67\42\x3e\40\347\246\201\346\255\242\xe4\270\x8a\344\274\xa0"; goto KiEbj; RhsIH: $uploadSize = "\x3c\151\x6d\x67\40\163\162\x63\75\x22\x69\x6d\141\147\145\x73\x2f\x6f\153\56\x70\x6e\147\42\x3e"; goto NErL1; OrtOO: case "\x33": goto gcRe9; GbslB: goto MN39L; PEUKS: die(json_encode(array("\x65\162\162\x63\x6f\144\x65" => 0, "\144\x62\160\x77\x6d\163\x67" => "\74\163\160\x61\156\40\146\157\162\75\x27\144\142\x6e\x61\155\145\47\40\x67\145\156\x65\162\x61\x74\x65\144\x3d\x27\x74\x72\x75\145\x27\40\x63\x6c\x61\163\x73\x3d\x27\x74\x69\160\163\x5f\x65\x72\162\x6f\162\47\x3e\xe6\225\260\xe6\x8d\xae\345\272\x93\xe8\xbf\x9e\xe6\216\245\345\244\xb1\350\xb4\245\xef\274\x8c\350\xaf\xb7\351\x87\215\346\226\260\350\256\xbe\xe5\xae\232\74\x2f\163\x70\141\156\x3e"))); MN39L: d1zoF: include_once "\56\57\163\x68\165\x79\141\x6e\x2f\x73\164\145\160\x33\56\x70\150\x70"; exit; goto P7TLm; gcRe9: $dbName = trim($_POST["\144\x62\x4e\x61\155\145"]); $_POST["\144\x62\x70\157\162\164"] = $_POST["\144\x62\160\x6f\162\164"] ? $_POST["\144\x62\x70\x6f\x72\x74"] : "\x33\63\60\66"; if (!$_GET["\x74\x65\163\164\x64\142\x70\x77\x64"]) { goto d1zoF; } $dbHost = $_POST["\x64\142\110\x6f\x73\164"]; $conn = @mysqli_connect($dbHost, $_POST["\x64\142\x55\163\x65\x72"], $_POST["\x64\x62\120\167\x64"], NULL, $_POST["\x64\142\x70\157\x72\164"]); if (mysqli_connect_errno($conn)) { goto PEUKS; } if (empty($dbName)) { goto F1kZQ; } $result = mysqli_query($conn, "\x73\x65\x6c\x65\x63\x74\x20\143\157\165\156\164\x28\164\x61\142\x6c\x65\137\156\141\x6d\x65\x29\x20\x61\x73\40\143\40\146\162\157\x6d\40\151\x6e\x66\157\x72\155\141\x74\151\157\156\137\163\x63\150\x65\x6d\x61\x2e\140\124\101\102\x4c\105\x53\x60\40\167\150\x65\x72\x65\x20\164\x61\x62\x6c\x65\x5f\163\x63\150\145\155\141\75\x27{$dbName}\x27"); $result = $result->fetch_array(); if ($result["\143"] > 0) { goto irU3v; } goto zYcND; zYcND: $dbnamemsg = "\x3c\163\160\x61\156\40\x63\154\x61\163\x73\x3d\x27\147\162\145\x65\x6e\47\76\346\x95\260\346\x8d\xae\xe5\xba\223\344\xb8\215\xe5\xad\x98\xe5\x9c\xa8\xef\xbc\214\347\263\273\xe7\xbb\x9f\xe5\xb0\206\xe8\207\252\345\x8a\xa8\xe5\x88\233\xe5\273\xba\x3c\57\163\x70\141\x6e\x3e"; goto JfTbR; irU3v: $dbnamemsg = "\74\x73\x70\x61\156\40\x63\154\x61\x73\163\x3d\47\162\x65\144\x27\x3e\346\225\260\xe6\x8d\xae\345\xba\223\345\xb7\xb2\xe7\273\217\345\255\230\345\234\250\357\274\214\347\263\xbb\xe7\xbb\x9f\345\xb0\206\350\246\206\xe7\233\x96\346\225\260\xe6\x8d\256\345\272\x93\74\x2f\x73\160\141\x6e\x3e"; JfTbR: goto EnKRO; F1kZQ: die(json_encode(array("\145\162\162\143\157\x64\x65" => -2, "\x64\142\160\167\x6d\x73\147" => "\x3c\x73\x70\x61\x6e\x20\143\x6c\141\163\163\x3d\x27\147\x72\145\x65\x6e\47\76\xe4\xbf\xa1\346\201\257\346\xad\xa3\xe7\xa1\xae\74\57\163\160\141\x6e\x3e", "\x64\x62\156\141\155\145\x6d\x73\x67" => "\x3c\163\160\x61\156\40\143\154\141\x73\x73\x3d\x27\162\145\x64\x27\x3e\xe6\225\260\346\215\xae\xe5\272\223\xe4\270\x8d\350\x83\xbd\344\270\xba\xe7\251\xba\357\xbc\214\350\257\267\xe8\256\xbe\xe5\xae\x9a\x3c\57\163\160\141\x6e\x3e"))); EnKRO: die(json_encode(array("\x65\x72\162\143\157\x64\145" => 1, "\x64\142\x70\x77\155\x73\x67" => "\74\163\160\x61\156\40\143\x6c\141\x73\x73\75\x27\147\x72\x65\145\x6e\x27\x3e\xe4\xbf\xa1\346\201\xaf\xe6\255\xa3\xe7\xa1\256\x3c\57\163\160\141\x6e\76", "\144\142\156\x61\x6d\145\155\163\147" => $dbnamemsg))); goto GbslB; P7TLm: case "\64": goto QZHzF; DiYMi: $password = trim($_POST["\155\x61\156\141\147\145\x72\137\x70\167\144"]); $email = trim($_POST["\x6d\x61\156\141\x67\x65\162\137\145\x6d\141\151\x6c"]); if (!function_exists("\155\171\163\x71\154\151\x5f\x63\x6f\156\x6e\x65\143\164")) { $arr["\155\163\x67"] = "\350\257\xb7\xe5\xae\211\350\xa3\205\40\155\171\x73\161\154\151\x20\xe6\x89\xa9\345\xb1\225\x21"; echo json_encode($arr); exit; } $conn = @mysqli_connect($dbHost, $dbUser, $dbPwd, NULL, $_POST["\144\x62\160\157\162\x74"]); if (!mysqli_connect_errno($conn)) { goto b1fe5; } $arr["\155\163\x67"] = "\xe8\xbf\236\346\x8e\245\346\225\xb0\xe6\x8d\xae\345\xba\x93\xe5\244\xb1\xe8\264\245\41" . mysqli_connect_error($conn); echo json_encode($arr); exit; b1fe5: mysqli_set_charset($conn, "\165\164\x66\x38"); goto k0xMv; wrueC: $ip = empty($ip) ? "\x30\x2e\60\56\60\x2e\60" : $ip; $password = md5("\x21\x2a\x26\x5e\145\x79\157\x75\143\x6d\163\74\x3e\174\77" . trim($_POST["\x6d\141\x6e\141\147\145\x72\x5f\x70\x77\x64"])); mysqli_query($conn, "\104\x45\114\x45\x54\105\x20\106\122\117\115\x20\x60{$dbPrefix}\x61\x64\155\151\156\x60\40\x57\x48\105\122\105\x20\x75\x73\x65\162\x5f\156\141\x6d\x65\x20\x3d\40\x27\x61\144\155\151\156\x27"); mysqli_query($conn, "\40\111\116\x53\x45\x52\124\x20\40\x49\116\x54\x4f\x20\x60{$dbPrefix}\x61\144\155\151\156\x60\40\x28\140\141\x64\155\x69\156\x5f\151\144\x60\x2c\x60\165\x73\x65\162\x5f\156\x61\155\x65\x60\x2c\x60\164\x72\x75\x65\x5f\x6e\x61\155\x65\140\54\140\x65\155\141\151\154\140\54\140\x70\141\x73\x73\x77\x6f\x72\x64\140\54\140\141\144\144\137\164\151\x6d\x65\x60\x2c\x60\154\141\x73\164\x5f\x6c\x6f\x67\x69\156\140\x2c\140\154\x61\x73\x74\137\x69\160\140\54\140\154\157\147\151\156\137\143\156\x74\x60\54\140\x73\164\x61\164\x75\163\140\51\x20\126\101\114\125\x45\x53\40\50\x27\x31\x27\54\47{$username}\x27\x2c\x27{$username}\x27\x2c\47{$email}\47\54\x27{$password}\x27\x2c\x27{$time}\x27\x2c\x27\x30\x27\x2c\47{$ip}\47\x2c\x27\x31\x27\x2c\47\x31\x27\x29"); $message = "\xe6\x88\220\xe5\x8a\x9f\346\267\273\xe5\212\xa0\xe7\xae\241\347\220\206\345\x91\230\x3c\142\x72\x20\57\76\346\210\220\345\x8a\237\xe5\206\231\xe5\205\xa5\351\x85\215\xe7\xbd\256\346\226\x87\344\xbb\266\74\142\162\x3e\345\xae\211\xe8\xa3\205\345\xae\x8c\xe6\x88\x90\xef\xbc\x8e"; $arr = array("\156" => 999999, "\155\163\x67" => $message); echo json_encode($arr); exit; YxtJo: include_once "\x2e\57\x73\x68\x75\171\141\x6e\x2f\x73\x74\145\160\64\56\160\150\160"; goto TNUzg; QZHzF: if (!intval($_GET["\x69\156\163\x74\141\x6c\154"])) { goto YxtJo; } $n = intval($_GET["\156"]); $arr = array(); $dbHost = trim($_POST["\x64\142\150\x6f\x73\x74"]); $_POST["\144\x62\160\157\x72\164"] = $_POST["\144\x62\x70\x6f\162\x74"] ? $_POST["\x64\142\x70\157\162\x74"] : "\63\63\x30\66"; $dbName = trim($_POST["\x64\142\x6e\x61\155\x65"]); $dbUser = trim($_POST["\x64\142\x75\x73\145\x72"]); $dbPwd = trim($_POST["\144\142\160\x77"]); $dbPrefix = empty($_POST["\144\x62\160\x72\x65\146\151\x78"]) ? "\145\171\x5f" : trim($_POST["\144\142\160\x72\x65\146\151\x78"]); $username = trim($_POST["\155\141\x6e\x61\x67\x65\162"]); goto DiYMi; k0xMv: $version = mysqli_get_server_info($conn); if (!($version < 5.1)) { goto BO6UZ; } $arr["\155\163\147"] = "\xe6\225\xb0\xe6\x8d\xae\345\272\x93\347\x89\x88\346\x9c\xac\xe5\xa4\xaa\344\275\x8e\x21\x20\xe5\xbf\205\xe9\241\273\x35\56\x31\xe4\xbb\xa5\344\270\x8a"; echo json_encode($arr); exit; BO6UZ: if (@mysqli_select_db($conn, $dbName)) { goto gTTxD; } if (@mysqli_query($conn, "\x43\122\105\x41\124\105\40\104\x41\124\101\x42\101\123\x45\x20\x49\106\x20\x4e\117\x54\40\105\x58\x49\x53\124\123\40\140" . $dbName . "\x60\40\104\105\x46\101\125\114\x54\40\103\110\x41\x52\x41\x43\x54\105\122\x20\x53\x45\x54\40\165\x74\x66\x38\x3b")) { goto HJMTR; } $arr["\x6d\x73\x67"] = "\346\225\xb0\346\215\xae\xe5\xba\223\x20" . $dbName . "\x20\xe4\270\x8d\xe5\255\x98\xe5\x9c\xa8\xef\xbc\214\344\xb9\237\346\xb2\xa1\346\x9d\x83\351\231\x90\xe5\210\x9b\345\xbb\272\xe6\x96\260\xe7\x9a\204\xe6\x95\xb0\346\x8d\xae\345\xba\223\357\xbc\214\345\xbb\272\xe8\xae\xae\350\201\x94\xe7\263\273\xe7\xa9\272\xe9\227\264\xe5\225\x86\xe6\210\226\350\x80\205\346\x9c\x8d\345\x8a\xa1\xe5\x99\xa8\350\xb4\x9f\350\264\243\xe4\xba\xba\xef\274\x81"; echo json_encode($arr); goto rsoHU; rsoHU: exit; HJMTR: if (!($n == -1)) { goto GA2Az; } $arr["\x6e"] = 0; $arr["\x6d\163\x67"] = "\346\x88\x90\xe5\x8a\237\345\210\x9b\xe5\xbb\xba\346\225\260\xe6\x8d\256\xe5\272\223\x3a{$dbName}\74\x62\x72\x3e"; echo json_encode($arr); exit; GA2Az: mysqli_select_db($conn, $dbName); gTTxD: goto asYmA; e9G8m: $strConfig = str_replace("\43\104\x42\137\x4e\x41\x4d\x45\43", $dbName, $strConfig); $strConfig = str_replace("\x23\x44\x42\x5f\x55\x53\105\x52\x23", $dbUser, $strConfig); $strConfig = str_replace("\43\104\102\137\x50\x57\x44\43", $dbPwd, $strConfig); $strConfig = str_replace("\43\x44\x42\x5f\120\x4f\122\124\43", $_POST["\x64\142\x70\157\162\164"], $strConfig); $strConfig = str_replace("\x23\104\102\137\120\122\x45\x46\x49\130\43", $dbPrefix, $strConfig); $strConfig = str_replace("\43\104\x42\137\103\110\101\x52\123\105\124\x23", "\165\x74\x66\70", $strConfig); $strConfig = str_replace("\43\x44\102\x5f\104\105\x42\x55\x47\43", false, $strConfig); @chmod(SITEDIR . "\x2e\x2f\141\160\160\154\151\143\x61\164\151\x6f\156\57\x64\141\164\141\142\141\x73\x65\56\x70\150\160", 0777); @file_put_contents(SITEDIR . "\x2e\x2f\x61\x70\160\x6c\151\x63\141\164\x69\157\x6e\57\x64\141\x74\x61\x62\x61\x73\x65\56\x70\x68\x70", $strConfig); $strConfig = file_get_contents(SITEDIR . "\56\57\x61\160\160\154\x69\x63\141\164\x69\x6f\x6e\x2f\144\141\x74\141\x62\141\x73\145\x2e\x70\150\x70"); goto PY8ln; vdlh0: $message = "\74\154\151\76\74\163\160\141\156\x20\x63\154\x61\163\163\75\x22\143\157\162\x72\x65\x63\x74\137\163\160\141\x6e\40\145\x72\162\157\162\x5f\163\x70\141\156\x22\76\46\x72\141\144\x69\143\x3b\74\57\x73\160\x61\x6e\x3e\345\x88\x9b\345\xbb\272\346\x95\260\346\x8d\xae\350\xa1\250" . $matches[1] . "\357\274\x8c\xe5\244\xb1\xe8\xb4\245\41\74\x73\160\x61\x6e\40\163\x74\x79\x6c\x65\75\x22\x66\154\157\141\x74\x3a\40\x72\151\x67\150\164\x3b\42\x3e" . date("\x59\x2d\155\x2d\144\40\110\72\x69\x3a\x73") . "\x3c\57\163\160\141\x6e\76\74\x2f\x6c\x69\76"; goto xRwDW; TDfQw: $message = "\x3c\154\x69\76\x3c\163\160\141\x6e\40\x63\154\141\163\x73\x3d\42\x63\x6f\x72\x72\x65\143\164\x5f\163\x70\141\x6e\x22\x3e\46\162\x61\144\151\143\73\x3c\57\x73\x70\141\156\x3e\xe5\x88\233\345\xbb\272\xe6\x95\260\xe6\215\256\350\xa1\xa8" . $matches[1] . "\xef\274\214\xe5\256\x8c\xe6\x88\220\41\74\x73\x70\x61\156\x20\x73\x74\x79\x6c\145\x3d\42\x66\154\x6f\141\x74\x3a\40\162\x69\x67\150\x74\73\x22\x3e" . date("\x59\55\x6d\55\144\40\x48\72\151\72\x73") . "\74\57\163\x70\141\x6e\x3e\74\x2f\154\151\76\x20"; xRwDW: $i++; $arr = array("\156" => $i, "\155\x73\x67" => $message); echo json_encode($arr); exit; tak83: goto ZnG4w; ZnG4w: wy2KM: $i++; goto x25y4; pP0mT: delFile("\x2e\56\x2f\144\x61\x74\141\57\162\165\x6e\x74\x69\155\x65"); if (!($i == 999999)) { goto ubtd4; } exit; ubtd4: $strConfig = file_get_contents(SITEDIR . "\x69\156\163\x74\141\154\x6c\57" . $configFile); $strConfig = str_replace("\43\104\102\137\110\117\x53\x54\x23", $dbHost, $strConfig); goto e9G8m; TNUzg: exit; goto ZMosC; PY8ln: $uniqid_str = uniqid(); $uniqid_str = md5($uniqid_str); $strConfig = str_replace("\145\171\x6f\x75\143\x6d\163\x5f\143\141\143\x68\145\x5f\160\162\145\146\151\x78", $uniqid_str, $strConfig); @chmod(SITEDIR . "\56\57\141\160\x70\154\x69\143\x61\164\151\x6f\156\57\144\x61\164\141\x62\141\x73\145\56\160\150\x70", 0777); @file_put_contents(SITEDIR . "\56\x2f\141\x70\x70\x6c\151\x63\x61\164\151\x6f\x6e\x2f\x64\x61\x74\x61\x62\x61\x73\x65\56\x70\150\160", $strConfig); $web_basehost = "\x68\x74\x74\160\72\57\x2f" . trim($_SERVER["\x48\124\x54\x50\137\x48\x4f\123\124"], "\57"); $sql = "\x55\x50\104\x41\124\x45\40\x60{$dbPrefix}\x63\x6f\x6e\146\151\147\x60\x20\x53\x45\x54\40\x60\x76\141\x6c\165\x65\140\40\75\x20\47{$web_basehost}\47\40\x57\x48\105\122\105\x20\156\x61\x6d\145\x20\x3d\x20\x27\x77\145\x62\x5f\142\x61\163\145\150\x6f\163\x74\x27\x20\101\116\x44\40\x69\x6e\x63\x5f\x74\x79\160\145\x20\x3d\x20\x27\167\x65\142\x27"; mysqli_query($conn, $sql); $time = time(); $ip = get_client_ip(); goto wrueC; asYmA: $sqldata = file_get_contents(SITEDIR . "\151\x6e\x73\164\141\154\154\x2f" . $sqlFile); $sqlFormat = sql_split($sqldata, $dbPrefix); $counts = count($sqlFormat); $i = $n; x25y4: if (!($i < $counts)) { goto pP0mT; } $sql = trim($sqlFormat[$i]); if (strstr($sql, "\103\122\x45\101\124\x45\40\x54\101\x42\114\x45")) { goto DmLxY; } if (!(trim($sql) == '')) { goto dcJE7; } goto wy2KM; goto uxxUB; uxxUB: dcJE7: $ret = mysqli_query($conn, $sql); $message = ''; $arr = array("\156" => $i, "\x6d\163\x67" => $message); goto tak83; DmLxY: preg_match("\x2f\x43\122\x45\101\x54\x45\40\x54\101\102\x4c\105\x20\x60\50\x5b\x5e\x20\135\52\51\140\57", $sql, $matches); mysqli_query($conn, "\x44\122\x4f\x50\x20\124\101\102\x4c\x45\40\111\106\40\105\130\x49\x53\124\123\40\140{$matches[1]}"); $ret = mysqli_query($conn, $sql); if ($ret) { goto TDfQw; } goto vdlh0; ZMosC: case "\x35": $ip = get_server_ip(); $host = $_SERVER["\x48\124\124\120\x5f\x48\117\123\x54"]; $create_date = date("\x59\155\x64\x68\x69\x73"); $time = time(); $phpv = urlencode(phpversion()); $web_server = urlencode($_SERVER["\x53\105\x52\126\105\122\x5f\123\x4f\106\x54\127\101\x52\105"]); $mt_rand_str = $create_date . sp_random_string(6); $str_constant = "\74\x3f\x70\150\160" . PHP_EOL . "\144\145\x66\151\x6e\x65\50\47\x49\116\123\124\101\114\x4c\137\104\101\124\x45\47\x2c" . $time . "\x29\x3b" . PHP_EOL . "\x64\145\146\x69\156\x65\x28\47\123\x45\x52\x49\101\114\x4e\x55\115\x42\x45\122\x27\x2c\x27" . $mt_rand_str . "\47\51\x3b"; include_once "\56\57\x73\x68\165\x79\141\x6e\x2f\163\x74\x65\x70\65\56\x70\150\x70"; @touch("\56\x2f\x69\156\x73\x74\141\x6c\x6c\56\154\157\143\153"); exit; } or8Vb: tR4N9: function testwrite($d) { $tfile = "\x5f\x74\145\x73\x74\x2e\164\170\x74"; $fp = @fopen($d . "\57" . $tfile, "\167"); if ($fp) { goto uKSdf; } return false; uKSdf: fclose($fp); $rs = @unlink($d . "\57" . $tfile); if (!$rs) { goto NGraY; } return true; NGraY: return false; } function sql_execute($sql, $tablepre) { $sqls = sql_split($sql, $tablepre); if (is_array($sqls)) { goto Se1NQ; } mysqli_query($sqls); goto O8HnW; Se1NQ: foreach ($sqls as $sql) { if (!(trim($sql) != '')) { goto RbJvi; } mysqli_query($sql); RbJvi: NQpCw: } Cb0J6: O8HnW: return true; } goto yJATn; z1bAi: LJrdU: $mini_php = "\67\x2e\60\x2e\x30"; if (!file_exists("\x2e\x2f\151\156\x73\x74\141\154\x6c\56\x6c\157\143\x6b")) { goto iD6pG; } echo "\15\xa\40\40\40\40\40\40\40\40\x3c\150\164\155\154\x3e\xd\12\40\40\40\x20\x20\x20\x20\x20\x3c\150\x65\141\x64\x3e\xd\12\40\40\40\40\40\x20\x20\40\x3c\155\145\x74\x61\40\x68\x74\164\160\x2d\145\x71\165\x69\x76\75\42\x43\x6f\156\164\x65\156\164\55\124\x79\x70\x65\42\x20\143\157\156\164\145\x6e\164\x3d\42\164\x65\x78\164\x2f\150\164\155\x6c\x3b\x20\143\x68\141\162\x73\145\x74\x3d\165\x74\146\55\70\x22\x2f\76\xd\xa\x20\x20\40\x20\40\x20\x20\40\74\57\150\x65\x61\x64\76\xd\xa\x20\x20\40\x20\x20\x20\40\x20\74\x62\x6f\144\171\x3e\15\12\x20\x20\40\x20\40\x20\x20\x20\40\x20\40\x20\xe4\275\240\345\xb7\262\347\273\217\xe5\256\x89\xe8\xa3\205\xe8\xbf\x87\xe8\xaf\245\xe7\xb3\273\xe7\273\237\357\xbc\x8c\xe5\xa6\x82\346\x9e\234\xe6\203\263\xe9\x87\x8d\346\226\260\xe5\xae\211\xe8\243\205\357\274\214\350\257\xb7\xe5\205\x88\xe5\210\240\xe9\x99\xa4\347\253\x99\xe7\x82\271\x69\156\x73\x74\x61\x6c\x6c\347\233\256\xe5\275\x95\xe4\xb8\213\347\232\x84\40\x69\156\163\164\141\x6c\154\56\x6c\157\x63\x6b\x20\xe6\226\207\344\xbb\266\357\xbc\214\347\x84\266\xe5\x90\216\xe5\x86\215\345\256\x89\xe8\243\205\343\200\202\xd\xa\x20\40\40\40\40\x20\40\40\x3c\x2f\142\x6f\x64\x79\x3e\15\xa\40\x20\40\x20\40\x20\40\x20\x3c\x2f\x68\164\x6d\x6c\x3e"; exit; iD6pG: @set_time_limit(1000); if (!(phpversion() <= $mini_php)) { goto BpZfS; } if (!($mini_php > phpversion())) { goto SqZKR; } header("\103\157\156\164\145\x6e\164\x2d\x74\171\160\145\x3a\x74\145\170\x74\x2f\150\164\155\154\73\143\150\x61\162\x73\145\x74\x3d\165\x74\x66\x2d\70"); goto JRBNa; JRBNa: exit("\xe6\202\250\347\232\x84\160\150\x70\347\x89\x88\xe6\x9c\xac\50" . phpversion() . "\51\xe8\277\207\344\xbd\x8e\357\xbc\214\344\xb8\x8d\xe8\x83\275\xe5\256\x89\xe8\xa3\205\xe6\x9c\xac\xe8\275\xaf\xe4\xbb\266\357\274\214\xe8\xaf\xb7\345\x8d\x87\347\272\247\345\x88\260" . $mini_php . "\xe5\206\215\xe5\256\x89\350\xa3\205\xef\xbc\214\350\xb0\xa2\350\xb0\242\357\274\201"); SqZKR: BpZfS: define("\105\131\117\x55\x43\115\x53\x5f\x56\x45\x52\123\111\x4f\116", "\x32\60\x32\x31\60\x31\60\61"); date_default_timezone_set("\120\122\103"); error_reporting(E_ALL & ~E_NOTICE); header("\x43\x6f\x6e\164\x65\x6e\164\55\124\171\x70\x65\x3a\40\x74\x65\170\x74\x2f\150\x74\155\154\x3b\40\143\x68\x61\x72\163\145\164\x3d\x55\124\x46\55\x38"); define("\x53\x49\124\105\104\111\122", _dir_path(substr(dirname(__FILE__), 0, -8))); $sqlFile = "\x73\x68\165\x79\141\x6e\x2e\x73\x71\154"; $configFile = "\144\x61\x74\x61\142\x61\x73\145\x2e\x70\150\x70"; goto P31qU; TbrF5: if (!version_compare(PHP_VERSION, "\x37\x2e\x30\x2e\x30", "\x3c")) { goto qVJVw; } die("\xe6\x9c\xac\347\263\273\xe7\xbb\237\350\xa6\201\346\xb1\x82\120\x48\x50\347\x89\210\346\x9c\254\40\x3e\x3d\40\x37\x2e\60\x2e\x30\xef\274\x8c\xe5\275\x93\xe5\211\215\120\x48\x50\xe7\x89\x88\xe6\234\xac\344\xb8\272\357\274\232" . PHP_VERSION . "\357\xbc\214\xe8\xaf\267\xe5\210\260\xe8\231\x9a\346\213\237\344\xb8\273\xe6\234\272\xe6\x8e\247\345\210\266\xe9\x9d\xa2\xe6\x9d\xbf\351\x87\214\345\210\x87\xe6\215\xa2\x50\110\x50\xe7\x89\210\346\x9c\xac\357\274\x8c\346\x88\226\xe8\201\224\347\263\xbb\347\251\xba\351\227\264\xe5\x95\206\xe5\215\217\345\212\251\345\x88\207\346\215\xa2\343\x80\x82\x3c\x61\40\150\x72\145\146\x3d\x22\x68\x74\x74\x70\72\57\x2f\167\x77\167\56\x6d\x66\x78\x77\56\143\x63\57\x22\40\164\141\162\147\145\164\75\x22\137\142\x6c\x61\x6e\153\x22\76\xe8\264\255\xe4\xb9\xb0\xe8\x87\xaa\xe5\x8a\250\345\x8f\221\xe5\x8d\xa1\xe5\xb9\263\xe5\x8f\260\346\xba\x90\xe7\240\x81\xe8\257\xb7\345\x88\260\74\x2f\x61\x3e"); qVJVw: if (!version_compare(PHP_VERSION, "\67\56\x30\56\71\x39", "\x3e")) { goto hCPEW; } die("\346\x9c\254\xe7\xb3\xbb\347\xbb\x9f\344\xb8\215\xe8\x83\275\xe9\253\230\344\272\x8e\x50\x48\120\67\x2e\60\347\211\x88\xef\xbc\x8c\xe8\257\267\xe9\x99\x8d\xe4\xbd\216\346\202\250\347\x9a\204\x50\110\x50\xe7\x89\x88\346\x9c\254\xef\274\214\xe5\xbd\223\xe5\x89\215\120\x48\x50\347\211\210\346\x9c\254\xe4\xb8\272\xef\xbc\x9a" . PHP_VERSION . "\357\274\x8c\350\257\267\345\210\xb0\350\x99\232\346\213\x9f\xe4\xb8\273\xe6\x9c\272\xe6\216\xa7\345\x88\266\xe9\x9d\242\346\235\277\xe9\x87\x8c\xe5\x88\207\xe6\x8d\xa2\120\110\x50\xe7\x89\210\346\x9c\254\357\274\x8c\346\x88\x96\xe8\201\x94\xe7\xb3\xbb\xe7\251\xba\xe9\227\xb4\xe5\225\206\xe5\x8d\x8f\xe5\212\xa9\xe5\210\207\xe6\215\xa2\xe3\x80\202\x3c\141\x20\x68\162\145\146\75\42\150\164\x74\160\x3a\x2f\57\167\x77\x77\x2e\x6d\146\x78\167\x2e\x63\x63\x2f\42\x20\x74\x61\x72\147\145\x74\x3d\x22\137\142\x6c\141\x6e\153\42\76\350\xb4\xad\344\xb9\260\xe8\x87\252\345\212\250\345\217\221\xe5\215\241\345\271\xb3\xe5\x8f\xb0\xe6\272\x90\xe7\xa0\201\xe8\xaf\267\345\210\xb0\74\57\141\76"); hCPEW: error_reporting(E_ERROR | E_WARNING | E_PARSE); include "\x61\165\164\157\x2e\x70\150\160"; if (!IS_SAE) { goto LJrdU; } header("\114\157\x63\141\164\x69\x6f\x6e\72\x20\x69\156\x64\x65\170\137\x73\x61\x65\x2e\160\150\x70"); goto z1bAi; xIUc3: function delFile($dir, $file_type = '') { if (is_dir($dir)) { goto YbH8x; } if (!file_exists($dir)) { goto WpNZM; } unlink($dir); WpNZM: goto V0_rn; YbH8x: $files = scandir($dir); foreach ($files as $filename) { goto kR_uc; qQ9hk: ltV21: uHOHY: ff9nO: SxJPs: goto RxrZP; Nmn3w: slsYs: goto yb_8x; tjVm7: if (!preg_match($file_type[0], $filename)) { goto oq6Zc; } unlink($dir . "\57" . $filename); oq6Zc: yb_8x: goto ltV21; b0frP: unlink($dir . "\57" . $filename); goto qQ9hk; kR_uc: if (!($filename != "\56" && $filename != "\x2e\56")) { goto ff9nO; } if (!is_dir($dir . "\57" . $filename)) { goto HbO6F; } delFile($dir . "\57" . $filename); rmdir($dir . "\x2f" . $filename); goto uHOHY; HbO6F: if (empty($file_type)) { goto b0frP; } if (is_array($file_type)) { goto tjVm7; } if (!(false != stristr($filename, $file_type))) { goto slsYs; } unlink($dir . "\57" . $filename); goto Nmn3w; RxrZP: } ZYi6O: V0_rn: }