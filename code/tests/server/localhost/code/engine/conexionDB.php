<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function ConexionDB($query){
    $connect = mysqli_connect("localhost","root","","gamma");//localhost
    $result = mysqli_query($connect,$query);
    return $result;
}

function ConexionDB_JSON($query, $resulttype = MYSQLI_BOTH){
    $result = ConexionDB($query);
    $data = array();
    if (is_bool($result) == FALSE){
	while ($row = mysqli_fetch_array($result, $resulttype)) {
	  $data[] = $row;
	}
        print json_encode($data);
        }
}

function ConexionDB_rawdata($query, $resulttype = MYSQLI_BOTH){
    $result = ConexionDB($query);
    $data = array();
	while ($row = mysqli_fetch_array($result, $resulttype)) {
	  $data[] = $row;
	}
    return $data;
}

function ConexionDBResult_NumRowAfected($query){
    $result = ConexionDB($query);
    $row_cnt = mysqli_num_rows($result);
    return $row_cnt;
}

function ConexionDBResult_PrintArray($query, $resulttype = MYSQLI_BOTH){
    $result = ConexionDB($query);
    $data = array();
    while ($row = mysqli_fetch_array($result, $resulttype)) {
      $data[] = $row;
    }
    print_r($data);
}
?>

