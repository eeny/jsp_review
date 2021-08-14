<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UI프로젝트 로그인화면 수정중</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <style>
        *, html, body {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        html, body {
            height: 100%;
            font-family: 'Noto Sans KR', sans-serif;
        }
        #wrap {
            height: 100%;
        }
        a {
            text-decoration: none;
            color: black;
        }
        .emptybox {
            width: 100%;
            height: 110px;
            background-color: white;

        }
        nav {
            width: 100%;
        }
        nav .big_nav {
            width: 100%;
            height: 110px;
            background-color: rgba(255, 255, 255, 0.95);
            position: fixed;
            top: 0;
            left: 0;
            z-index: 2;
        }
        .big_nav img {
            width: 200px;
            margin: 28px 20px;
        }
        .big_nav ul {
            width: 740px;
            height: 90px;
            display: flex;
            flex-flow: row wrap;
            justify-content: space-around;
            position: absolute;
            top: 10px;
            left: 30%;
        }
        .big_nav ul li {
            list-style: none;
            margin-top: 15px;
            font-size: 20px;
        }
        .big_nav ul li span.under {/*초록색 동그라미*/
            width: 10px;
            height: 10px;
            border-radius: 10px 10px 10px 10px;
            display: block;
            margin: 12px auto;
            background-color: rgb(197, 197, 197);
            transition: all 0.3s;
        }
        .big_nav ul li:hover span:first-child {
            color: rgb(50, 207, 50);
        }
        .big_nav ul li:hover span.under {
            width: 35px;
            background-color: rgb(50, 207, 50);
        }
        .big_nav ul::before {/*회색 실선*/
            content: "";
            width: 600px;
            height: 1px;
            background-color: rgb(197, 197, 197);
            z-index: -1;
            position: absolute;
            top: 61px;
            left: 77px;
        }
        .big_nav a:nth-child(3) {/*로그인 아이콘*/
            font-size: 25px;
            color: rgba(156, 163, 154, 0.3);
            position: absolute;
            left: 97%;
        }
        .big_nav a:nth-child(3):hover {
            color: rgb(50, 207, 50);
        }
        .logo img {
            width: 100%;
        }
        .topimg {
            width: 100%;
            height: 40%;
            background-image: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0,0.4)), url("login_bg.jpg");
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            color: white;
            text-align: center;
            font-size: 20px;
            display: table;
        }
        .topimg p {
            width: 100%;
            display: table-cell;
            vertical-align: middle;
            line-height: 2.5;
            letter-spacing: 2px;
        }
        .topimg b {
            font-size: 40px;
        }
        .login {
            width: 100%;
        }
        .login form {
            width: 390px;
            height: 600px;
            margin: 50px auto;
            padding: 60px 0;
            border: 1px solid rgba(172, 172, 172, 0.541);
            box-shadow: 7px 7px 20px rgba(172, 172, 172, 0.5);
        }
        .login label {
            width: 70%;
            margin: 0 auto;
            display: block;
            font-size: 20px;
            font-weight: bold;
            color: rgb(48, 48, 48);
        }
        .login input[type=text], input[type=password] {
            width: 70%;
            height: 45px;
            margin: 3% auto;
            padding: 10px;
            border: 1px solid rgba(172, 172, 172, 0.541);
            border-radius: 5px 5px 5px 5px;
            display: block;
            font-size: 20px;
        }
        input[type=text]:focus {
            outline: none;
            border: 1px solid rgba(68, 187, 68, 0.7);
            box-shadow: 0px 0px 5px 3px rgba(68, 187, 68, 0.3);
        }
        input[type=password]:focus {
            outline: none;
            border: 1px solid rgba(68, 187, 68, 0.7);
            box-shadow: 0px 0px 5px 3px rgba(68, 187, 68, 0.3);
        }
        .login div {
            margin: 5%;
            text-align: center;
        }
        .login a {
            font-size: 16px;
            color: rgb(146, 144, 144);
            padding: 0 3%;
        }
        .login a:nth-child(2) {
            border-left: 1px solid rgb(179, 177, 177);
            border-right: 1px solid rgb(179, 177, 177);
        }
        .login input[type=button] {
            width: 40%;
            height: 60px;
            margin: 10% auto;
            display: block;
            font-size: 20px;
            font-weight: bold;
            color: white;
            border: none;
            border-radius: 5px 5px 5px 5px;
            background-color: rgb(50, 207, 50);
            cursor: pointer;
        }
        input[type=button]:hover {
            background-color: rgb(41, 151, 41);
        }
        footer {
            width: 100%;
            padding: 3%;
            padding-bottom: 6%;
            background-color: rgb(51, 51, 51);
            color: rgba(179, 177, 177, 0.877);
            font-size: 14px;
            display: flex;
            flex-flow: row wrap;
            justify-content: space-between;
        }
        footer .logo {
            width: 200px;
            height: 100px;
            margin: 0 auto;
        }
        footer .companyInfo {
            width: 60%;
            text-align: left;
        }
        .companyInfo p:nth-child(3) {
            color: rgba(94, 93, 93, 0.877);
            margin-top: 20px;
        }
        .question {
            width: 200px;
            height: 60px;
            margin: 0 auto;
            border: 1px solid white;
            text-align: center;
            display: table;
        }
        .question a {
            color: white;
            font-size: 16px;
            font-weight: 600;
            display: table-cell;
            vertical-align: middle;
        }
        .question:hover {
            background-color: white;
        }
        .question:hover a {
            color: rgb(51, 51, 51);
        }
    </style>
</head>
<body>
    <div id="wrap">
        <div class="emptybox"></div>
        <nav>
            <div class="big_nav">
                <img src="logo_black.png" alt="logo" class="logo">
                <ul>
                    <li><a href=""><span>회사소개</span><span class="under"></span></a></li>
                    <li><a href=""><span>프로젝트</span><span class="under"></span></a></li>
                    <li><a href=""><span>공지사항</span><span class="under"></span></a></li>
                    <li><a href=""><span>문의</span><span class="under"></span></a></li>
                    <li><a href="UIProject_login.html"><span>그룹웨어</span><span class="under"></span></a></li>
                </ul>
            </div>
        </nav>
        
        <header class="topimg">
            <p><b>로그인</b><br>INIT 그룹웨어에 접속할 계정을 입력해주세요.</p>
        </header>

        <section class="login">
            <form action="">
                <label for="">아이디</label>
                <input type="text">
                <label for="">비밀번호</label>
                <input type="password">
                <div>
                    <a href="">아이디 찾기</a>
                    <a href="">비밀번호 찾기</a>
                    <a href="">회원가입</a>
                </div>
                <input type="button" value="로그인">
            </form>
        </section>

        <footer class="page">
            <div class="logo"><img src="logo_white.png" alt="logo"></div>
            <div class="companyInfo">
                <p>(주)INIT</p>
                <p>부산광역시 부산진구 중앙대로 749, 혜도빌딩 4층&nbsp;&nbsp;&nbsp;Tel.051-912-1000</p>
                <p>COPYRIGHT INNOVIS SYSTEM ALL RIGHS RESERVED.</p>
            </div>
            <div class="question"><a href="">문의 바로가기</a></div>
        </footer>
    </div>

    <script>
        $(function() {
            // 로고 누르면 메인 화면으로 이동
            $(".logo").click(function() {
                location.href = "UIproject_main.html";
            });
        });
    </script>
</body>
</html>