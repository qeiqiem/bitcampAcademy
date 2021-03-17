/* 실제 사용 이벤트  */
$(document).ready(function(){

    //사이드바 이벤트
    $('.foldBtn').click(function(){ $('.foldBtn').toggleClass('expand'); $('.slide').toggleClass('hide'); })

    //리스트 내부 이벤트
    var thisEle = event.target;
     $(event.target).click(function(){
        $('.list').hide()
        $('.single').show()
    }) 
    
})