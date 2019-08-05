<!doctype html>
<html>

<head>
  <#include "_head.ftl">
  <title>Java DemoApp: JMX</title>

</head>

<body>
  <#include "_nav.ftl">
  <script>
    function toggle(index) {
      var table = document.getElementById("table_"+index);
      if(table.style.display == "none")
        table.style.display = "block"
      else
        table.style.display = "none"
    }
  </script>

  <div class="container">
    <#if time??>
      <div class="alert alert-success" role="alert">
        Phew! That took me ${time} millisecs
      </div>    
    </#if>
    <div class="card">
      <h5 class="card-header bg-success text-white"><i class="fa fa-tools"></i> JMX mBeans Explorer</h5>
      <div class="card-body">
        <#list data as beanName, beanData>
          <#if beanData?size gt 0>
          <div class="card">
            <h5 class="card-header bg-info text-white" style="cursor: pointer" onclick="toggle(${beanName?index})">${beanName}</h5>
            <div class="card-body" style="display: none" id="table_${beanName?index}">
              <table class="table table-striped">
                <#list beanData as attr, value>
                  <tr><td><b>${attr}</b></td><td style="max-width:300px; word-wrap:break-word;">${value}</td></tr>
                </#list>
              </table>
            </div>
          </div> <br/>
          </#if>
        </#list>
      </div>
    </div>
  </div>

</body>

</html>