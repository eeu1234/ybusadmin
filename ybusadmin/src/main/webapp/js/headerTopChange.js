/* 적용된 곳
	getBusStopLine.jsp
	getBusStopRoadView.jsp
	getBusStopMapView.jsp
*/

let now = new Date(); // 시간을 받아오는 객체 생성
let hour = now.getHours(); // 시
let busType_code = 0;  //셀렉트 박스의 정보에 따라 어느 버스인지 파악하는 변수

// 테스트용
hour = 20;

// 이미지경로를 담고 있는 배열
let busAddress = [
    ['url("/spring/images/2022busStop/BusBlue_Day.png")','url("/spring/images/2022busStop/BusBlue_Evening.png")','url("/spring/images/2022busStop/BusBlue_Night.png")'],
    ['url("/spring/images/2022busStop/BusYellow_Day.png")','url("/spring/images/2022busStop/BusYellow_Evening.png")','url("/spring/images/2022busStop/BusYellow_Night.png")'],
];

function checkTime_Logo(){ // 시간에 따른 메인 로고 변경 함수
    if( hour > 7 && hour < 17){
        $('#hedaerTop').css('background-image',busAddress[busType_code][0]);
    }
    else if(hour > 16 && hour < 20){
        $('#hedaerTop').css('background-image',busAddress[busType_code][1]);
    }
    else if(hour > 19 || hour < 7){
        $('#hedaerTop').css('background-image',busAddress[busType_code][2]);
    }
}

function checkBus_Logo(type){ // 셀렉트박스에서 버스 종류가 가져와서 메인 이미지 변경하는데 필요한 코드를 변경함
    if(type == 18){
        busType_code = 0;
    }
    else if(type == 36){
        busType_code = 1;
    }
}

//
$(document).ready(function(){
	checkBus_Logo(busStopCategorySeq);
	checkTime_Logo();
});