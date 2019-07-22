<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>中汇招标----设置</title>
    <meta name="viewport"
        content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="shortcut icon" href="${skin}front/img//favicon.ico" type="image/x-icon">
    <link href="${skin}mobile/res/mui/css/mui.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${skin}mobile/res/fontAwesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${skin}mobile/css/base.css">
    <link rel="stylesheet" href="${skin}mobile/css/set.css">
</head>

<body>
    <div class="zh_layout">
        <header class="zh_topBar clearfix">
            <a href="/m.profile.do" class="icon_back fa fa-chevron-left l"></a>
            <span>设置</span>
        </header>
        <div class="zh_container">
            <ul class="mui-table-view">
                <li class="mui-table-view-cell">
                    <a class>
                        开启服务
                        <div class="mui-switch mui-switch-blue mui-active">
                            <div class="mui-switch-handle"></div>
                        </div>
                    </a>
                </li>
                <li class="mui-table-view-cell">
                    <a class>
                        推送时间
                        <span class="r">每天12：00-18:00</span>
                    </a>
                </li>
                <li class="mui-table-view-cell">
                    <a class>
                        接收邮箱
                        <span class="r">425027@qq.com</span>
                    </a>
                </li>
            </ul>
            <div class="tips">
                提示：若您想修改推送时间和接收邮箱请您到电脑端登陆后进行修改
            </div>
        </div>
    </div>
    <script src="${skin}mobile/js/jquery-3.3.1.min.js"></script>
    <script src="${skin}mobile/res/mui/js/mui.min.js"></script>
    <script type="text/javascript">
        mui.init()
    </script>
</body>

</html>