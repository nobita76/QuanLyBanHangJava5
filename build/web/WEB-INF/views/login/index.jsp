<%-- 
    Document   : login
    Created on : May 21, 2020, 8:51:18 AM
    Author     : home
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                            <link rel="icon" href="${pageContext.request.contextPath }/images/thanhdeptrai.webp" sizes="192x192"/>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <script src="js/jquery-3.3.1.slim.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
     <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
                            <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.css' />
        <style>
            @import url(&quot;https://fonts.googleapis.com/css?family=Raleway:400,700&quot;);
            *, *:before, *:after {
                box-sizing: border-box;
            }

            body {
                min-height: 100vh;
                font-family: 'Raleway', sans-serif;
            }

            .container {
                position: absolute;
                width: 100%;
                height: 100%;
                overflow: hidden;
            }
            .container:hover .top:before, .container:hover .top:after, .container:hover .bottom:before, .container:hover .bottom:after, .container:active .top:before, .container:active .top:after, .container:active .bottom:before, .container:active .bottom:after {
                margin-left: 200px;
                transform-origin: -200px 50%;
                transition-delay: 0s;
            }
            .container:hover .center, .container:active .center {
                opacity: 1;
                transition-delay: 0.2s;
            }

            .top:before, .top:after, .bottom:before, .bottom:after {
                content: '';
                display: block;
                position: absolute;
                width: 200vmax;
                height: 200vmax;
                top: 50%;
                left: 50%;
                margin-top: -100vmax;
                transform-origin: 0 50%;
                transition: all 0.5s cubic-bezier(0.445, 0.05, 0, 1);
                z-index: 10;
                opacity: 0.65;
                transition-delay: 0.2s;
            }

            .top:before {
                transform: rotate(45deg);
                background: #e46569;
            }
            .top:after {
                transform: rotate(135deg);
                background: #ecaf81;
            }

            .bottom:before {
                transform: rotate(-45deg);
                background: #60b8d4;
            }
            .bottom:after {
                transform: rotate(-135deg);
                background: #3745b5;
            }

            .center {
                position: absolute;
                width: 400px;
                height: 400px;
                top: 50%;
                left: 50%;
                margin-left: -200px;
                margin-top: -200px;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                padding: 30px;
                opacity: 0;
                transition: all 0.5s cubic-bezier(0.445, 0.05, 0, 1);
                transition-delay: 0s;
                color: #333;
            }
            .center input {
                width: 100%;
                padding: 15px;
                margin: 5px;
                border-radius: 1px;
                border: 1px solid #ccc;
                font-family: inherit;
            }
        </style>

        <script>
            window.console = window.console || function (t) {};
        </script>

        <script src=&quot;https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js&quot;></script>

    </head>
    <body>
        
        
        <%
            if(session.getAttribute("statusRegister") != null){
                if((int) session.getAttribute("trangThaiReg") == 1){
                    out.println("<script>toastr.success('"+session.getAttribute("statusRegister")+"')</script>");
                session.removeAttribute("statusRegister");
                session.removeAttribute("trangThaiReg");
                }else{
                    out.println("<script>toastr.error('"+session.getAttribute("statusRegister")+"')</script>");
                session.removeAttribute("statusRegister");
                session.removeAttribute("trangThaiReg");
                }
                
            }
            
            
            %>
       <div class="container" onclick="onclick">
        
        <div class="top"></div>
        <div class="bottom"></div>
        <div class="center">
            <h2>Vui lòng đăng nhập
	<s:form method="post" modelAttribute="Users" action="${pageContext.request.contextPath }/login/login.html">
            </h2>
            
	<s:input path="username" placeholder="Tài khoản"/>
            
<s:password path="password" placeholder="Mật khẩu"/>            
            
            <input class="btn btn-primary" type="submit" value="Đăng nhập" name="Action">
            
            </s:form>
            <div class="message">${messageRegister}</div>
                <div class="separator">
                    <p class="change_link">Chưa có tài khoản?
                            <a href="register.html" class="to_register"> Đăng ký </a>
                        </p>

                        <div class="clearfix"></div>
                        <br>

                        
                    </div>
        </div>
    </div>
    </body>
</html>
