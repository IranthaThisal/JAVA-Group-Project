<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>multiflex</title>
    <link rel="stylesheet" href="customer.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');


        * {
            margin: 0px;
            padding: 0px;
            box-sizing: border-box;
        }

        body {
            font-family: 'poppins', sans-serif;
            width: 98%;
            margin: 0 auto;
            background-color: rgb(54, 53, 53);
        }


        .login_wrapper {

            width: 100vw;
            position: fixed;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            
            z-index: 2;
            font-size: 15px;

        }

        .login_wrapper form {
            width: 550px;
            margin-top: 50px;
            min-height: 600px;
            color: rgb(255, 255, 255);
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding-left: 20px;
            background-color: rgb(0, 0, 0);
            padding-bottom: 0px;
            border-radius: 10px;
            box-shadow:0 0rem 0.5rem #ff0000;
            padding-bottom: 20px;
        }

        .login_wrapper form h1 {
            padding: 8px;
            text-align: center;

        }

        .login_wrapper form table td {
            padding: 3px;
        }

        .login_wrapper form label {
            padding-top: 10px;
        }

        .login_wrapper form p {
            padding-top: 15px;
            padding-left: 80%;

        }

        #close {
            cursor: pointer;
        }

        .login_wrapper form input[type="text"],input[type="password"],input[type="email"]{
            width: 300px;
            height: 30px;
            border: 1px solid #fac031;
        }

        .login_wrapper form button {
            font-size: 12px;
            width: 100px;
            margin-top: 10px;
            margin-bottom: 15px;
            padding-top: 12px;
            padding-bottom: 12px;
            border: none;
            background-color: #ff0000;
            color: white;
            border-radius: 15px;
            cursor: pointer;
        }


        h1 span{
            color: #ff0000;
           
            font-family: mv boli;
        }
        @media screen and (max-width:580px){
            .login_wrapper form {
                width: 450px;
            }
        }
        @media screen and (max-width:480px){
            .login_wrapper form {
                width: 350px;
            }
        }
        .second tr th{
            text-align: left;
        }
    </style>
</head>
