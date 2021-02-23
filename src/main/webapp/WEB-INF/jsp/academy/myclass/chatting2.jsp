<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/academy/common/js/jquery.min.js"></script>
<script>

	// 자동 소켓 connection
	
	$(document).ready(function () {
		
		openSocket();
	
	})

</script>

</head>
<body>
    <div>
        <input type="text" id="sender" value="${REQUEST_DATA.SES_USERID }" style="display: none;">
        
    </div>
    
    <!-- Server responses get written here -->
    <div id="messages"></div>
    
    <div>
    	<input type="text" id="messageinput">
        <button type="button" id="openSocketBtn" onclick="openSocket();" style="display: none">Open</button>
        <button type="button" onclick="send();">전송</button>
        <button type="button" onclick="closeSocket();">Close</button>
    </div>
    
    <!-- websocket javascript -->
    <script type="text/javascript">
        var ws;
        var messages=document.getElementById("messages");
        
        function openSocket(){
            if(ws!==undefined && ws.readyState!==WebSocket.CLOSED){
                writeResponse("WebSocket is already opened.");
                return;
            }
            //웹소켓 객체 만드는 코드
            ws=new WebSocket("ws://192.168.20.152:8085/echo.do");
            
            ws.onopen=function(event){
                if(event.data===undefined) return;
                
                writeResponse(event.data);
            };
            ws.onmessage=function(event){
                writeResponse(event.data);
            };
            ws.onclose=function(event){
                writeResponse("Connection closed");
            }
        }
        
        function send(){
            var text=document.getElementById("messageinput").value+","+document.getElementById("sender").value;
//             var text=document.getElementById("sender").value + " : " +document.getElementById("messageinput").value;
            ws.send(text);
            text="";
        }
        
        function closeSocket(){
            ws.close();
        }
        function writeResponse(text){
            messages.innerHTML+="<br/>"+text;
        }
  </script>
</body>
</html>
