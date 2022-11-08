function login() {
	
	var id = document.getElementById("id");
    var pw = document.getElementById("pw");
    
	if (id.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
        alert("아이디를 입력하세요.");
        id.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
        return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
      };

    if (pw.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
        alert("비밀번호를 입력하세요.");
        pw.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
        return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
      };
     
    if (id.value == "aaaaa" && pw.value =="aaaaa") {        
        alert("로그인 되었습니다.");   
        location.href="slider.html";       
    }
    else if (id.value == "bbbbb" && pw.value =="bbbbb") {        
        alert("로그인 되었습니다.");   
        location.href="slider.html";       
        }
    else if (id.value == "ccccc" && pw.value =="ccccc") {        
        alert("로그인 되었습니다.");   
        location.href="slider.html";       
        }
    else if (id.value == "ddddd" && pw.value =="ddddd") {        
        alert("로그인 되었습니다.");   
        location.href="slider.html";       
        }
    else if (id.value == "eeeee" && pw.value =="eeeee") {        
        alert("로그인 되었습니다.");   
        location.href="slider.html";       
        } 
    else {
        alert("존재하지 않는 아이디 입니다.")        
        id.focus(); 
        return false;        
    }              
       
}//login 


 

function cancel() {
	var cancel =confirm("로그인을 취소하시겠습니까?")
    
    if (cancel == true) {
        alert("로그인이 취소 되었습니다. \n메인페이지로 이동합니다.");
        location.href = "slider.html";
        return false;
    } else {
        alert("로그인이 계속됩니다.");
        id.focus();
        return false;
    }
}    