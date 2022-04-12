<?php
header('content-type:application/json;charset=utf-8');


$method=get_str_value('method');

if($method==''){
	get_code(2);
}else if($method=="1"){//登录
	global $url;
	$vercode =get_str_value('vercode');
	if(strtoupper($vercode) == strtoupper($_SESSION["VerifyCode"])){//前者为用户输入的验证码		后者为图片验证码内容
		get_code(-1,'验证码输入错误');
	}else{
		$ip=get_real_ip();
		$username = get_str_value('username');
		$password = get_str_value('password');
		$admin_token=MD5($password);
		$sql = "SELECT id FROM t_admin_info where f_admin_login='$username' and f_admin_pwd='$admin_token' and f_status = 1";
		$rsall=mysql_query_sql(1,$sql);
		if($rsall->fetch_assoc()['id']>0){
			$sql = "update t_admin_info set f_admin_login_count=f_admin_login_count+1,f_last_login_ip='$ip',f_last_login_time=now() where f_admin_login='$username' and f_admin_pwd='$admin_token'";
			$rsall=mysql_query_sql(1,$sql);
			setcookie('admin', $username, time()+360000, '/');
			setcookie('admin_token',$admin_token, time()+360000, '/');
			get_code(0,'登录成功');
		}else{
			get_code(-1,'账号或密码错误!');
		}
	}
}else if($method=="2"){//获取登录人信息
	$admin=$_COOKIE['admin'];
	$admin_token=$_COOKIE['admin_token'];
	$sql="SELECT
			f_admin_name AS name,
			f_admin_head AS head,
			f_admin_login AS login
		FROM t_admin_info
		WHERE f_admin_login = '$admin' AND f_admin_pwd = '$admin_token'";
	$rsall=mysql_query_sql(1,$sql);
	while($rs = $rsall->fetch_assoc()){
		get_code(0,'数据获取成功',$rs);
	}
	get_code(-1,'数据获取失败',$arr);
}else if($method=="3"){//退出登录
	$login=get_str_value('login');
	$name=get_str_value('name');
	$pwd=get_str_value('pwd');
	$token1=MD5($pwd);
	$pwd1=get_str_value('pwd1');
	$token2=MD5($pwd1);

	$admin=$_COOKIE['admin'];
	if($admin==$login){
		$sql = "SELECT id FROM t_admin_info where f_admin_login='$login' and f_admin_pwd='$token1' and f_status = 1";
		$rsall=mysql_query_sql(1,$sql);
		if($rsall->fetch_assoc()['id']>0){
			$sql = "update t_admin_info set f_admin_pwd='$token2' where f_admin_login='$login' and f_admin_pwd='$token1'";
			$rsall=mysql_query_sql(1,$sql);
			setcookie('admin', '', NULL, '/');
			setcookie('admin_token', '', NULL, '/');
			get_code(0,'修改成功');
		}else{
			get_code(-1,'旧密码错误');
		}
	}else{
		get_code(-1,'只能修改自己的');
	}
}else if($method=="4"){//退出登录
	setcookie('admin', '', NULL, '/');
	setcookie('admin_token', '', NULL, '/');
	get_code(0,'退出成功');
}else if($method=="5"){//主播查询
	$array= change_json(get_str_value('key'));
	$sql2="WHERE";
	$order=" ORDER BY";
	if(sizeof($array)){
		if($array['username']!=''){
			if($sql2!="WHERE"){ $sql2.=' and';}
			$sql2.=" (f_user_id='".$array['username']."' or f_kwai_id='".$array['username']."' or f_name like '%".$array['username']."%')";
		}
		if($array['key1']!=''){
			if($array['key1']=="M"){
				if($sql2!="WHERE"){ $sql2.=' and';}
				$sql2.=" f_sex='M'";
			}else if($array['key1']=="F"){
				if($sql2!="WHERE"){ $sql2.=' and';}
				$sql2.=" f_sex='F'";
			}
		}
		if($array['key2']!=''){
			if($array['key2']==1){
				if($sql2!="WHERE"){ $sql2.=' and';}
				$sql2.=" f_status=1";
			}else if($array['key2']==0){
				if($sql2!="WHERE"){ $sql2.=' and';}
				$sql2.=" f_status=0";
			}
		}
		if($array['key3']!=''){
			if($array['key3']==1){
				$order.=" f_money asc";
			}else if($array['key3']==2){
				$order.=" f_money desc";
			}
		}
		if($array['key4']!=''){
			if($sql2!="WHERE"){ $sql2.=' and';}
			$sql2.=" f_region_name like '%".$array['key4']."%'";
		}
		if($array['key5']!=''){
			if($array['key5']==1){
				if($sql2!="WHERE"){ $sql2.=' and';}
				$sql2.=" f_examine=1";
			}else if($array['key5']==0){
				if($sql2!="WHERE"){ $sql2.=' and';}
				$sql2.=" f_examine=0";
			}
		}
	}
	if($sql2=="WHERE"){$sql2='';}
	if($order==" ORDER BY"){$order='';}
	$sql="SELECT 
			id
			,f_user_id as user_id
			,f_kwai_id as kwai_id
			,f_head as head
			,f_name as name
			,f_sex as sex
			,f_autograph as autograph
			,TRUNCATE(COALESCE(f_money/10,0),2) as money
			,if(f_liveimg1 !='0',f_liveimg1,'')as liveimg1
			,if(f_liveimg2 !='0',f_liveimg2,'')as liveimg2
			,if(f_liveimg3 !='0',f_liveimg3,'')as liveimg3
			,f_update_time as update_time
			,f_region_name as region_name
			,f_status as status
			,f_examine as examine
			,COUNT(1) OVER () AS count
		FROM t_anchor "
		.$sql2.$order.get_limit_sql();
	$rsall=mysql_query_sql(1,$sql);
	$arr = array();
	$count=0;
	$bool=true;
	while($rs = $rsall->fetch_assoc()){
		if($bool){
			$count=(int)$rs['count'];
			$bool=false;
		}
		array_push($arr,$rs);
	}
	get_code(0,'数据获取成功',$arr,$count);
}else if($method=="6"){//修改状态
	$id=get_str_value('id');	
	$status=get_str_value('status');
	if($status==0 || $status==1){
		$sql="UPDATE t_anchor
				SET f_status = ".$status."
				WHERE id='".$id."'";
		$rsall=mysql_query_sql(1,$sql);
		if($rsall){
			get_code(0,'修改成功');
		}else{
			get_code(-1,'修改失败');
		}
	}else{
		get_code(-1,'修改失败');
	}
}else if($method=="7"){//土豪查询
	$array= change_json(get_str_value('key'));
	$sql2="WHERE";
	$order=" ORDER BY";
	if(sizeof($array)){
		if($array['username']!=''){
			if($sql2!="WHERE"){ $sql2.=' and';}
			$sql2.=" (f_user_id='".$array['username']."' or f_kwai_id='".$array['username']."' or f_name like '%".$array['username']."%')";
		}
		if($array['key1']!=''){
			if($array['key1']=="M"){
				if($sql2!="WHERE"){ $sql2.=' and';}
				$sql2.=" f_sex='M'";
			}else if($array['key1']=="F"){
				if($sql2!="WHERE"){ $sql2.=' and';}
				$sql2.=" f_sex='F'";
			}
		}
		if($array['key2']!=''){
			if($sql2!="WHERE"){ $sql2.=' and';}
			$sql2.=" f_grade>=$array[key2]";
		}
		if($array['key3']!=''){
			if($sql2!="WHERE"){ $sql2.=' and';}
			$sql2.=" f_grade<=$array[key3]";
		}
		if($array['key4']!=''){
			if($array['key4']==1){
				$order.=" f_grade asc";
			}else if($array['key4']==2){
				$order.=" f_grade desc";
			}
		}
		if($array['key5']!=''){
			if($sql2!="WHERE"){ $sql2.=' and';}
			$sql2.=" f_money>=$array[key5]";
		}
		if($array['key6']!=''){
			if($sql2!="WHERE"){ $sql2.=' and';}
			$sql2.=" f_money<=$array[key6]";
		}
		if($array['key7']!=''){
			if($array['key7']==1){
				if($order!=" ORDER BY"){ $order.=',';}
				$order.=" f_money asc";
			}else if($array['key7']==2){
				if($order!=" ORDER BY"){ $order.=',';}
				$order.=" f_money desc";
			}
		}
		if($array['key8']!=''){
			if($array['key8']=="1"){
				if($sql2!="WHERE"){ $sql2.=' and';}
				$sql2.=" f_status=1";
			}else if($array['key8']=="0"){
				if($sql2!="WHERE"){ $sql2.=' and';}
				$sql2.=" f_status=0";
			}
		}
		if($array['key9']!=''){
			if($array['key9']=="1"){
				if($sql2!="WHERE"){ $sql2.=' and';}
				$sql2.=" f_deny_message_flag=1";
			}else if($array['key9']=="0"){
				if($sql2!="WHERE"){ $sql2.=' and';}
				$sql2.=" f_deny_message_flag=0";
			}
		}
		if($array['key10']!=''){
			if($array['key10']=="1"){
				if($sql2!="WHERE"){ $sql2.=' and';}
				$sql2.=" f_privacy_user=1";
			}else if($array['key10']=="0"){
				if($sql2!="WHERE"){ $sql2.=' and';}
				$sql2.=" f_privacy_user=0";
			}
		}
	}
	if($sql2=="WHERE"){$sql2='';}
	if($order==" ORDER BY"){$order='';}
	$sql="SELECT 
			id
			,f_user_id as user_id
			,f_kwai_id as kwai_id
			,f_head as head
			,f_name as name
			,f_sex as sex
			,f_works_count as works_count
			,f_fan_count as fan_count
			,f_grade as grade
			,TRUNCATE(COALESCE(f_money/10,0),2) as money
			,f_status as status
			,f_deny_message_flag as deny_message_flag
			,f_privacy_user as privacy_user
			,f_extract_user_id as extract_user_id
			,f_status_user as status_user
			,f_extract_time as extract_time
			,COUNT(1) OVER () AS count
		FROM t_vulgar_tycoon
		"
		.$sql2.$order.get_limit_sql();
	$rsall=mysql_query_sql(1,$sql);
	$arr = array();
	$count=0;
	$bool=true;
	while($rs = $rsall->fetch_assoc()){
		if($bool){
			$count=(int)$rs['count'];
			$bool=false;
		}
		array_push($arr,$rs);
	}
	get_code(0,'数据获取成功',$arr,$count);
}else if($method=="8"){//用户列表
	$sql="SELECT 
			id
			,f_user_login as user_login
			,f_user_pwd as user_pwd
			,f_name	as name
			,f_daily_push_count as daily_push_count
			,f_today_push_count as today_push_count
			,f_history_push_count as history_push_count
			,f_update_time as update_time
			,COUNT(1) OVER () AS count
		FROM t_user_info
		"
		.$sql2." order by id desc".get_limit_sql();
	$rsall=mysql_query_sql(1,$sql);
	$arr = array();
	$count=0;
	$bool=true;
	while($rs = $rsall->fetch_assoc()){
		if($bool){
			$count=(int)$rs['count'];
			$bool=false;
		}
		array_push($arr,$rs);
	}
	get_code(0,'数据获取成功',$arr,$count);
}else if($method=="9"){//用户列表添加或修改
	$id=get_str_value('id');
	$user_login=get_str_value('user_login');
	$user_pwd=get_str_value('user_pwd');
	$name=get_str_value('name');
	$daily_push_count=get_str_value('daily_push_count');
	
	if($id==""){
		$sql="select id from t_user_info
				WHERE f_user_login='$user_login'";
		$rsall=mysql_query_sql(1,$sql);
		if($rsall->fetch_assoc()['id']>0){
			//该用户已存在无法添加
			get_code(-1,'已存在该用户id');
		}else{
			//查无此用户id	可添加
			$sql="insert into t_user_info set f_user_login='$user_login',f_user_pwd='$user_pwd',f_name='$name',f_daily_push_count='$daily_push_count'";
			$rsall=mysql_query_sql(1,$sql);
			if($rsall){
				get_code(0,'添加成功');
			}else{
				get_code(-1,'添加失败');
			}
		}
	}else{
		$sql="select id from t_user_info
				WHERE f_user_login='$user_login' and id != '$id'";
		$rsall=mysql_query_sql(1,$sql);
		if($rsall->fetch_assoc()['id']>0){
			//该用户已存在无法添加
			get_code(-1,'已存在该用户id');
		}else{
			//查无此用户id	可修改
			$sql="update t_user_info set f_user_pwd='$user_pwd',f_name='$name',f_daily_push_count='$daily_push_count' where id='$id'";
			$rsall=mysql_query_sql(1,$sql);
			if($rsall){
				get_code(0,'修改成功');
			}else{
				get_code(-1,'修改失败');
			}
		}
	}
}else if($method=="10"){//设置数据获取
	$sql="SELECT
			id as id
			,f_region_name as region_name
			,f_region_sex as region_sex
			,f_tycoon_sex as tycoon_sex
			,f_tycoon_grade1 as tycoon_grade1
			,f_tycoon_grade2 as tycoon_grade2
			,f_tycoon_money1 as tycoon_money1
			,f_tycoon_money2 as tycoon_money2
		FROM t_config limit 1
		";
	$rsall=mysql_query_sql(1,$sql);
	$arr1 = array();
	$arr2 = array();
	while($rs = $rsall->fetch_assoc()){
		$arr1=$rs;
		$sql="SELECT
				f_name as name
			FROM t_region where f_name!='".$rs['region_name']."' order by id asc;
			";
		$rsall2=mysql_query_sql(1,$sql);
		if($rs['region_name']!=""){
			$arr2[]=$rs['region_name'];
		}
		while($rs2 = $rsall2->fetch_assoc()){
			$arr2[]=$rs2['name'];
		}
	}
	get_code(0,'数据获取成功',$arr2,$count,$arr1);
}else if($method=="11"){//主播过滤保存
	$region_name=get_str_value('region_name');
	$region_sex=get_str_value('region_sex');
	$sql="UPDATE t_config 
			set f_region_name='$region_name',f_region_sex='$region_sex'
		";
	$rsall=mysql_query_sql(1,$sql);
	if($rsall){
		get_code(0,'修改主播过滤成功');
	}else{
		get_code(-1,'修改主播过滤失败');
	}
}else if($method=="12"){//土豪过滤保存
	$tycoon_sex=get_str_value('tycoon_sex');
	$tycoon_grade1=get_str_value('tycoon_grade1');
	$tycoon_grade2=get_str_value('tycoon_grade2');
	$tycoon_money1=get_str_value('tycoon_money1');
	$tycoon_money2=get_str_value('tycoon_money2');
	if($tycoon_grade1>$tycoon_grade2){
		get_code(-1,'修改土豪过滤失败,等级输入错误');
	}
	if($tycoon_money1>$tycoon_money2){
		get_code(-1,'修改土豪过滤失败,金额输入错误');
	}
	$sql="UPDATE t_config 
			set f_tycoon_sex='$tycoon_sex',f_tycoon_grade1='$tycoon_grade1',f_tycoon_grade2='$tycoon_grade2',f_tycoon_money1='$tycoon_money1',f_tycoon_money2='$tycoon_money2'";
	$rsall=mysql_query_sql(1,$sql);
	if($rsall){
		get_code(0,'修改土豪过滤成功');
	}else{
		get_code(-1,'修改土豪过滤失败');
	}
}else if($method=="13"){//设置用户列表删除
	$id= get_str_value('id');
	if($id>0){
		$sql='delete from t_user_info where id='.$id;
		$rsall=mysql_query_sql(1,$sql);
		get_code(0,'删除成功!',array(),0);
	}else{
		get_code(-1,'删除失败!',array(),0);
	}
}else if($method=="14"){//首页数据获取
	$arr = array();
	$count=0;
	//主播统计 count 主播数量	count2 今日更新	count3 符合主播
	$sql="SELECT 
			count(id) as count
			,count(to_days( f_update_time ) = to_days(now()) OR NULL) as count2
			,count(f_status=1 OR NULL) as count3
		FROM t_anchor
		";
	$rsall=mysql_query_sql(1,$sql);
	while($rs = $rsall->fetch_assoc()){
		$arr['anchor']=$rs;
	}
	
	//土豪统计 count 土豪数量	count2 今日更新	count3 已取土豪	count4 剩余土豪
	$sql="SELECT 
			count(id) as count
			,count(to_days( f_update_time ) = to_days(now()) OR NULL) as count2
			,count(f_status=1 OR NULL) as count3
			,count(f_status=0 OR NULL) as count4
		FROM t_vulgar_tycoon
		";
	$rsall=mysql_query_sql(1,$sql);
	while($rs = $rsall->fetch_assoc()){
		$arr['tycoon']=$rs;
	}
	
	//列表展示		status1 已取
	$sql="
	SELECT 
		f_grade as grade 
		,count(f_status=1 OR NULL) as status1
		,count(f_status=0 OR NULL) as status2
	FROM t_vulgar_tycoon 
		GROUP BY f_grade
		ORDER BY f_grade asc
		";
	$rsall=mysql_query_sql(1,$sql);
	$rss=array();
	$array=array();
	while($rs = $rsall->fetch_assoc()){
		if($rs['grade']==0){
			array_push($array,$rs);
		}else{
			array_push($rss,$rs);
		}
	}
	for($i=1;$i<=30;$i++){
		$status1=0;
		$status2=0;
		$j1=($i-1)*10+1;
		$j2=$i*10;
		foreach($rss as $rs){
			if($rs['grade']>=$j1 and $rs['grade']<=$j2){
				$status1=$status1+$rs['status1'];
				$status2=$status2+$rs['status2'];
			}
		}
		$array2=array();
		$array2['grade']=$j1.'-'.$j2;
		$array2['status1']=$status1;
		$array2['status2']=$status2;
		array_push($array,$array2);
	}
	$arr['grade']=$array;
	get_code(0,'数据获取成功',$arr,$count);
}else if($method=="15"){//获取地区
	$sql="SELECT
			f_name as name
		FROM t_region order by id asc;
		";
	$rsall=mysql_query_sql(1,$sql);
	$arr=array();
	while($rs = $rsall->fetch_assoc()){
		$arr[]=$rs['name'];
	}
	get_code(0,'数据获取成功',$arr);
}else if($method=="16"){//日志获取
	$array= change_json(get_str_value('key'));
	$sql2="WHERE";
	if(sizeof($array)){
		if($array['username']!=''){
			if($sql2!="WHERE"){ $sql2.=' and';}
			$sql2.=" f_operation_event  like '%".$array['username']."%'";
		}
		if($array['key1']!=''){
			if($array['key1']=="1"){
				if($sql2!="WHERE"){ $sql2.=' and';}
				$sql2.=" f_type='1'";
			}else if($array['key1']=="2"){
				if($sql2!="WHERE"){ $sql2.=' and';}
				$sql2.=" f_type='2'";
			}
		}
		if($array['date1']!=''){
			if($sql2!="WHERE"){ $sql2.=' and';}
			$sql2.=" f_time>='".$array['date1']."'";
		}
		if($array['date2']!=''){
			if($sql2!="WHERE"){ $sql2.=' and';}
			$sql2.=" f_time<='".$array['date2']."'";
		}
	}
	if($sql2=="WHERE"){$sql2='';}
	$sql="SELECT 
			id
			,f_type as type
			,f_operation_event as operation_event
			,f_time as time
			,COUNT(1) OVER () AS count
		FROM t_journal
		"
		.$sql2." order by id desc".get_limit_sql();
	$rsall=mysql_query_sql(1,$sql);
	$arr = array();
	$count=0;
	$bool=true;
	while($rs = $rsall->fetch_assoc()){
		if($bool){
			$count=(int)$rs['count'];
			$bool=false;
		}
		array_push($arr,$rs);
	}
	get_code(0,'数据获取成功',$arr,$count);
}else if($method=="17"){//日志删除一天前
	$sql='delete FROM t_journal where f_time<date_add(NOW(), interval -24 hour)';
	$rsall=mysql_query_sql(1,$sql);
	get_code(0,'删除成功!',array(),0);
}else{
	get_code(3);
}





function get_limit_sql($limit_min=1,$limit_max=1000,$page_name='page',$limit_name='limit'){
	//获取页数
	$page=get_int_value($page_name);
	if($page<1){
		$page=1;
	}
	//获取每页条数
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
		echo 'SQL语句执行出错了，请联系技术员处理！<br>';
		if(C_WEB_IS_DEBUG){
			echo 'SQL：' , $sql , '<br>';
			echo '错误信息：' , $this->conn->error;
		}
		exit;
	}
	mysqli_close($conn);
	return $query;
}


function get_code($result,$error_msg='',$json=array(),$count=0,$json2=array()){
	if($error_msg==''){
		if($result==0){
			$error_msg='成功!';
		}else if($result==2){
			$error_msg='不存在该方法!';
		}else if($result==3){
			$error_msg='请输入执行的方法!';
		}else if($result==5){
			$error_msg='参数不能为空!';
		}else{
			$error_msg='未知错误!';
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
	$files = scandir($path); // 目录下所有文件名
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
	//打乱数组，重新赋予数组新的下标
	shuffle($data);
	$pic_list=array();
	for($i=0;$i<=count($data)-1;$i++){
		$pic_list[]=$imgpngs[$data[$i]];
	}
	$bg_w = 162; // 背景图片宽度 
	$bg_h = 162; // 背景图片高度 
	$background = imagecreatetruecolor($bg_w,$bg_h); // 背景图片 
	$color = imagecolorallocate($background, 255, 255, 255); // 为真彩色画布创建白色背景
	imagefill($background, 0, 0, $color); 
	imageColorTransparent($background, $color);
	$img_temp=imagecreatefromjpeg($pic_list[0]);
	//$img_temp=imagecreatefromjpeg('img/12.jpg');
	$img = imagecreatetruecolor(155, 155);   //新建一个真彩色图像
	imagecopyresampled($img, $img_temp, 0, 0, 0, 0, 155,155, imagesx($img_temp), imagesy($img_temp));//调整大小
	$background_x=(1)*3;
	$background_y=(1)*3;
	imagecopymerge($background, $img, $background_x, $background_y, 0,0, imagesx($img), imagesy($img), 100);
	return $background;
}

//创建文件夹	dir文件夹路径
function mkdirs($dir, $mode = 0777){
    if (is_dir($dir) || @mkdir($dir, $mode)) return TRUE;
    if (!mkdirs(dirname($dir), $mode)) return FALSE;
    return @mkdir($dir, $mode);
}

//data	图片或者二维码base64		二维码内容
//url	上传路径
function img_download($data,$url_jpg=''){
	$array=array();
	if (preg_match('/^(data:\s*image\/(\w+);base64,)/', $data, $result)){
		$md5=md5(uuid());
		//header('content-type:image/png');//显示图片
		//echo $img;
		file_put_contents($url_jpg, base64_decode(str_replace($result[1],'', $data)));//写出图片
		$array['code']=1;
		$array['msg']="成功";
		$array['data']=$md5.'.jpg';
		return $array;
	}
	$array['code']=2;
	$array['msg']="图片有误";
	return $array;
}




function get_real_ip(){
    $ip=FALSE;
    //客户端IP 或 NONE
    if(!empty($_SERVER["HTTP_CLIENT_IP"])){
        $ip = $_SERVER["HTTP_CLIENT_IP"];
    }

    //多重代理服务器下的客户端真实IP地址（可能伪造）,如果没有使用代理，此字段为空

    if (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
        $ips = explode (", ", $_SERVER['HTTP_X_FORWARDED_FOR']);
        if ($ip) { array_unshift($ips, $ip); $ip = FALSE; }
        for ($i = 0; $i < count($ips); $i++) {
            if (!eregi ("^(10│172.16│192.168).", $ips[$i])) {
                $ip = $ips[$i];
                break;
            }
        }
    }
    //客户端IP 或 (最后一个)代理服务器 IP
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


//取出中间文本
function getSubstr($str, $leftStr, $rightStr){
    $left = strpos($str, $leftStr);
    //echo '左边:'.$left;
    $right = strpos($str, $rightStr,$left);
    //echo '<br>右边:'.$right;
    if($left < 0 or $right < $left) return '';
    return substr($str, $left + strlen($leftStr), $right-$left-strlen($leftStr));
}

//取出右边文本
function getSubstry($str, $leftStr){
    $left = strpos($str, $leftStr);
 return substr($str, $left + strlen($leftStr));
}
//取出左边文本
function getSubstrz($str, $rightStr){
    $right = strpos($str, $rightStr);
    return substr($str, 0, $right);
}

//移除内容里所有的html标签
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

//从表单提交过来的数据中获取参数的整数值
function FPostInt($a){
	$r=intval(trim($_POST[$a]));
	return $r;
}
function FGetStr($a){
	$r=FSHtmlEncode(trim($_GET[$a]));
	return $r;
}

//从地址栏获取参数的整数值
function FGetInt($a){
	$r=intval(trim($_GET[$a]));
	return $r;
}


//$string  :需要加密解密的字符串
//$operation:判断是加密还是解密:E:加密  D:解密
//$key   :加密的钥匙(密匙);
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