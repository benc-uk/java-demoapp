<!doctype html>
<html>

<head>
  <#include "_head.ftl">
  <title>Java DemoApp</title>
</head>

<body>
  <#include "_nav.ftl">
  <div class="container">

    <div class="jumbotron">
      <h2 class="index-head"><img src='img/java.svg' height='90px' /> Java Demo App</h2>
      <hr />
      <p class="lead">
        This is a simple Java web app built using Spring Boot. It has been designed with cloud
        demos & containers in mind. Demonstrating capabilities such as auto scaling, deployment to Azure or Kubernetes, or anytime you want 
        something quick and lightweight to run & deploy 😄<br/><br/>Basic features:
        <ul>
            <li>System status / information view</li>
            <li>Authentication via Azure Active Directory</li>            
            <li>App Insights support</li>
          </ul>
      </p>
      <br />

      <p>
        <img src='/img/octocat.png' width='58px' /> &nbsp;
        <a target='_blank' href='https://github.com/benc-uk/java-demoapp' class="btn btn-info btn-lg">Project on
          Github</a>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <img src='/img/docker.png' width='58px' /> &nbsp;
        <a target='_blank' href='https://hub.docker.com/r/bencuk/java-demoapp' class="btn btn-info btn-lg">Docker images
          on Dockerhub</a>
      </p>

      <hr />

      <p>
        <img src='/img/get-started.svg' width='58px' /> &nbsp;
        <a target='_blank' href='https://docs.microsoft.com/en-us/azure/java/?view=azure-java-latest'
          class="btn btn-success btn-lg">Get started with Azure &amp; Java</a>
      </p>


      <br />
      <h4>Microsoft <i class="fa fa-heart"></i> Open Source</h4>
    </div>

  </div>
</body>

</html>