<%-- 
    Document   : booking
    Created on : 7 Dec 2024, 15:14:41
    Author     : Wasula Jayawardana
--%>

<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
     <%
       HttpSession session1 = request.getSession(false);
    
    
      if (session1 == null || session1.getAttribute("user_id") == null) {
       
        response.sendRedirect("admin_login.jsp");
    }
 %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>multiflex</title>
    <!-- MATERIAL CDN  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp"
      rel="stylesheet">

    <style>
         @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap');

/* ROOT VARIABLES  */
:root{
    --color-primary: #ff0000;
    --color-danger: #ff7782;
    --color-success: #ff0019;
    --color-warning: #ffbb55;
    
    --color-info-dark: #7d8da1;
    --color-info-light: #2a2a2b;
    --color-dark: #363949;
    --color-light: rgba(132, 139, 200, 0.18);
    --color-primary-variant:#235e53;
    --color-dark-varient: #677483;


    --card-border-radious: 2rem;
    --border-radious-1: 0.4rem;
    --border-radious-2: 0.8rem;
    --border-radious-3: 1.2rem;

    --card-padding: 1.8rem;
    --padding-1: 1.2rem;

    --box-shadow: 0 2rem 3rem var(--color-light);

    --color-background:#181a1e;
    --color-white:#202528;
    --color-dark:#edeffd;
    --color-dark-varient:#a3bdcc;
    --color-light:rgba(0, 0, 0, 0.4);
    --box-shadow:0 2rem 3rem var(--color-light);

}

/* ---------dark theme variables--------- */
.dark-theme-variables{
    --color-background:#181a1e;
    --color-white:#202528;
    --color-dark:#edeffd;
    --color-dark-varient:#a3bdcc;
    --color-light:rgba(0, 0, 0, 0.4);
    --box-shadow:0 2rem 3rem var(--color-light);
}

*{
    margin: 0;
    padding: 0;
    outline: 0;
    appearance: none;
    border: 0;
    text-decoration: none;
    list-style: none;
    box-sizing: border-box;
}

html{
    font-size: 14px;
}

body{
    width: 100vw;
    height: 100vh;
    font-family: poppins,sans-serif;
    font-size: 0.88rem;
    background: var(--color-background);
    /* user-select: none; */
    overflow-x: hidden;
    color: var(--color-dark);
}

.container{
    width: 56%;
    margin: 0 auto;
    gap: 1.8rem;
}

a{
    color: var(--color-dark);
}

img{
    display: block;
    width: 100%;
}

h1{
    font-weight: 800;
    font-size: 1.8rem;
}

h2{
    font-size: 1.4rem;
}

h3{
    font-size: 0.87rem;
}

h4{
    font-size: 0.8rem;
}

h5{
    font-size: 0.77rem;
}

small{
    font-size: 0.75rem;
}

.profile-photo{
    width: 2.8rem;
    height: 2.8rem;
    border-radius: 50%;
    overflow: hidden;
}

.txt-center{
    text-align: center;
}

.text-muted{
    color: var(--color-info-dark);
}

p{
    color: var(--color-dark-varient);
}

b{
    color: var(--color-dark);
}

.primary{
    color: var(--color-primary);
}

.danger{
    color: var(--color-danger);
}

.success{
    color: var(--color-success);
}

.warning{
    color: var(--color-warning);
}

/* button  */
.submit{
    padding: 10px 20px;
    font-size: 15px;
    border-radius: var(--border-radious-1);
    font-weight: 600;
    color: #fff;
    background-color: var(--color-primary);
    cursor: pointer;
    transition: 300ms ease;
}

.submit:hover{
    background-color: #5a6aff;
}


/* ============ SIDE BAR ============= */
aside{
    height: 100vh;
}

aside .top{
    display: flex;
    align-items: center;
    justify-content: center;
    margin-top: 1.4rem;

}

aside .close{
    display: none;
}

aside .sidebar{
    display: flex;
    flex-direction: column;
    height: 86vh;
    position: relative;
    top: 3rem;
}

aside h3{
    font-weight: 500;
}

aside .sidebar a{
    display: flex;
    color: var(--color-info-dark);
    margin-left: 2rem;
    gap: 1rem;
    align-items: center;
    position: relative;
    height: 3.7rem;
    transition: all 300ms ease;
}

aside .sidebar a span{
    font-size: 1.6rem;
    transition: all 300ms ease;
}

aside .sidebar a:last-child{
    position: absolute;
    bottom: 2rem;
    width: 100%;
}

aside .sidebar a.active{
    background: var(--color-light);
    color: var(--color-primary);
    margin-left: 0;
}

aside .sidebar a.active::before{
    content: "";
    width: 6px;
    height: 100%;
    background: var(--color-primary);
}

aside .sidebar a.active span{
    color: var(--color-primary);
    margin-left: calc(1rem - 3px);
}


aside .sidebar a:hover span{
    margin-left: 1rem;
}

aside .sidebar .message-count{
    background: var(--color-danger);
    color: var(--color-white);
    padding: 2px 10px;
    font-size: 11px;
    border-radius: var(--border-radious-1);
}


/* ============ MAIN ============= */

main{
    margin: 1.4rem;
}

main .insights{
   display: grid;
   grid-template-columns: repeat(3, 1fr);
   gap: 1.6rem;
}

main .insights > div{
    background: var(--color-white);
    padding: var(--card-padding);
    border-radius: var(--card-border-radious);
    margin-top: 1rem;
    box-shadow: var(--box-shadow);
    transition: all 300ms ease;
    user-select: none;
}

main .insights > div:hover{
    box-shadow: none;
}

main .insights > div span{
    background: var(--color-primary);
    padding: 0.5rem;
    border-radius: 50%;
    color: var(--color-white);
    font-size: 2rem;
}

main .insights > div.category span{
    background: var(--color-danger);
}

main .insights > div.income span{
    background: var(--color-success);
}

main .insights > div .middle {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

main .insights .progress{
    position: relative;
    width: 92px;
    height: 92px;
    border-radius: 50%;
}

main .insights svg{
    width: 7rem;
    height: 7rem;
}

main .insights svg circle{
    fill: none;
    stroke: var(--color-primary);
    stroke-width: 14px;
    stroke-linecap: round;
    transform: translate(5px, 5px);
    stroke-dasharray: 110;
    stroke-dashoffset: 92;
}

main .insights .product svg circle,
main .insights .category svg circle{
    stroke-dashoffset:0 ;
    stroke-dasharray: 250;
}

main .insights .progress .number{
    position: absolute;
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}

.income{
    min-width: 230px;
}

.income-card .left{
    margin: 0 auto;
    margin-top: 20px;
}

.income-card .left h2{
    color: var(--color-primary);
}


.number h3{
    font-size: 15px;
}

main .insights small{
    margin-top: 1.3rem;
    display: block;
}


main .recent-orders{
    margin-top: 1.6rem;
}

main .recent-orders h2{
    margin-bottom: 0.8rem;
}

/* table style for all pages  */
table{
    background: var(--color-white);
    width: 100%;
    border-radius: var(--card-border-radious);
    text-align: center;
}

td{
    transition: 200ms ease;
}

.recent-orders table{
    box-shadow: var(--box-shadow);
    padding: var(--card-padding);
}

table:hover{
    box-shadow: none;
}

table tbody td{
    text-align: center;
    height: 2.8rem;
    border-bottom: 1px solid var(--color-light);
}

table thead th{
    text-align: center;
}

table tbody tr:last-child td{
    border: none;
}

main .recent-orders a{
    text-align: center;
    display: block;
    margin: 1rem auto;
    color: var(--color-primary);
}


/* ============ RIGHT ============= */
.right{
    margin-top: 1.4rem;
}