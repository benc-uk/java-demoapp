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
      <h5 class="card-header bg-success text-white"><i class="fa fa-wrench"></i> System Info</h5>
      <div class="card-body">

        <table class="table table-striped table-hover ">
          <tbody>
            <tr><td><i class="fas fa-code-branch"></i>&nbsp; App Version</td>
              <td>${appVersion!"Not available"}</td></tr>
            
            <tr><td><i class="fa fa-cube"></i>&nbsp; Containerized</td>
              <td><#if isDocker>Looks like we're running in a Docker container! &#x1F604;<#else>Not running as a Docker container &#x1F622;</#if></td></tr>
            
            <tr><td><i class="fa fa-project-diagram"></i>&nbsp; Kubernetes</td>
              <td><#if isKube>We're also running in a Kubernetes pod! &#x1f44d;<#else>Not running in Kubernetes &#x1F622;</#if></td></tr>
            
            <tr><td><i class="fa fa-home"></i>&nbsp; Hostname</td>
              <td>${hostname}</td></tr>
              
            <tr><td><i class="fa fa-microchip"></i>&nbsp; Processors</td>
              <td>${cpuCount} (${osArch})</td></tr>

            <tr><td><i class="fa fa-laptop"></i>&nbsp; Operating System</td>
              <td>${osName} (${osVersion})</td></tr>

            <tr><td><i class="fa fa-coffee"></i>&nbsp; Java Version</td>
              <td>${javaVersion} (${javaVendor})</td></tr>
          </tbody>
        </table>
      </div>
    </div>

    <br>

    <div class="card">
      <h5 class="card-header bg-success text-white"><i class="fa fa-eye"></i> Environmental Variables</h5>
      <div class="card-body">

        <div class="envtable">
          <table class="table table-hover" >    
            <#list envVars?keys as key> 
              <tr> <td> ${key} </td> <td class="envvars"> ${envVars[key]} </td> </tr>
            </#list> 
          </table>
        </div>

      </div>
    </div>    
  </div>
</body>

</html>