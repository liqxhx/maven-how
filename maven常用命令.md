
mvn clean package dependency:copy-dependencies -Dmaven.test.skip=true
===================================================================
手动安装jar到本地仓库
mvn install:install-file -Dfile=/Users/qhli/Downloads/spring-tx-3.0.7.RELEASE.jar -DgroupId=org.springframework -DartifactId=spring-tx -Dversion=3.0.7.RELEASE -Dpackaging=jar

手动安装jar源码到本地仓库
mvn install:install-file -Dfile=/Users/qhli/Downloads/spring-tx-3.0.7.RELEASE-sources.jar -DgroupId=org.springframework -DartifactId=spring-tx -Dversion=3.0.7.RELEASE -Dpackaging=jar -Dclassifier=sources

手动安装doc到本地仓库
mvn install:install-file -Dfile=D:/spymemcached-2.10.3-javadoc.jar -DgroupId=net.spy -DartifactId=spymemcached -Dversion=2.10.3 -Dpackaging=jar -Dclassifier=javadoc

===============================================================
创建一个简单的Java工程：mvn archetype:create -DgroupId=com.mycompany.example -DartifactId=Example
创建一个java的web工程：mvn archetype:create -DarchetypeGroupId=org.apache.maven.archetypes -DarchetypeArtifactId=maven-archetype-webapp -DgroupId=com.mycompany.app -DartifactId=my-webapp

查看实际pom信息: mvn help:effective-pom
分析项目的依赖信息：mvn dependency:analyze 或 mvn dependency:tree
查看帮助信息：mvn help:help 或 mvn help:help -Ddetail=true
查看插件的帮助信息：mvn <plug-in>:help，比如：mvn dependency:help 或 mvn ant:help 等等。

