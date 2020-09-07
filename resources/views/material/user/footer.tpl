<footer class="ui-footer">
    <div class="container">
        &copy;{date("Y")} {$config['appName']} | Powered by <a href="/staff">SSPANEL</a>
        {if $config['enable_analytics_code'] === true}{include file='analytics.tpl'}{/if}
    </div>
</footer>

<!-- js -->
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0"></script>
{if isset($geetest_html)}
    <script src="//static.geetest.com/static/tools/gt.js"></script>
{/if}
<script src="/theme/material/js/base.min.js"></script>
<script src="/theme/material/js/project.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/clipboard@1.5.16/dist/clipboard.min.js"></script>

<script>console.table([['数据库查询', '执行时间'], ['{count($queryLog)} 次', '{$optTime} ms']])</script>

</body>
</html>
