<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>登录界面</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
    <div class="wrap">
        <div class="wrapBorder">
            <div class="img"></div>
            <div class=loginBorder>
                <ul class="ulContent">
                    <li class="li1">易考勤管理系统</li>
                    <li class="li2">请使用UM账号登录</li>
                    <li class="li3"><span class="li3Text">账号</span><span class="li3Img">icon</span><span class="li3Input"><input id="username" type="text" placeholder="请输入员工UM账号"></span ><span id="notice1"></span></li>
                    <li class="li4"><span class="li3Text">密码</span><span class="li3Img">icon</span><span class="li3Input"><input id="password" type="password"></span><span id="notice2"></span></li>
                    <li class="li5"><input type="button" id="submit" value="登录" ></li>
                </ul>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/login.js"></script>
</html>



@charset "UTF-8";
*{
    padding: 0;
    margin: 0;
    font-family:"Microsoft Yahei",'SimHei';
}
.wrap{
    width: 100%;
    height: auto;
    margin: 0 auto;
}
.wrapBorder{
    width: 1020px;
    height: 510px;
    border: 1px solid #333333;
    margin: 10% auto 0 auto;
    position: relative;
}
.img{
    width: 797px;
    height: 50px;
    margin: 10px  auto auto auto;
    background: url("../images/u6.png") center no-repeat;
}
.loginBorder{
    width: 530px;
    height: 353px;
    border: 1px solid #333333;
    margin: 30px auto auto auto;
    position: relative;
}
.ulContent{
    min-width: 490px;
    height: 320px;
    list-style: none;
    position: absolute;
    left: 40px;
    top: 25px;
}
.li1{
    text-align: center;
    width: 100%;
    font-size: 28px;
}
.li2{
    text-align: center;
    width: 100%;
    font-size: 13px;
    height: 40px;
    line-height: 40px;
}
.li3{
    width: 100%;
    display: table;
    margin-top: 15px;
    word-break: break-all; word-wrap:break-word;
}
.li4{
    clear: both;
    width: 100%;
    display: table;
    margin-top: 28px;
    word-break: break-all; word-wrap:break-word;
}
.li3Text{
    font-size: 16px;
    width: 40px;
    display: table-cell;
    vertical-align: middle;
    float: left;
    line-height: 40px;
}
.li3Img{
    float: left;
    display: table-cell;
    background: url("../images/u14.png") center no-repeat;
    width: 46px;
    height: 46px;
    vertical-align: middle;
    text-align: center;
    line-height: 46px;
    font-size: 13px;
}
.li3Input{
    display: table-cell;
    vertical-align: middle;
    width: 320px;
    height: 40px;
    float: left;
    line-height: 40px;
}
.li3 input{
    display: table-cell;
    width: 290px;
    height: 38px;
    float: right;
    border: 1px solid #333333;
    text-indent: 1em;
    margin-top: 3px;
}
.li4 input{
    display: table-cell;
    width: 290px;
    height: 38px;
    margin-top: 3px;
    float: right;
    border: 1px solid #333333;
    text-indent: 1em;
}
.li5 input{
    display: block;
    margin: 35px auto auto auto;
    width: 150px;
    height: 50px;
    background:#009DD9 ;
    border: 1px solid #009DD9;
    font-size: 18px;
    color: white;
}
#notice1{
    color: red;
    font-size: 13px;
    vertical-align: middle;
    text-align: left;
    display: inline;
    line-height: 3em;
}
#notice2{
    color: red;
    font-size: 13px;
    vertical-align: middle;
    text-align: center;
    height: 46px;
    line-height: 40px;

}




/*** Created by EX-CAIHU001 on 2016-08-09.*/
(function()
{
    var model=
    {
        init:function()
        {
          this.bindEvent();
        },
        queryData:function()
        {
            common.ajax('url',data,function(res)
            {
                location.herf='workList.html'
            })
        },
        bindEvent:function()
        {
            var self =this;
            var username= $('#username'),
                password=$('#password'),
                submit=$('#submit'),
                notice1= $('#notice1'),
                notice2=$('#notice2');
            username.on('blur',function()
            {
                if($(this).val()=='')
                {
                    notice1.text('*不能为空')
                }
                else
                {
                    notice1.text('')
                }
            });
            password.on('blur',function()
            {
                if($(this).val()=='')
                {
                    notice2.text('*不能为空')
                }
                else
                {
                    notice2.text('')
                }
            });
            submit.on('click',function()
            {
                if(username.val()=='')
                {
                    alert('用户名不能为空')
                }else if(password.val()=='')
                {
                    alert('密码不能为空')
                }
                else{
                    data={'username':username,'password':password};
                    self.queryData(data)
                }
            })
        }
    };
    model.init();
})();





 var common = {
        init:function(){
        },
        ajax: function (url,data,successCallBack) {
            var self = this;
            $.ajax({
                url: url,
                data: data,
                type: 'post',
                dataType: 'json',
                success: function (res) {
                    // 报文string格式，对象化
                    if (typeof res == 'string') {
                        res = JSON.parse(res);
                    }
                    if (res && res.resCode == '000') {
                        successCallBack && successCallBack(res);
                    } else {
                        alert(res.resMsg);
                    }
                }
            });
        },
        setData: function (key, value) {
            /* objcet,先转化为字符串*/
            if (typeof value == 'object') {
                localStorage.setItem(key, JSON.stringify(value));
            } else {
                localStorage.setItem(key, value);
            }
        },
        getData: function (key) {
            var data = localStorage.getItem(key);
            try {
                // JSON.parse抛出异常的处理方法
                data = JSON.parse(data);
                return data
            } catch (e) {
                return data
            }
        }

    };
    common.init();

