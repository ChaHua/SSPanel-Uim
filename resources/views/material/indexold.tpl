<!DOCTYPE HTML>
<!--
    Dimension by HTML5 UP
    html5up.net | @ajlkn
    Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html lang="zh-cn">
<head>
    <meta charset="utf-8"/>
    <title>{$config['appName']}</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    {if $config['appName'] == '跑路'}
        <script>window.location.href = '{$config['baseUrl']}/paolu.html';</script>
    {/if}
    <link rel="shortcut icon" href="/favicon.ico"/>
    <link rel="bookmark" href="/favicon.ico"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="/assets/css/main.css"/>
    <noscript>
        <link rel="stylesheet" href="/assets/css/noscript.css"/>
    </noscript>
    <link href="https://cdn.jsdelivr.net/npm/nprogress@0.2.0/nprogress.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/nprogress@0.2.0/nprogress.min.js"></script>
</head>

<body>

<div id="wrapper">
    <!--首页开始-->
    <header id="header">
        <div class="logo">
            <span class="icon fa-rocket"></span>
        </div>
        {if $user->isLogin}
            <div class="content">
                <div class="inner">
                    <p>用户：<code>{$user->user_name}</code>
                        等级：
                        {if $user->class!=0}
                            <code>VIP{$user->class}</code>
                        {else}
                            <code>免费</code>
                        {/if}
                        过期时间：
                        {if $user->class_expire!="1989-06-04 00:05:00"}
                            <code>{$user->class_expire}</code>
                        {else}
                            <code>不过期</code>
                        {/if}
                    </p>
                    <p>总流量：<code>{$user->enableTraffic()}</code>
                        已用流量：<code>{$user->usedTraffic()}</code>
                        剩余流量：<code>{$user->unusedTraffic()}</code>
                    </p>
                </div>
            </div>
            <nav>
                <ul>
                    <li><a href="#1">简介</a></li>
                    {if $user->is_admin}
                    <li><a href="/admin">管理后台</a></li>
                    {/if}
                    <li><a href="/user">用户中心</a></li>
                    <li><a href="/user/logout">退出登录</a></li>
                </ul>
            </nav>
        {else}
            <div class="content">
                <div class="inner">
                    <h1>{$config['appName']}</h1>
                    <!--
                    如果想自定义文本请删除下面这段script代码,格式为
                    <p>自定义文本</p>
                    -->
                    {$config['old_index_DESC']}
                </div>
            </div>
            <nav>
                <ul>
                    <li><a href="#1">简介</a></li>
                    <li><a href="/auth/login">登录</a></li>
                    <li><a href="/auth/register">注册</a></li>
                </ul>
            </nav>
        {/if}
    </header>
    <!--首页结束-->
    <div id="main">
        <!--标签1开始-->
        <article id="1">
            <h2 class="major">简介</h2>
            <p>「ホワイトアルバムの季節」が、また、やってきた。</p>
        </article>
        <!--
        简介修改示例:
        <p>123</p>
        一个 <p>123</p> 为一行，请不要删除 </article>
        -->
        <!--标签4开始-->
        <article id="4">
            <h2 class="major">联系我们</h2>
            <ul class="icons">
                <p>此处填写联系方式</p>
                <li>
                    <a target="_blank" href="#" class="icon fa-facebook">
                        <!-- 请在 fontawesome.com 寻找替换图标 href 替换链接 -->
                        <span class="label">Facebook</span>
                    </a>
                </li>
            </ul>
        </article>
        <article id="login">
            <h2 class="major">登录</h2>
            <form method="post" action="javascript:void(0);">
                <div class="field half first">
                    <label for="email2">邮箱</label>
                    <input type="text" name="Email" id="email2"/>
                </div>
                <div class="field half">
                    <label for="passwd">密码</label>
                    <input type="password" name="Password" id="passwd"/>
                </div>
                <ul class="actions">
                    <li><input id="login" type="submit" value="登录" class="special"/></li>
                    <li><input type="reset" value="清空"/></li>
                </ul>
            </form>
            <div class="field half">
                <input value="week" id="remember_me" name="remember_me" type="checkbox" checked>
                <label for="remember_me">记住我</label>
            </div>
            <br>
            <div id="result" role="dialog">
                <p color class="h5 margin-top-sm text-black-hint" id="msg"></p>
            </div>
        </article>
        <!--全部标签结束-->
    </div>
    <!-- 版权底部 -->
    <footer id="footer">
        <p class="copyright">&copy;{date("Y")} {$config['appName']}</p>
    </footer>
    <!-- 版权结束 -->
</div>
<!-- BG -->
<div id="bg"></div>
<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.11.3"></script>
<script src="https://cdn.jsdelivr.net/gh/ajlkn/skel@3.0.1/dist/skel.min.js"></script>
<script src="/assets/js/util.js"></script>
<script src="/assets/js/main.js"></script>
<!-- 進度條 -->
<script>
    {literal}
    $(function () {
        $(window).load(function () {
            NProgress.done();
        });
        NProgress.set(0.0);
        NProgress.configure({showSpinner: false});
        NProgress.configure({minimum: 0.4});
        NProgress.configure({easing: 'ease', speed: 1200});
        NProgress.configure({trickleSpeed: 200});
        NProgress.configure({trickleRate: 0.2, trickleSpeed: 1200});
        NProgress.inc();
        $(window).ready(function () {
            NProgress.start();
        });
    });
    {/literal}
    /*window.addEventListener('load', () => {
        fetch('https://api.lwl12.com/hitokoto/v1?encode=realjson', {
            method: 'GET',
        }).then((response) => {
            return response.json();
        }).then((r) => {
            insertHitokoto(r);
        })
    });

    function insertHitokoto(data) {
        let hitokoto = document.getElementById('lwlhitokoto');
        if (data.author || data.source) {
            hitokoto.innerHTML = `${ldelim}data.text{rdelim} —— ${ldelim}data.author{rdelim} ${ldelim}data.source{rdelim}`;
        } else {
            hitokoto.innerHTML = `${ldelim}data.text{rdelim}`;
        }
    }*/
</script>

</body>

</html>
