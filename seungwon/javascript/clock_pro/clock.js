    var second = document.getElementById("second");  //시침 선택
    var minute = document.getElementById("minute");  //분침 선택
    var hour = document.getElementById("hour");
    function clock(){
        var time = new Date(); //날짜/시간 객체 생성
        var hh = time.getHours(); //시 추출
        var mm = time.getMinutes(); //분 추출
        var ss = time.getSeconds(); //초 추출
        if(hh>=12) {
            hh = hh - 12;
         } //시에 대하여 12시간제로 변경
        hh= hh/12*360; //시 각도 계산
        mm= mm/60*360; //분 각도 계산
        ss= ss/60*360; //초 각도 계산
        second.style.transform = "rotate("+ss+"deg)"; //시침에 대한 각도 적용
        minute.style.transform = "rotate("+mm+"deg)"; //분침에 대한 각도 적용
        hour.style.transform = "rotate("+hh+"deg)"; //초침에 대한 각도 적용
    }
    clock();
    setInterval(function(){ clock(); }, 1000); //1초 마다 갱신
    var cw = document.getElementById("clock_weight"); //시계추 선택
    var sw=1;
    setInterval(function(){  //시계추 왕복
        if(sw==1){
            cw.style.transform = "rotate(45deg)";
            sw=sw*-1;
        } else {    
            cw.style.transform = "rotate(-45deg)"; 
            sw=sw*-1;
        }    
    }, 1000);  