(function(){
    var model={
        init:function()
            {
                //初次化链接下划条
                var urlName=sessionStorage.getItem('urlName');
                if (location.href.indexOf(urlName)>0){
                    $('a[data-id="'+urlName+'"]').addClass('decoration');
                    $('a[data-id!="'+urlName+'"]').removeClass('decoration')
                }else{}
                this.bindEvent();
            },
        bindEvent:function()
            {
                //点击后，给链接加下划条
                $('#nav').on('click','a',function()
                {
                    sessionStorage.setItem('urlName',$(this).attr('data-id'));
                    location.href=$(this).attr('data-id');
                    if(location.href.indexOf($(this).attr('data-id'))>0)
                    {
                        $(this).addClass('decoration');
                        $(this).siblings().removeClass('decoration');
                    }
                })
            }
    };
   model.init();
})();

