<?php
 /*
  图片验证码 Powered By KASON test <a href=" http://www.hzhuti.com/nokia/c6/"> http://www.hzhuti.com/nokia/c6/</a>   */
  session_start();
  $num=4;//验证码个数
  $width=130;//验证码宽度
  $height=35;//验证码高度
  $code=' ';
  for($i=0;$i<$num;$i++)//生成验证码
  {
   switch(rand(0,2))
   {
    case  0:$code[$i]=chr(rand(48,57));break;//数字
    case  1:$code[$i]=chr(rand(65,90));break;//大写字母
    case  2:$code[$i]=chr(rand(97,122));break;//小写字母
   }
  }
  $_SESSION["VerifyCode"]=strtolower($code);
  $image=imagecreate($width,$height);
  imagecolorallocate($image,255,255,255);
  for($i=0;$i<80;$i++)//生成干扰像素
  {
   $dis_color=imagecolorallocate($image,rand(0,2555),rand(0,255),rand(0,255));
   imagesetpixel($image,rand(1,$width),rand(1,$height),$dis_color);
  }
  for($i=0;$i<$num;$i++)//打印字符到图像
  {
   $char_color=imagecolorallocate($image,rand(0,2555),rand(0,255),rand(0,255));
   //imagechar($image,60,($width/$num)*$i,rand(0,5),$code[$i],$char_color);
   
    $font = dirname(__FILE__).'/comicz.ttf';
    $font_size=18;
    $wing=0;
    $left=($width/$num)*$i+8;
    $high=26;
    imagettftext($image, $font_size, $wing, $left,$high, $char_color, $font, $code[$i]);
  }
for($i=0;$i<10;$i++){
	$lineColor=imagecolorallocate($image,rand(50,300),rand(50,300),rand(50,300));
	imageline($image,rand(1,129),rand(1,34),rand(1,129),rand(1,34),$lineColor);//画一条线段
}
  header("Content-type:image/png");
  imagepng($image);//输出图像到浏览器
  imagedestroy($image);//释放资源
?> 