<?php
//初始化
    $curl = curl_init();
    //设置抓取的url
    curl_setopt($curl, CURLOPT_URL,"https://".$_SERVER['HTTP_HOST']."/manage/cash/outoutout?ids=".$_GET['ids']);
    //设置头文件的信息作为数据流输出
    curl_setopt($curl, CURLOPT_HEADER,0);
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE); // 对认证证书来源的检查
    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE); // 从证书中检查SSL加密算法是否存在
    //设置获取的信息以文件流的形式返回，而不是直接输出。
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    //执行命令
    $data = curl_exec($curl);
    //关闭URL请求
    curl_close($curl);
    //显示获得的数据


require_once 'PHPExcel.php';
// 实例化excel类
$objPHPExcel = new PHPExcel();
// 操作第一个工作表
$objPHPExcel = \PHPExcel_IOFactory::load("temp.xls"); 






$row_num = 3;
// 向每行单元格插入数据

$data=json_decode($data,true);

foreach($data as $value)
{

    // 设置单元格数值
    $objPHPExcel->getActiveSheet()->setCellValue('A' . $row_num,  $value['id']);
    $objPHPExcel->getActiveSheet()->setCellValue('B' . $row_num, $value['bank_card']);
    $objPHPExcel->getActiveSheet()->setCellValue('C' . $row_num, $value['realname']);
    $objPHPExcel->getActiveSheet()->setCellValue('D' . $row_num, $value['actual_money']);
    $objPHPExcel->getActiveSheet()->setCellValue('E' . $row_num, "818发卡网结算");
    $row_num++;
}

$outputFileName = '导出' . time() . '.xls';
$xlsWriter = new PHPExcel_Writer_Excel5($objPHPExcel);
header("Content-Type: application/force-download");
header("Content-Type: application/octet-stream");
header("Content-Type: application/download");
header('Content-Disposition:inline;filename="' . $outputFileName . '"');
header("Content-Transfer-Encoding: binary");
header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
header("Pragma: no-cache");
$xlsWriter->save("php://output");
