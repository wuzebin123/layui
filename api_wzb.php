<?php
header('content-type:application/json;charset=utf-8');


$method=get_str_value('method');

if($method==''){
	get_code(2);
}else if($method=="1"){//��¼
	$ip=get_real_ip();
	$username = get_str_value('username');
	$password = get_str_value('password');
	$sql = "SELECT id FROM t_user_info where f_user_login='$username' and f_user_pwd='$password' and f_status = 1";
	$rsall=mysql_query_sql(1,$sql);
	if($rsall->fetch_assoc()['id']>0){
		$sql = "update t_user_info set f_user_login_count=f_user_login_count+1,f_last_login_ip='$ip',f_last_login_time=now() where f_user_login='$username' and f_user_pwd='$password'";
		$rsall=mysql_query_sql(1,$sql);
		$user_token=MD5($password);
		setcookie('user', $username, time()+604800, '/');
		setcookie('user_token',$user_token, time()+604800, '/');
		get_code(0,'��¼�ɹ�');
	}else{
		get_code(-1,'�˺Ż��������!');
	}
}else if($method=="2"){//��ȡ����
	$user=$_COOKIE['user'];
	if($user==""){
		get_code(-2,'��¼����');
	}
	
	$sql = "SELECT 
				id 
				,f_user_login as user_login
				,f_daily_push_count as daily_push_count
				,f_today_push_count as today_push_count
				,f_not_viewed_count as not_viewed_count
			FROM t_user_info 
				where f_user_login='$user' and f_status = 1";
	$rsall=mysql_query_sql(1,$sql);
	$rs = $rsall->fetch_assoc();
	$daily_push_count=$rs['daily_push_count'];//�ƹ�����
	
	$sql = "SELECT count(id) as count FROM t_vulgar_tycoon where f_status=0 and f_deny_message_flag=0";
	$rsall3=mysql_query_sql(1,$sql);
	$rs3 = $rsall3->fetch_assoc();//δ��ȡ����������
	$tycoon_count=$rs3['count'];//��������
	
	$sql = "SELECT count(id) as count FROM t_user_info where f_status=1";
	$rsall2=mysql_query_sql(1,$sql);
	$rs2 = $rsall2->fetch_assoc();//�����û�����
	$user_count=$rs2['count'];//�û�����
	$average=floor($tycoon_count/$user_count);
	if($average<$daily_push_count){
		$daily_push_count=$average;
	}else if($daily_push_count<1){
		$daily_push_count=1;
	}
	//ˢ������û�ջ�ȡ����
	$sql = "SELECT * FROM t_config where to_days( f_tycoon_time ) != to_days(now())";
	$rsall=mysql_query_sql(1,$sql);
	if($rsall->fetch_assoc()){
		$sql = "update t_user_info set f_today_push_count=0";
		$rsall=mysql_query_sql(1,$sql);
		$sql = "update t_config set f_tycoon_time=now()";
		$rsall=mysql_query_sql(1,$sql);
	}
	
	//��ȡ��ʷδ�鿴�ͽ����Ѳ鿴
	$sql = "SELECT 
				f_user_id as user_id
				,f_head as head
				,f_name as name
				,f_grade as grade
				,f_money as money
				,f_extract_time as time
				,f_status_user as status_user
			FROM t_vulgar_tycoon
				where f_extract_user_id='$user' and f_status_user=0
				ORDER BY f_extract_time asc ";
	$rsall=mysql_query_sql(1,$sql);
	$history_count=0;		//��ʷδ�鿴+����δ�鿴	����
	$history_array=array();	//��ʷδ�鿴+����δ�鿴	����
	while($rs = $rsall->fetch_assoc()){
		$history_count++;
		array_push($history_array,$rs);
	}
	
	//�����Ѳ鿴
	$sql = "SELECT 
				f_user_id as user_id
				,f_head as head
				,f_name as name
				,f_grade as grade
				,f_money as money
				,f_extract_time as time
				,f_status_user as status_user
				,COUNT(1) OVER () AS count
			FROM t_vulgar_tycoon
				where  f_extract_user_id='$user' and f_status_user=1 and to_days(f_extract_time) = to_days(now())";
	$rsall=mysql_query_sql(1,$sql);
	$today_count=0;			//�����Ѳ鿴	����
	$today_array=array();	//�����Ѳ鿴	����
	while($rs = $rsall->fetch_assoc()){
		$today_count++;
		array_push($today_array,$rs);
	}
	$array=array();//��������
	if($history_count+$today_count<=$daily_push_count){//�����Ѳ鿴����+��ʷδ�鿴����<=�ƹ�����
		$count=$daily_push_count-$today_count-$history_count;// ʵ�ƹ���=�ƹ�����-�����Ѳ鿴����-��ʷδ�鿴����
		//��ȡ������
		$sql = "SELECT 
					f_user_id as user_id
					,f_head as head
					,f_name as name
					,f_grade as grade
					,f_money as money
					,(now()) as time
					,f_status_user as status_user
				FROM t_vulgar_tycoon
					where f_status=0 and f_deny_message_flag=0 limit ".$count;
		$rsall=mysql_query_sql(1,$sql);
		$array_user_id="";
		$bool=true;
		$count2=0;//��ʱ����
		while($rs = $rsall->fetch_assoc()){
			if($bool){
				$bool=false;
				$array_user_id.=$rs['user_id'];
			}
			$count2++;
			$array_user_id.=','.$rs['user_id'];
			array_push($array,$rs);
		}
		$count=$count+$count2;
		if($array_user_id!=""){//���»�ȡ�����ݼ���Ϊ�Ի�ȡ״̬
			$sql = "update t_vulgar_tycoon set f_status=1,f_extract_user_id='$user',f_status_user=0,f_extract_time=now() where f_user_id in($array_user_id)";
			$rsall=mysql_query_sql(1,$sql);
			
			$sql = "update t_user_info set f_today_push_count=f_today_push_count+$count2,f_history_push_count=f_history_push_count+$count2,f_not_viewed_count=f_not_viewed_count+$count2 where f_user_login ='$user'";
			$rsall=mysql_query_sql(1,$sql);
		}
	}
	
	foreach($history_array as $rs){//������ʷδ�鿴����
		array_push($array,$rs);
	}
	foreach($today_array as $rs){//�����Ѳ鿴����
		array_push($array,$rs);
	}
	get_code(0,'���ݻ�ȡ�ɹ�',$array);
	
}else if($method=="3"){//��ȡ������Ϣ  �鿴
	$user=$_COOKIE['user'];
	$user_id = get_str_value('user_id');//������user_id
	$sql = "SELECT 
				id
				,f_status_user as status_user
			FROM t_vulgar_tycoon
				where f_user_id='$user_id' and f_extract_user_id='$user'";
	$rsall=mysql_query_sql(1,$sql);
	while($rs = $rsall->fetch_assoc()){
		if($rs['status_user']==0){
			$sql = "update t_vulgar_tycoon set f_status_user=1 where f_user_id='$user_id'";
			$rsall2=mysql_query_sql(1,$sql);
			$sql = "update t_user_info set f_not_viewed_count=f_not_viewed_count-1 where f_user_login='$user'";
			$rsall3=mysql_query_sql(1,$sql);
		}
	}
	get_code(0,'�鿴�ɹ�',$arr,$count);
}else if($method=="4"){//����
	$array= change_json(get_str_value('key'));
	$sql = "insert into t_ceshi set f_ids='$array[ids]',f_href='$array[href]'";
	$rsall=mysql_query_sql(1,$sql);
}else{
	get_code(3);
}


function get_limit_sql($limit_min=1,$limit_max=1000,$page_name='page',$limit_name='limit'){
	//��ȡҳ��
	$page=get_int_value($page_name);
	if($page<1){
		$page=1;
	}
	//��ȡÿҳ����
	$limit=get_int_value('limit');
	if($limit<$limit_min){
		$limit=$limit_min;
	}else if($limit>$limit_max){
		$limit=$limit_max;
	}
	$front=($page-1) * $limit;
	return ' limit '.$front.','.$limit;
}


function mysql_query_sql($type,$sql){
	$dbConfig=array();
	if($type==1){
		$dbConfig['host']='127.0.0.1';
		$dbConfig['user']='root';
		$dbConfig['pwd']='root';
		$dbConfig['dbname']='web0406';
		$dbConfig['port']=3306;
	}else{
		return;
	}
	
	$conn = new mysqli($dbConfig['host'],$dbConfig['user'],$dbConfig['pwd'],$dbConfig['dbname'],$dbConfig['port']);
	$conn->set_charset('utf-8');
	
	$query = $conn->query($sql);
	if(!$query){
		header('content-type:application/json;charset=gb2312');
		echo 'SQL���ִ�г����ˣ�����ϵ����Ա����<br>';
		if(C_WEB_IS_DEBUG){
			echo 'SQL��' , $sql , '<br>';
			echo '������Ϣ��' , $this->conn->error;
		}
		exit;
	}
	mysqli_close($conn);
	return $query;
}


function get_code($result,$error_msg='',$json=array(),$count=0,$json2=array()){
	if($error_msg==''){
		if($result==0){
			$error_msg='�ɹ�!';
		}else if($result==2){
			$error_msg='�����ڸ÷���!';
		}else if($result==3){
			$error_msg='������ִ�еķ���!';
		}else if($result==5){
			$error_msg='��������Ϊ��!';
		}else{
			$error_msg='δ֪����!';
		}
	}
	if(iconv('gb2312', 'utf-8', $error_msg)){
		$error_msg=iconv('gb2312', 'utf-8', $error_msg);
	}
	$all = array(
		'code'=>$result,
		'error_msg'=>$error_msg,
		'data'=>$json,
		'count'=>$count,
		'data2'=>$json2
	);
	echo json_encode($all,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES);
	exit;
}








function get_user_headimg($path="img"){
	$imgpngs = array();
	$files = scandir($path); // Ŀ¼�������ļ���
	foreach($files as $file){
		$path_parts = pathinfo($path.'/'.$file);
		if($path_parts['extension'] == 'jpg' || $path_parts['extension'] == 'jpeg' ){
			$imgpngs[] = $path.'/'.$file;
		}
	}
	$min=0;
	$max=count($imgpngs)-1;
	$num=1;
	$count = 0;
	$data = array();
	while ($count < $num) {
		$data[] = mt_rand($min, $max);
		$data = array_flip(array_flip($data));
		$count = count($data);
	}
	//�������飬���¸��������µ��±�
	shuffle($data);
	$pic_list=array();
	for($i=0;$i<=count($data)-1;$i++){
		$pic_list[]=$imgpngs[$data[$i]];
	}
	$bg_w = 162; // ����ͼƬ��� 
	$bg_h = 162; // ����ͼƬ�߶� 
	$background = imagecreatetruecolor($bg_w,$bg_h); // ����ͼƬ 
	$color = imagecolorallocate($background, 255, 255, 255); // Ϊ���ɫ����������ɫ����
	imagefill($background, 0, 0, $color); 
	imageColorTransparent($background, $color);
	$img_temp=imagecreatefromjpeg($pic_list[0]);
	//$img_temp=imagecreatefromjpeg('img/12.jpg');
	$img = imagecreatetruecolor(155, 155);   //�½�һ�����ɫͼ��
	imagecopyresampled($img, $img_temp, 0, 0, 0, 0, 155,155, imagesx($img_temp), imagesy($img_temp));//������С
	$background_x=(1)*3;
	$background_y=(1)*3;
	imagecopymerge($background, $img, $background_x, $background_y, 0,0, imagesx($img), imagesy($img), 100);
	return $background;
}

//�����ļ���	dir�ļ���·��
function mkdirs($dir, $mode = 0777){
    if (is_dir($dir) || @mkdir($dir, $mode)) return TRUE;
    if (!mkdirs(dirname($dir), $mode)) return FALSE;
    return @mkdir($dir, $mode);
}

//data	ͼƬ���߶�ά��base64		��ά������
//url	�ϴ�·��
function img_download($data,$url_jpg=''){
	$array=array();
	if (preg_match('/^(data:\s*image\/(\w+);base64,)/', $data, $result)){
		$md5=md5(uuid());
		//header('content-type:image/png');//��ʾͼƬ
		//echo $img;
		file_put_contents($url_jpg, base64_decode(str_replace($result[1],'', $data)));//д��ͼƬ
		$array['code']=1;
		$array['msg']="�ɹ�";
		$array['data']=$md5.'.jpg';
		return $array;
	}
	$array['code']=2;
	$array['msg']="ͼƬ����";
	return $array;
}




function get_real_ip(){
    $ip=FALSE;
    //�ͻ���IP �� NONE
    if(!empty($_SERVER["HTTP_CLIENT_IP"])){
        $ip = $_SERVER["HTTP_CLIENT_IP"];
    }

    //���ش���������µĿͻ�����ʵIP��ַ������α�죩,���û��ʹ�ô������ֶ�Ϊ��

    if (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
        $ips = explode (", ", $_SERVER['HTTP_X_FORWARDED_FOR']);
        if ($ip) { array_unshift($ips, $ip); $ip = FALSE; }
        for ($i = 0; $i < count($ips); $i++) {
            if (!eregi ("^(10��172.16��192.168).", $ips[$i])) {
                $ip = $ips[$i];
                break;
            }
        }
    }
    //�ͻ���IP �� (���һ��)��������� IP
    return ($ip ? $ip : $_SERVER['REMOTE_ADDR']);
}


function uuid(){
    $chars = md5(uniqid(mt_rand(), true));  
    $uuid = substr ( $chars, 0, 8 ) . '-'
            . substr ( $chars, 8, 4 ) . '-' 
            . substr ( $chars, 12, 4 ) . '-'
            . substr ( $chars, 16, 4 ) . '-'
            . substr ( $chars, 20, 12 );  
    return $uuid ;  
}

function change_json($str){
	$json= str_replace('&quot;','"',$str);
	if($json==''){
		return array();
	}else{
		return json_decode($json,true);
	}
}

function Getsig($a,$b){
	$c=$a.'&'.$b;
	$c= urldecode($c);
	$arr=explode('&',$c);
	$arrSort=array();
	foreach($arr as $key=>$val){
		$line=explode('=',$val);
		$arrSort[$line[0]]=$line[1];
	}
	ksort($arrSort);
	$str='';
	foreach($arrSort as $key=>$val){
		$str.=$key.'='.urldecode($val);
	}

	$str = iconv('gb2312', 'utf-8', $str);
	$str.='382700b563f4';
	return md5($str);
}
function GetToken($sig,$token_client_salt){return SHA256Hex($sig . $token_client_salt);}
function SHA256Hex($str){$re=hash('sha256',$str,true);return bin2hex($re);}


function HttpGet($url,$type=0) {
	$curl = curl_init();
	curl_setopt($curl, CURLOPT_URL, $url);
	$header = array ();
	if($type==0){
		$header [] = 'Content-Type: application/x-www-form-urlencoded';
	}else{
		$header [] = 'Content-Type: application/json;charset=utf-8';
	}
	curl_setopt($curl, CURLOPT_HTTPHEADER, $header);
	curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
	curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
	curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
	
	$data = curl_exec($curl);
	curl_close($curl);
	return $data;
}


function HttpPost($url, $post_data,$type=0,$cookie='') {
	$curl = curl_init();
	curl_setopt($curl, CURLOPT_URL, $url);
	$header = array ();
	if($type==0){
		$header [] = 'Content-Type: application/x-www-form-urlencoded';
	}else{
		$header [] = 'Content-Type: application/json;charset=utf-8';
	}
	if($cookie!=''){
		$header [] = 'Cookie: '.$cookie;
	}
	curl_setopt($curl, CURLOPT_HTTPHEADER, $header);
	curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
	curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
	curl_setopt($curl, CURLOPT_POSTFIELDS, $post_data);
	curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
	$data = curl_exec($curl);
	curl_close($curl);
	return $data;
}


//ȡ���м��ı�
function getSubstr($str, $leftStr, $rightStr){
    $left = strpos($str, $leftStr);
    //echo '���:'.$left;
    $right = strpos($str, $rightStr,$left);
    //echo '<br>�ұ�:'.$right;
    if($left < 0 or $right < $left) return '';
    return substr($str, $left + strlen($leftStr), $right-$left-strlen($leftStr));
}

//ȡ���ұ��ı�
function getSubstry($str, $leftStr){
    $left = strpos($str, $leftStr);
 return substr($str, $left + strlen($leftStr));
}
//ȡ������ı�
function getSubstrz($str, $rightStr){
    $right = strpos($str, $rightStr);
    return substr($str, 0, $right);
}

//�Ƴ����������е�html��ǩ
function FRemoveHTML($a){
	$r=preg_replace('(<[^<]*>)','',$a);
	return $r;
}

function FSHtmlEncode($a){
	$r=$a;if($r){$r=FRemoveHTML($r);$r=str_replace(array('\"','"',"\'","'","<",">"),array("&quot;","&quot;","&#039;","&#039;","&lt;","&gt;"),$r);}
	return $r;
}


function get_int_value($a){
	$str=FGetInt($a);
	if($str=='' || $str==null){
		$str=FPostInt($a);
	}
	if($str=='' || $str==null){
		$str=0;
	}
	return $str;
}
function get_str_value($a){
	$str=FGetStr($a);
	if($str=='' || $str==null){
		$str=FPostStr($a);
	}
	if($str=='' || $str==null){
		$str='';
	}
	return $str;
}

function FPostStr($a){
	$r=FSHtmlEncode(trim($_POST[$a]));
	return $r;
}

//�ӱ��ύ�����������л�ȡ����������ֵ
function FPostInt($a){
	$r=intval(trim($_POST[$a]));
	return $r;
}
function FGetStr($a){
	$r=FSHtmlEncode(trim($_GET[$a]));
	return $r;
}

//�ӵ�ַ����ȡ����������ֵ
function FGetInt($a){
	$r=intval(trim($_GET[$a]));
	return $r;
}


//$string  :��Ҫ���ܽ��ܵ��ַ���
//$operation:�ж��Ǽ��ܻ��ǽ���:E:����  D:����
//$key   :���ܵ�Կ��(�ܳ�);
function encrypt($string,$operation,$key=''){
    $key=md5($key);
    $key_length=strlen($key);
    $string=$operation=='D'?base64_decode($string):substr(md5($string.$key),0,8).$string;
    $string_length=strlen($string);
    $rndkey=$box=array();
    $result='';
    for($i=0;$i<=255;$i++)
    {
      $rndkey[$i]=ord($key[$i%$key_length]);
      $box[$i]=$i;
    }
    for($j=$i=0;$i<256;$i++)
    {
      $j=($j+$box[$i]+$rndkey[$i])%256;
      $tmp=$box[$i];
      $box[$i]=$box[$j];
      $box[$j]=$tmp;
    }
    for($a=$j=$i=0;$i<$string_length;$i++)
    {
      $a=($a+1)%256;
      $j=($j+$box[$a])%256;
      $tmp=$box[$a];
      $box[$a]=$box[$j];
      $box[$j]=$tmp;
      $result.=chr(ord($string[$i])^($box[($box[$a]+$box[$j])%256]));
    }
    if($operation=='D')
    {
      if(substr($result,0,8)==substr(md5(substr($result,8).$key),0,8))
      {
        return substr($result,8);
      }
      else
      {
        return'';
      }
    }
    else
    {
      return str_replace('=','',base64_encode($result));
    }
}