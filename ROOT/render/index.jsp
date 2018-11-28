<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>弹幕墙</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="screen_container" id="danmu"></div>
    <div class="screen_toolbar">
        <input id="screenBulletText" type="text" placeholder="请输入弹幕内容"/>
        <button class="send">发射</button>
        <button class="full">全屏幕</button>
    </div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="main.js"></script>
</html>