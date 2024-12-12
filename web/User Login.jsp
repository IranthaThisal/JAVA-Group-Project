<%-- 
    Document   : User Login
    Created on : Dec 8, 2024, 6:45:55 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>sportexpert</title>
    <!-- MATERIAL CDN  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp"
      rel="stylesheet">

      <style>
         @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap');

/* ROOT VARIABLES  */
:root{
    --color-primary: #eb2b38;
    --color-danger: #ff7782;
    --color-success: #fb0000;
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
    display: grid;
    width: 96%;
    margin: 0 auto;
    gap: 1.8rem;
    grid-template-columns: 14rem auto 23rem;
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