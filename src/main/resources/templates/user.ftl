<!doctype html>
<html>

<head>
  <#include "_head.ftl">
  <title>Java DemoApp: User</title>
</head>

<body>
  <#include "_nav.ftl">
  <div class="container">
    <div class="card">
      <h5 class="card-header bg-success text-white"><i class="fa fa-user"></i> User Details</h5>
      <div class="card-body">
        <#if username != "anonymousUser">
          <h4>Hi there ${username} !</h4>
          <hr>
          <b>Token Details</b>
          <ul>
            <li>Name: ${details.name!}</li>
            <li>UPN: ${details.upn!}</li>
            <li>Tenant: ${details.tid!}</li>
            <li>IP Address: ${details.ipaddr!}</li>
            <li>Issued At: ${details.iat!}</li>
          </ul>
        <#else>
          <h3>Authorization is not configured, user login disabled</h3>
        </#if>

      </div>
    </div>
  </div>
</body>

</html>