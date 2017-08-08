<?php
session_start();

//随机生成的字符串
function random($len) {
    $strs = "";
    for ($i = 0; $i < $len; $i++) {
        $strs .= rand(0, 9);

    }
    return $strs;
}
$str = random(4);
//保存随机字符
//

//$s=$_SESSION["verification"];
//验证码图片的宽度
$width  = 60;

//验证码图片的高度
$height = 25;

//声明需要创建的图层的图片格式
@ header("Content-Type:image/png");

//创建一个图层
$im = imagecreate($width, $height);

//背景色
$back = imagecolorallocate($im, 0xFF, 0xFF, 0xFF);

//模糊点颜色
$pix  = imagecolorallocate($im, 173, 216, 230);

//字体色
$font = imagecolorallocate($im, 0, 0, 255);

//绘模糊作用的点
for ($i = 0; $i < 1000; $i++) {
    imagesetpixel($im, rand(0, $width), rand(0, $height), $pix);
}
//随机绘制两条虚线，起干扰作用
$style = array ($pix,$pix,$pix,$pix,$pix,
    $font,$font,$font,$font,$font
);
imagesetstyle($im, $style);
$y1 = rand(0, $height);
$y2 = rand(0, $height);
$y3 = rand(0, $height);
$y4 = rand(0, $height);
imageline($im, 0, $y1, $width, $y3, IMG_COLOR_STYLED);
imageline($im, 0, $y2, $width, $y4, IMG_COLOR_STYLED);
//输出字符
imagestring($im, 5, 7, 5, $str, $font);

//输出矩形
imagerectangle($im, 0, 0, $width -1, $height -1, $font);

//输出图片
imagepng($im);

imagedestroy($im);

$_SESSION["verification"]=$str;

?>