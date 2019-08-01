<!doctype html>
<html>

<head>
  <#include "_head.ftl">
    <title>Java DemoApp: Info</title>
</head>

<body>

  <#include "_nav.ftl">
  <div class="container">
    <div class="card">
      <h5 class="card-header bg-danger text-white"><i class="fas fa-bomb"></i> Error</h5>
      <div class="card-body">
        <h3>HTTP ${status}</h3>

        <hr>        
        <pre style="white-space: pre-wrap; word-break: keep-all">${message}</pre>

      </div>
    </div>
  </div>
</body>

</html>