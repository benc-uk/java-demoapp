<!doctype html>
<html>

<head>
  <#include "_head.ftl">
  <title>Java DemoApp: Tools</title>
</head>

<body>
  <#include "_nav.ftl">
  <div class="container">
    <#if time??>
      <div class="alert alert-success" role="alert">
        Phew! That took me ${time} millisecs
      </div>    
    </#if>
    <div class="card">
      <h5 class="card-header bg-success text-white"><i class="fa fa-tools"></i> Tools and Debug</h5>
      <div class="card-body">
        <a href="/tools/cpu" class="btn btn-info">CPU Load</a> - Force high CPU load <br><br>
        <a href="/tools/error" class="btn btn-info">Fake Exception</a> - Generate an exception <br><br>
        <a href="/foo" class="btn btn-info">404 Error</a> - Page doesn't exist
      </div>
    </div>
  </div>
</body>

</html>