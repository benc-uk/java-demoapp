
# Setup 

OpenJDK 11
```
sudo apt install maven
sudo apt install openjdk-11-jdk
```
JAVA_HOME
```
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
```


# Dropwizard 
version 2.0.0-rc4
```
mvn archetype:generate -DarchetypeGroupId=io.dropwizard.archetypes -DarchetypeArtifactId=java-simple -DarchetypeVersion=2.0.0-rc4
```

# POM
Javadoc errors
```xml
  <artifactId>maven-javadoc-plugin</artifactId>
  <version>3.1.0</version>
  <configuration>
      <source>1.7</source>
  </configuration>
```

# VS Code
Extensions

Debug
Edit `.settings/org.eclipse.jdt.core.prefs`
```
eclipse.preferences.version=1
org.eclipse.jdt.core.compiler.codegen.targetPlatform=11
org.eclipse.jdt.core.compiler.compliance=11
org.eclipse.jdt.core.compiler.problem.enablePreviewFeatures=disabled
org.eclipse.jdt.core.compiler.problem.forbiddenReference=warning
org.eclipse.jdt.core.compiler.problem.reportPreviewFeatures=ignore
org.eclipse.jdt.core.compiler.processAnnotations=disabled
org.eclipse.jdt.core.compiler.release=enabled
org.eclipse.jdt.core.compiler.source=11
```

# Dockerfile
