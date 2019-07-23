<%@ page language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<title>
</title>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.js"></script>  
</head>
    <body>  

        <form action="" method="post">  

        username<input type="text" name="username"  id="username" />  

        <input type="button"  value="Ajax" id="submitbt">  
        <p>插入值：<div id='rs'></div></p>

        </form>  
        <form action="ajax2.do" method="get">
        测试：<input type="text">
        <input type="submit" id="submitbt" value="提交">
        </form>
            <script type="text/javascript">  
    $(function() {  
        /* Ajax post */  
        $('#submitbt').click(function() {  
            var Username = $("#username").val(); 
            var Pwd = $("#pwd").val();
            $.post("ajax.do", {  
                username : Username, 
                pwd : Pwd,
            }, function(data) {  
                //从后台传过来的数据   
                $('#rs').text(data);
            });  
        });  
          /* Ajax post */  
    });  
    </script>  

</body>
</html>