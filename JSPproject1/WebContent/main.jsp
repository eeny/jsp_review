<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UI프로젝트 메인화면</title>
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
            height: 60px;
            background-color: white;
            position: absolute;
            top: 0;
            z-index: 1;
        }
        header {
            width: 100%;
            height: 100vh;
            background-image: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0,0.7)), url("header.jpg");
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            position: relative;
        }
        header .logo {
            width: 200px;
            margin: 0 auto;
            padding-top: 120px;
            display: none;
        }
        header .header_p_wrap {
            width: 100%;
            height: 40%;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
        }
        header .header_p_wrap div:nth-child(1) {
            width: 70%;
            height: 35%;
            margin: 0 auto;
            text-align: center;
            font-size: 40px;
            line-height: 1.2;
            font-weight: bold;
            color: white;
            word-break: keep-all;
            display: table;
        }
        .middlebar {/* 중간 흰색 바 모양 */
            /* width: 70px; */
            width: 1px;
            height: 2px;
            background-color: white;
            margin: 3% auto;
        }
        header .header_p_wrap div:nth-child(3) {
            width: 60%;
            height: 35%;
            margin: 0 auto;
            text-align: center;
            font-size: 18px;
            letter-spacing: -2px;
            word-spacing: 3px;
            word-break: keep-all;
            color: white;
            display: table;
        }
        header .header_p_wrap div:nth-child(4) {
            width: 60%;
            height: 16%;
            margin: 0 auto;
            text-align: center;
            font-size: 15px;
            word-spacing: 3px;
            color: white;
            display: table;
        }
        header div:nth-child(3).scroll_down {/*밑으로 표시 박스*/
            width: 30px;
            height: 50px;
            border: 1px solid white;
            border-radius: 30px 30px 30px 30px;
            position: absolute;
            left: calc(50% - 25px);
            bottom: 50px;
            display: none;
        }
        .scroll_down div {/*안에서 움직이는 동그라미*/
            width: 7px;
            height: 7px;
            border-radius: 7px 7px 7px 7px;
            background-color: white;
            position: absolute;
            left: calc(50% - 3.5px);
            animation: down 1s infinite;
        }
        .header_p {
            display: table-cell;
            vertical-align: middle;
        }
        .logo img {
            width: 100%;
        }
        nav {
            width: 100%;
        }
        nav .small_nav {
            width: 100%;
            height: 60px;
            background-color: rgba(255, 255, 255, 0.95);
            position: fixed;
            top: 0;
            left: 0;
            font-size: 30px;
            color: rgb(50, 207, 50);
            z-index: 2;
        }
        .small_nav img {
            height: 40px;/*가로 비율은 알아서*/
            margin: 10px 20px;
            cursor: pointer;
        }
        .small_nav i {
            position: absolute;
            top: 15px;
            right: 20px;
            cursor: pointer;
        }
        nav .big_nav {
            width: 100%;
            height: 110px;
            background-color: rgba(255, 255, 255, 0.95);
            position: fixed;
            top: 0;
            left: 0;
            display: none;
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
        section {
            width: 100%;
            /* height: 100%; */
        }
        .sec1 {
            background-image: linear-gradient(to bottom, rgba(27, 54, 85, 0.9), rgba(33, 69, 110, 0.5)), url("sec1_bg.jpg");
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            padding: 20px 0;
        }
        .sec1 article {
            width: 90%;
            margin: 0 auto;
            padding: 20px 0;
            color: white;
            font-size: 14px;
            text-align: center;
            word-break: keep-all;
        }
        .sec1 article:first-child {
            font-size: 27px;
            line-height: 1.2;
            word-break: keep-all;
            position: relative;
        }
        .sec1atc2, .sec1atc3 {
            border-bottom: 1px solid rgba(172, 172, 172, 0.541);
        }
        .num {
            font-size: 50px;
            font-weight: bold;
        }
        .sec1 article div:last-child {
            margin-top: 20px;
        }
        .sec2 {
            text-align: center;
            color: black;
        }
        .sec2 .sec2atc1 {
            font-size: 30px;
            margin-top: 5%;
        }
        .sec2 .sec2atc2 {
            font-size: 14px;
            margin-top: 2%;
            margin-bottom: 5%;
        }
        .sec2atc3 {
            width: 95%;
            margin: 0 auto;
            color: white;
            font-size: 14px;
            text-align: center;
        }
        .sec2atc3 div {
            width: 100%;
            height: 200px;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            position: relative;
        }
        .sec2atc3 i {
            font-size: 35px;
            margin: 2%;
        }
        .sec2atc3 p {
            margin: 1%;
        }
        .sec2atc3 b {
            font-size: 16px;
        }
        .sec2atc3>div div {
            width: 100%;
            height: auto;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
        }
        .sec2atc3 div.sec2atc3img1 {
            background-image: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0,0.4)), url("sec2_bg1.jpg");
        }
        .sec2atc3 div.sec2atc3img2 {
            background-image: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0,0.4)), url("sec2_bg2.jpg");
        }
        .sec2atc3 div.sec2atc3img3 {
            background-image: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0,0.4)), url("sec2_bg3.jpg");
        }
        .sec2atc3 div.sec2atc3img4 {
            background-image: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0,0.4)), url("sec2_bg4.jpg");
        }
        .sec2atc4 {
            width: 100%;
            margin-top: 5%;
            background-color: rgb(50, 207, 50);
            color: white;
            font-size: 14px;
            display: flex;
            flex-flow: row wrap;
            justify-content: space-between;
        }
        .sec2atc4 b {
            font-size: 20px;
        }
        .sec2atc4 p {
            letter-spacing: -2px;
            word-spacing: 3px;
        }
        .sec2atc4 div:nth-child(1) {
            width: 65%;
            margin: 5% auto;
        }
        .sec2atc4 div:nth-child(2) {
            width: 30%;
            margin: 5% auto;
            border: 1px solid white;
            text-align: center;
            display: table;
            table-layout: fixed;
        }
        .sec2atc4 div:nth-child(2):hover {
            color: rgb(50, 207, 50);
            background-color: white;
        }
        .sec2atc4 div:nth-child(2):hover a {
            color: rgb(50, 207, 50);
        }
        .sec2atc4 div:nth-child(2) a {
            width: 62%;
            display: table-cell;
            vertical-align: middle;
            color: white;
            font-size: 14px;
            font-weight: 600;
        }
        .sec2atc4 div:nth-child(2) i {
            width: 38%;
            vertical-align: middle;
            display: none;
        }
        .sec3 {
            position: relative;
        }
        .sec3atc1 {
            text-align: center;
            font-size: 14px;
        }
        .sec3atc1 p:first-child {
            margin: 5%;
            font-size: 30px;
            font-weight: bold;
        }
        .sec3atc1 p:last-child {
            margin: 5%;
            word-break: keep-all;
        }
        .sec3atc2 {
            width: 100%;
            height: 550px;
            position: relative;
            overflow: hidden;
        }
        .sec3atc2>div.movebox {
            width: 400%;
            height: 100%;
            display: flex;
            position: absolute;
        }
        .movebox>div {
            width: 100%;
        }
        .sec3atc2img {
            width: 300px;
            height: 300px;
            border-radius: 70%;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            margin: 3% auto;
        }
        .sec3atc2img1 {
            background-image: url("sec3_bg1.jpg");
        }
        .sec3atc2img2 {
            background-image: url("sec3_bg2.jpg");
        }
        .sec3atc2img3 {
            background-image: url("sec3_bg3.jpg");
        }
        .sec3atc2img4 {
            background-image: url("sec3_bg4.jpg");
        }
        .movebox p {
            margin: 3%;
            font-size: 14px;
        }
        .movebox b {
            font-size: 20px;
        }
        .movebox a {
            width: 100px;
            height: 40px;
            margin: 3%;
            display: block;
            border: 1px solid rgb(50, 207, 50);
            border-radius: 50px;
            color: rgb(50, 207, 50);
            font-size: 15px;
            text-align: center;
            line-height: 37px;
        }
        .sec3atc3 {
            width: 100%;
            text-align: right;
            position: absolute;
            bottom: 0;
        }
        .sec3atc3 button {
            width: 40px;
            height: 40px;
            margin-right: 3%;
            margin-bottom: 5%;
            border: 1px solid rgba(66, 66, 66, 0.541);
            color: rgba(66, 66, 66, 0.541);
            font-size: 25px;
            border-radius: 70%;
            background-color: transparent;
            cursor: pointer;
        }
        .sec3atc3 button:hover {
            border-color: rgb(50, 207, 50);
            color: rgb(50, 207, 50);
            background-color: rgba(219, 211, 211, 0.3);
        }
        .sec4 {
            height: 80vh;
            text-align: center;
            font-size: 14px;
            color: white;
            background-image: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0,0.7)), url("sec4_bg.jpg");
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            position: relative;
        }
        .sec4atc1 {
            padding-top: 5%;
            font-size: 30px;
            font-weight: bold;
        }
        .sec4atc2 {
            margin: 5% auto;
        }
        .sec4atc3 {
            width: 95%;
            display: flex;
            flex-flow: row wrap;
            justify-content: space-between;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, 0%);
            opacity: 0;
        }
        .sec4atc3 div {
            width: 32%;
            height: 110px;
            margin: 0.5% auto;
            line-height: 100px;
            border: 1px solid rgba(172, 172, 172, 0.541);
            background-color: white;
        }
        .sec4atc3 img {
            width: 50%;
            height: 40%;
            vertical-align: middle;
            mix-blend-mode: luminosity;
        }
        .sec4atc3 div:hover img {
            mix-blend-mode: normal;
        }
        .sec5 {
            background-image: linear-gradient(rgba(48, 54, 105, 0.5), rgba(48, 54, 105, 0.5)), url("sec5_bg.jpg");
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            display: flex;
            flex-flow: row wrap;
        }
        .sec5atc1 {
            width: 30%;
            background-color: rgba(50, 207, 50, 0.5);
            font-size: 14px;
            color: white;
            position: relative;
        }
        .sec5atc1 div {
            width: 100%;
        }
        .sec5atc1 p {
            margin: 10%;
        }
        .sec5atc1 b {
            font-size: 30px;
        }
        .sec5atc1 .history {
            width: 50%;
            height: 200px;
            margin: 0 10%;
            margin-top: 70px;
            white-space: nowrap;
            overflow-y: scroll;
            -ms-overflow-style: none;
        }
        .history::-webkit-scrollbar {
            display: none;
        }
        .sec5atc1 a {
            padding: 20%;
            display: block;
            color: white;
        }
        .sec5atc1 button {
            font-size: 30px;
            color: white;
            border: none;
            background-color: transparent;
            position: absolute;
            left: 20%;
        }
        .sec5atc1 .prevbtn2 {
            bottom: 270px;
        }
        .sec5atc1 .nextbtn2 {
            bottom: 40px;
        }
        .sec5atc2 {
            width: 70%;
            color: white;
            position: relative;
        }
        .sec5atc2>div:first-child {
            font-size: 30px;
            font-weight: bold;
            margin: 7%;
        }
        .sec5atc2>div:nth-child(2) {
            font-size: 16px;
            font-weight: bold;
            margin: 7%;
            position: absolute;
            top: 0;
            right: 0;
        }
        .sec5atc2 .timeline {
            width: 90%;
            height: 250px;
            margin: 70px auto;
            position: relative;
            white-space: nowrap;
            overflow-y: scroll;
            -ms-overflow-style: none;
        }
        .timeline::-webkit-scrollbar {
            display: none;
        }
        .timeline div {
            width: 100%;
        }
        .timeline::after {/*흰색 가운데 줄*/
            content: "";
            width: 450%;
            height: 3px;
            position: absolute;
            background-color: white;
            top: 50%;
            left: 0;
            transform: translate(-50%, -50%);
        }
        .timeline .container {
            width: 30%;
            padding: 30px 0;
            position: relative;
            display: inline-block;
        }
        .timeline .container::after {/*가운데 동그라미*/
            content: "";
            width: 15px;
            height: 15px;
            background-color: white;
            border-radius: 50%;
            position: absolute;
        }
        .timeline .up::after {
            top: 117px;
        }
        .timeline .down::after {
            top: -8px
        }
        .timeline .up {
            top: 0;
        }
        .timeline .down {
            top: 50%;
        }
        .sec6 {
            font-size: 14px;
            text-align: center;
        }
        .sec6atc1 p {
            margin: 5%;
        }
        .sec6atc1 b {
            font-size: 30px;
        }
        .sec6atc2 {
            width: 100%;
            height: 500px;
            background-image: url("sec6_img.png");
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }
        .sec6atc3 {
            width: 100%;
            padding-top: 2%;
            padding-bottom: 8%;
            font-size: 14px;
            display: flex;
            flex-flow: row wrap;
            justify-content: space-between;
        }
        .sec6atc3 table {
            width: 100%;
            text-align: left;
        }
        .sec6atc3 th {
            width: 20%;
            padding: 2%;
            vertical-align: top;
        }
        .sec6atc3 td {
            padding: 2%;
        }
        footer {
            width: 100%;
            padding: 5%;
            background-color: rgb(51, 51, 51);
            color: rgba(179, 177, 177, 0.877);
            font-size: 14px;
        }
        footer .logo {
            width: 150px;
            height: 40px;
            margin: 0 auto;
        }
        footer .companyInfo {
            text-align: center;
            margin-top: 20px;
        }
        .companyInfo p:nth-child(3) {
            color: rgba(94, 93, 93, 0.877);
            margin: 20px;
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
        .goTop {/*맨위로 가는 화살표*/
            width: 50px;
            height: 50px;
            border: 1px solid rgba(172, 172, 172, 0.541);
            background-color: transparent;
            position: fixed;
            bottom: 10px;
            right: 10px;
            text-align: center;
            font-size: 30px;
            color: rgba(172, 172, 172, 0.541);
            display: none;
        }
        .goTop:hover {
            color: white;
            background-color: rgba(50, 207, 50, 0.2);
            cursor: pointer;
            display: none;
        }
        p.test {
            position: fixed;
            bottom: 0;
            color: white;
            font-size: 40px;
        }
        
        /*반응형 큰화면*/
        @media (min-width: 1000px) {
            .emptybox {
                display: none;
            }
            nav .small_nav {
                display: none;
            }
            header .logo {
                padding-top: 50px;
            }
            header .header_p_wrap div:nth-child(1) {
                font-size: 65px;
            }
            header .header_p_wrap div:nth-child(3) {
                font-size: 25px;
            }
            header .header_p_wrap div:nth-child(4) {
                font-size: 23px;
            }
            .sec1 {
                display: flex;
                flex-flow: row wrap;
                justify-content: space-between;
                padding-top: 100px;
                padding-bottom: 100px;
            }
            .sec1 article {
                width: 30%;
                padding-right: 30px;
                font-size: 18px;
            }
            .sec1 article:first-child {
                width: 100%;
                margin-bottom: 50px;
                font-size: 45px;
            }
            .sec1atc2, .sec1atc3 {
                border-bottom: 0;
                border-right: 1px solid rgba(172, 172, 172, 0.541);
            }
            .sec2atc1 b {
                font-size: 45px;
            }
            .sec2 .sec2atc2 {
                font-size: 20px;
                color: rgba(0, 0, 0, 0.644);
                margin-bottom: 3%;
            }
            .sec2atc3 {
                width: 75%;
                height: 500px;
                font-size: larger;
                word-break: keep-all;
                position: relative;
            }
            .sec2atc3 div {
                width: 25%;
                height: 100%;
                position: absolute;
            }
            .sec2atc3 div.sec2atc3img1 {
                background-image: linear-gradient(rgba(0, 0, 0, 0), rgba(0, 0, 0, 0)), url("sec2_bg1.jpg");
            }
            .sec2atc3 div.sec2atc3img1:hover {
                background-image: linear-gradient(rgba(50, 207, 50, 0.9), rgba(50, 207, 50, 0.9)), url("sec2_bg1.jpg");
            }
            .sec2atc3 div.sec2atc3img2 {
                background-image: linear-gradient(rgba(0, 0, 0, 0), rgba(0, 0, 0, 0)), url("sec2_bg2.jpg");
                left: 25.5%;
            }
            .sec2atc3 div.sec2atc3img2:hover {
                background-image: linear-gradient(rgba(50, 207, 50, 0.9), rgba(50, 207, 50, 0.9)), url("sec2_bg2.jpg");
            }
            .sec2atc3 div.sec2atc3img3 {
                background-image: linear-gradient(rgba(0, 0, 0, 0), rgba(0, 0, 0, 0)), url("sec2_bg3.jpg");
                left: 51%;
            }
            .sec2atc3 div.sec2atc3img3:hover {
                background-image: linear-gradient(rgba(50, 207, 50, 0.9), rgba(50, 207, 50, 0.9)), url("sec2_bg3.jpg");
            }
            .sec2atc3 div.sec2atc3img4 {
                background-image: linear-gradient(rgba(0, 0, 0, 0), rgba(0, 0, 0, 0)), url("sec2_bg4.jpg");
                left: 76.5%;
            }
            .sec2atc3 div.sec2atc3img4:hover {
                background-image: linear-gradient(rgba(50, 207, 50, 0.9), rgba(50, 207, 50, 0.9)), url("sec2_bg4.jpg");
            }
            .sec2atc3 i {
                font-size: 50px;
            }
            .sec2atc3 p {
                margin: 3%;
            }
            .sec2atc3 b {
                font-size: larger;
            }
            .upDiv div {
                opacity: 0;
                transition: all 0.5s;
            }
            .upDiv:hover div {
                opacity: 1;
            }
             .sec2atc4 b {
                font-size: 40px;
             }
             .sec2atc4 p {
                font-size: 17px;
                letter-spacing: normal;
                word-spacing: normal;
             }
             .sec2atc4 div:nth-child(1) {
                width: 35%;
                margin: 2% auto;
             }
             .sec2atc4 div:nth-child(2) {
                width: 17%;
                height: 65px;
                margin: auto;
             }
             .sec2atc4 div:nth-child(2) a {
                font-size: 18px;
             }
             .sec2atc4 div:nth-child(2) i {
                font-size: 50px;
                padding: 0 auto;
                display: table-cell;
             }
             .sec3atc1 {
                font-size: 20px;
             }
             .sec3atc1 p:first-child {
                font-size: 40px;
                margin: 3%;
             }
             .sec3atc1 p:last-child {
                margin: 0;
             }
             .sec3atc2 {
                height: 750px;
             }
             .sec3atc2img {
                width: 600px;
                height: 600px;
             }
             .movebox p {
                font-size: 20px;
                position: absolute;
                top: 80px;
             }
             .movebox b {
                font-size: 30px;
             }
             .movebox a {
                width: 170px;
                height: 50px;
                font-size: 20px;
                line-height: 50px;
                position: absolute;
                top: 220px;
             }
             .sec3atc3 {
                bottom: 35%;
             }
             .sec3atc3 div {
                display: flex;
                flex-flow: row wrap;
                justify-content: space-between;
             }
             .sec3atc3 button {
                 width: 90px;
                 height: 90px;
                 margin: 0 3%;
                font-size: 35px;
             }
             .sec4 {
                 height: 95vh;
                 font-size: 20px;
             }
             .sec4atc1 {
                 padding-top: 3%;
                 font-size: 40px;
             }
             .sec4atc2 {
                 margin: 2%;
             }
             .sec4atc3 div {
                width: 24%;
                height: 160px;
                line-height: 160px;
             }
             .sec4atc3 img {
                width: 50%;
                height: 40%;
             }
             .sec5atc1 {
                font-size: 20px;
             }
             .sec5atc1 p {
                 margin: 5%;
             }
             .sec5atc1 b {
                 font-size: 40px;
             }
             .sec5atc1 .history {
                 margin: 0;
                 margin-top: 10%;
             }
             .sec5atc1 a {
                 padding: 5%;
                 padding-left: 10%;
             }
             .sec5atc1 button {
                 left: 7%;
             }
             .sec5atc1 .prevbtn2 {
                 bottom: 320px;
             }
             .sec5atc1 .nextbtn2 {
                 bottom: 80px;
             }
             .sec5atc2>div:first-child {
                 font-size: 40px;
             }
             .sec5atc2>div:nth-child(2) {
                 font-size: 20px;
             }
             .sec6 {
                 font-size: 20px;
             }
             .sec6atc1 p {
                 margin: 2%;
             }
             .sec6atc1 b {
                 font-size: 40px;
             }
             .sec6atc3 {
                 font-size: 16px;
                 justify-content: center;
             }
             .sec6atc3 table {
                 width: 35%;
             }
             .sec6atc3 th {
                 width: 15%;
             }
             footer {
                 padding: 3%;
                 padding-bottom: 6%;
                 display: flex;
                 flex-flow: row wrap;
                 justify-content: space-between;
             }
             footer .logo {
                 width: 200px;
                 height: 100%;
             }
             footer .companyInfo {
                 width: 60%;
                 margin-top: 0;
                 text-align: left;
             }
             .companyInfo p:nth-child(3) {
                 margin: 0;
                 margin-top: 20px;
             }
        }

        /*마우스 굴리는 애니메이션*/
        @keyframes down {
            from {
                top: 10px;
            }
            to {
                top: 30px;
                opacity: 0;
            }
        }
    </style>
</head>
<body>
    <div id="wrap">
        <div class="emptybox"></div>
        <nav>
            <div class="small_nav">
                <img src="logo_black.png" alt="logo" class="logo">
                <i class="fas fa-bars"></i>
                <!--메뉴 넣기-->
            </div>
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

        <header class="page">
            <div class="logo"><img src="logo_white.png" alt="logo"></div>
            <div class="header_p_wrap">
                <div><p class="header_p">더 나은 가치에 대해 고민합니다.</p></div>
                <div class="middlebar"></div>
                <div><p class="header_p">작은 울타리가 아닌 더 넓은 세상에서 우리의 꿈을 펼칠 수 있도록, <br>INIT의 IT기술과 무한한 상상력으로 세상의 변화를 이끌어 갑니다.</p></div>
                <div><p class="header_p">Innovation Business Partner</p></div>
            </div>
            <div class="scroll_down"><div></div></div>
        </header>

        <section class="page sec1">
            <article class="sec1atc1"><p>완벽한 구축과제 수행, 철저한 유지관리로 이루어낸 성과<br>INIT의 기술력은 숫자로 증명됩니다.</p></article>
            <article class="sec1atc2">
                <div class="num"><p class="plus800">0</p></div>
                <div class="middlebar"></div>
                <div><p><b>시스템 구축</b></p></div>
                <div><p>공기업, 정부기관, 병원, 헬스케어, 기업체 등 다양한 환경과 규모에서 완벽한<br> 시스템 구축의 기술력을 자랑합니다.</p></div>
            </article>
            <article class="sec1atc3">
                <div class="num"><p class="plus200">0</p></div>
                <div class="middlebar"></div>
                <div><b>INIT-CARE</b></div>
                <div><p>고객사 유지관리 시스템으로 INIT의 기술력과 철저한 유지관리로<br>사전예방율을 높이고 장애 발생 시 ‘ONE-STOP’ 서비스를 시행하고 있습니다.</p></div>
            </article>
            <article class="sec1atc4">
                <div class="num"><p>0</p></div>
                <div class="middlebar"></div>
                <div><b>실패 혹은 실수</b></div>
                <div><p>구축 실패 혹은 시스템 장애 횟수 INIT를 대변하는 많은 숫자들 중 결코<br>변하지 않을 단 하나의 숫자입니다.</p></div>
            </article>          
        </section>

        <section class="page sec2">
            <article class="sec2atc1"><p><b>사업분야</b></p></article>
            <article class="sec2atc2"><p>INIT 핵심 사업분야를 소개합니다.</p></div>
            <article class="sec2atc3">
                <div class="sec2atc3img1 upDiv">
                    <div>
                        <i class="fas fa-network-wired"></i>
                        <p><b>통합 IT 인프라 구축</b></p>
                        <p>다양한 시장 경험을 토대로 고객고유의 환경에 대한<br>단 하나의 카운셀링 서비스를 제공합니다.</p>
                    </div>
                </div>
                <div class="sec2atc3img2 upDiv">
                    <div>
                        <i class="fas fa-edit"></i>
                        <p><b>IT 기술 컨설팅</b></p>
                        <p>다양한 시장 경험을 토대로 고객고유의 환경에 대한<br>단 하나의 카운셀링 서비스를 제공합니다.</p>
                    </div>
                </div>
                <div class="sec2atc3img3 upDiv">
                    <div>
                        <i class="far fa-chart-bar"></i>
                        <p><b>엔드포인트 IT 자산 운영</b></p>
                        <p>IT 인프라와 엔드포인트 IT를 하나의 시각으로<br>바라봄으로써 최적의 비용 효율을 도출합니다.</p>
                    </div>
                </div>
                <div class="sec2atc3img4 upDiv">
                    <div>
                        <i class="fas fa-cogs"></i>
                        <p><b>INIT-CARE 서비스</b></p>
                        <p>IT의 궁극적인 목적은 원활한 IT 서비스의 유지입니다.<br>진단부터 장애대응, 운영/관리까지 INIT이 One-Stop으로 케어합니다.</p>
                    </div>
                </div>
            </article>
            <article class="sec2atc4">
                <div>
                    <b>문의하기</b>
                    <p>문의사항을 남겨주시면 빠른 시일내에 답변드리겠습니다.</p>
                </div>
                <div>
                    <a href="">문의 바로가기</a>
                    <i class="fas fa-long-arrow-alt-right"></i>
                </div>
            </article>
        </section>

        <section class="page sec3">
            <article class="sec3atc1">
                <p>ONE-STOP 설계 구축</p>
                <p>제안 단계부터 설계, 구축 및 유지보수까지, One-Stop 서비스를 제공합니다.<br>모든 과정은 INIT이 직접 관리하고 서비스합니다.</p>
            </article>
            <article class="sec3atc2 showbox">
                <div class="movebox">
                    <div>
                        <div class="sec3atc2img sec3atc2img1"></div>
                        <p><b>시스템 인프라</b><br>환경 분석 및 리소스 사이징<br>Legacy, Virtualization, HCI 등 요건과 환경에 적합한 인프라 형태 제안</p>
                        <a href="">더 알아보기</a>
                    </div>
                    <div>
                        <div class="sec3atc2img sec3atc2img2"></div>
                        <p><b>네트워크 인프라</b><br>통합 IT 관점에서의 현장 분석<br>서비스 목적 및 규모에 따른 효율적인 설계</p>
                        <a href="">더 알아보기</a>
                    </div>
                    <div>
                        <div class="sec3atc2img sec3atc2img3"></div>
                        <p><b>데이터 보호 대책</b><br>중요 데이터 자산 보호를 위한 유출 방지 체계 구현<br>시스템 및 네트워크 차원에서의 데이터 이동 통제 방안 제공</p>
                        <a href="">더 알아보기</a>
                    </div>
                    <div>
                        <div class="sec3atc2img sec3atc2img4"></div>
                        <p><b>보안 시스템</b><br>엔드포인트 보안 S/W 제공<br>랜섬웨어 등 악의적인 표적 공격을 방어하는 보안 솔루션 제공</p>
                        <a href="">더 알아보기</a>
                    </div>
                </div>
            </article>
            <article class="sec3atc3">
                <div>
                    <button id="prevbtn"><i class="fas fa-arrow-left"></i></button>
                    <button id="nextbtn"><i class="fas fa-arrow-right"></i></button>
                </div>
            </article>
        </section>

        <section class="page sec4">
            <article class="sec4atc1">파트너</article>
            <article class="sec4atc2">INIT은 성공적인 파트너쉽으로 인정받고 있습니다.</article>
            <article class="sec4atc3">
                <div class="pt1"><img src="sec4_img1.png" alt=""></div>
                <div class="pt2"><img src="sec4_img2.png" alt=""></div>
                <div class="pt3"><img src="sec4_img3.png" alt=""></div>
                <div class="pt4"><img src="sec4_img4.png" alt=""></div>
                <div class="pt5"><img src="sec4_img5.png" alt=""></div>
                <div class="pt6"><img src="sec4_img6.png" alt=""></div>
                <div class="pt7"><img src="sec4_img7.png" alt=""></div>
                <div class="pt8"><img src="sec4_img8.png" alt=""></div>
                <div class="pt9"><img src="sec4_img9.png" alt=""></div>
                <div class="pt10"><img src="sec4_img10.png" alt=""></div>
                <div class="pt11"><img src="sec4_img11.png" alt=""></div>
                <div class="pt12"><img src="sec4_img12.png" alt=""></div>
            </article>
        </section>

        <section class="page sec5">
            <article class="sec5atc1">
                <div>
                    <p><b>연혁</b></p>
                    <p>INIT은 고객과 함께<br>성장하고 있습니다.</p>
                </div>
                <div class="history">
                    <a href="javascript:void(0);">2019</a>
                    <a href="javascript:void(0);">2018</a>
                    <a href="javascript:void(0);">2017</a>
                    <a href="javascript:void(0);">2016</a>
                    <a href="javascript:void(0);">2015</a>
                    <a href="javascript:void(0);">2014</a>
                    <a href="javascript:void(0);">2013</a>
                    <a href="javascript:void(0);">2012</a>
                    <a href="javascript:void(0);">2011</a>
                </div>
                <div>
                    <button class="prevbtn2"><i class="fas fa-chevron-up"></i></button>
                    <button class="nextbtn2"><i class="fas fa-chevron-down"></i></button>
                </div>
            </article>
            <article class="sec5atc2">
                <div>2019</div>
                <div><i class="fas fa-angle-double-left"></i>&nbsp;&nbsp;&nbsp;좌우로 당겨주세요</div>
                <div class="timeline">
                    <div class="container down">
                        <div class="content"><p>비트컴퓨터 HCI 시스템<br>구축</p></div>
                    </div>
                    <div class="container up">
                        <div class="content"><p>쿠팡 HPE서버 유지보수<br>계약</p></div>
                    </div>
                    <div class="container down">
                        <div class="content"><p>태광 전체IT인프라가상화 전환 및<br>통합백업시스템 구축</p></div>
                    </div>
                    <div class="container up">
                        <div class="content"><p>스틱인베스트먼트<br>IT인프라 가상화 전환</p></div>
                    </div>
                    <div class="container down">
                        <div class="content"><p>HP 골드 파트너<br>달성</p></div>
                    </div>
                    <div class="container up">
                        <div class="content"><p>Veeam 실버 파트너<br>달성</p></div>
                    </div>
                    <div class="container down">
                        <div class="content"><p>홈플러스 Symantec<br>보안S/W 계약</p></div>
                    </div>
                    <div class="container up">
                        <div class="content"><p>라이나금융서비스 통합<br>유지보수 계약</p></div>
                    </div>
                </div>
            </article>
        </section>

        <section class="page sec6">
            <article class="sec6atc1">
                <p><b>오시는 길</b></p>
                <p>INIT의 문은 언제나 고객을 향해 열려 있습니다.</p>
            </article>
            <article class="sec6atc2 mapImg"></article>
            <article class="sec6atc3">
                <table>
                    <tr>
                        <th>Address</th>
                        <td>부산광역시 부산진구 중앙대로 749 혜도빌딩 4층</td>
                    </tr>
                    <tr>
                        <th>Tel</th>
                        <td>051-715-6224</td>
                    </tr>
                    <tr>
                        <th>Fax</th>
                        <td>051-715-6224</td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <th>지하철</th>
                        <td>1, 2호선 서면역 15번 출구에서 70M</td>
                    </tr>
                    <tr>
                        <th>버스</th>
                        <td>좌석 : 1002, 1000,1004,1010<br>
                            일반 : 20,24,160,167,169-1,17,23,31,33,583,<br>62,67,68,77,85,87,133,54,63,81,83-1,88,86</td>
                    </tr>
                </table>
            </article>
            <article class="sec6atc4"></article>
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
        <button class="goTop"><i class="fas fa-arrow-up"></i></button>
        <!--스크롤 위치 테스트-->
        <!-- <p class="test">scroll</p> -->
    </div>

    <script>
        $(function() {
            // 메인 헤더 애니메이션
            $("header .logo").fadeIn(2000);
            $(".middlebar").animate({width: "70px"}, 1000);
            $(".scroll_down").fadeIn(3000);

            // 로고 누르면 메인 화면으로 이동
            $(".logo").click(function() {
                location.href = "UIproject_main.html";
            });

            // 스크롤 관련 이벤트
            $(window).scroll(function() {
                // 스크롤 위치 출력
                $(".test").text("scroll: " + $(window).scrollTop() + ":" + ($(".sec1").offset().top - 110));
                // 아래 페이지부터 메뉴바 나타나기
                if($(window).scrollTop() > $(".sec1").offset().top - 110){
                    if($("nav .big_nav").outerWidth() > 1000 ) {
                        $("nav .big_nav").fadeIn();
                    }
                } else {
                    $("nav .big_nav").fadeOut();
                } 

                // 위로 가기 버튼 나타나기
                if($(window).scrollTop() > 90) {
                    $(".goTop").fadeIn();  
                } else {
                    $(".goTop").fadeOut();
                }

                // 숫자 카운트
                var f = true;
                if($(window).scrollTop() > 100 && $(window).scrollTop() < 130) {
                    if(f == true) {
                        var cnt = 0;
                        var cnt2 = 0;
                        var counter = setInterval(timer, 50);
                        function timer() {
                            cnt+=40;
                            cnt2+=10;
                            $(".plus800").text(cnt + "+");                           
                            $(".plus200").text(cnt2 + "+");
                            if (cnt == 800 && cnt2 == 200) {
                                clearInterval(counter);
                                return;
                            }
                        }
                        f = false;
                    }
                }

                // sec4 이벤트 - 떠오르는 애니메이션
                if($(window).scrollTop() > 2900){
                    $(".sec4atc3").animate({
                        top: "25%",
                        opacity: "1"
                    }, 2000);
                    
                }

            });          
            
            $(window).on("scroll", function(){
                clearTimeout(timer);
                timer = setTim
            });
            
            // 창 크기 조절 관련 이벤트
            $(window).resize(function() {
                var win_width = window.outerWidth;

                // 화면 줄어들면 큰 메뉴바 사라지게
                if(win_width < 1000) {
                    $("nav .big_nav").fadeOut();
                    $("nav .small_nav").fadeIn();
                    $(".emptybox").css("display", "block");
                } else {
                    $("nav .big_nav").fadeIn();
                    $("nav .small_nav").fadeOut();
                    $(".emptybox").css("display", "none");
                }

                // sec2 이벤트 화면크기별 추가 제거
                if(win_width > 1000) {
                    $(".upDiv").hover(
                        function() {// 올렸을 때
                            $(this).stop().animate({
                                bottom: "5%"
                            }, 300);
                        },
                        function() {// 나갔을 때
                            $(this).stop().animate({
                                bottom: "0"
                            }, 300);
                        }
                    );
                } else {
                    $(".upDiv").off();
                }

            });


            // 페이지 맨 위로 가는 버튼
            $(".goTop").click(function() {
                $("html, body").animate({
                    scrollTop: 0
                }, 400);
            });

            // sec2 이벤트 - 위로 올라가는 애니메이션
            $(".upDiv").hover(
                function() {// 올렸을 때
                    $(this).stop().animate({
                        bottom: "5%"
                    }, 300);
                },
                function() {// 나갔을 때
                    $(this).stop().animate({
                        bottom: "0"
                    }, 300);
                }
            );

            // sec2 이벤트 - 창 크기가 작을 때 이벤트 제거
            if($(window).width() < 1000) {
                $(".upDiv").off();
            }

            // sec3 이벤트 - 슬라이드 애니메이션(수동, 자동)
            $("#prevbtn").click(function() {
                $(".movebox").stop().animate({
                    left: "-100%"
                }, 1000, function() {
                    var x = $(".movebox>div").eq(0).detach();
                    $(".movebox").css("left", "0");
                    $(".movebox").append(x);
                });
            });

            $("#nextbtn").click(function() {
                var x = $(".movebox>div").eq(3).detach();
                $(".movebox").prepend(x);
                $(".movebox").css("left", "-100%");
                $(".movebox").stop().animate({
                    left: "0"
                }, 1000);
            });

            setInterval(function() {
                $(".movebox").animate({
                    left: "-100%"
                }, 1000, function() {
                    var x = $(".movebox>div").eq(0).detach();
                    $(".movebox").css("left", "0");
                    $(".movebox").append(x);
                });
            }, 3000);

            // sec5 드래그 효과 - 년도 세로 스크롤
            var isDown = false;
            var startY = 0;
            var scrollTop = 0;
            $(".history").mousedown(function(e) {
                isDown = true;

                startY = e.pageY;
                scrollTop = $(".history").scrollTop();
            });
            
            $(".history").mousemove(function(e) {
                if(!isDown) {
                    return;
                }

                e.preventDefault();

                var y = e.pageY;
                var walk = (y - startY) * 1;
                $(".history").scrollTop(scrollTop - walk);
            });

            $(".history").mouseup(function() {
                isDown = false;
            });

            $(".history").mouseleave(function() {
                isDown = false;
            });

            // sec5 드래그 효과 - 타임라인 세로 스크롤
            var isDown2 = false;
            var startX = 0;
            var scrollLeft = 0;
            $(".timeline").mousedown(function(e) {
                isDown2 = true;

                startX = e.pageX;
                scrollLeft = $(".timeline").scrollLeft();
            });
            
            $(".timeline").mousemove(function(e) {
                if(!isDown2) {
                    return;
                }

                e.preventDefault();

                var x = e.pageX;
                var walk2 = (x - startX) * 1;
                $(".timeline").scrollLeft(scrollLeft - walk2);
            });

            $(".timeline").mouseup(function() {
                isDown2 = false;
            });

            $(".timeline").mouseleave(function() {
                isDown2 = false;
            });
        });
    </script>
</body>
</html>