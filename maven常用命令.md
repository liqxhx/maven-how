
mvn clean package dependency:copy-dependencies -Dmaven.test.skip=true</br>
===================================================================
手动安装jar到本地仓库</br>
mvn install:install-file -Dfile=/Users/qhli/Downloads/spring-tx-3.0.7.RELEASE.jar -DgroupId=org.springframework -DartifactId=spring-tx -Dversion=3.0.7.RELEASE -Dpackaging=jar</br>

手动安装jar源码到本地仓库</br>
mvn install:install-file -Dfile=/Users/qhli/Downloads/spring-tx-3.0.7.RELEASE-sources.jar -DgroupId=org.springframework -DartifactId=spring-tx -Dversion=3.0.7.RELEASE -Dpackaging=jar -Dclassifier=sources</br>

手动安装doc到本地仓库</br>
mvn install:install-file -Dfile=D:/spymemcached-2.10.3-javadoc.jar -DgroupId=net.spy -DartifactId=spymemcached -Dversion=2.10.3 -Dpackaging=jar -Dclassifier=javadoc</br>

===============================================================
2.x版本用mvn archetype:create</br>
3.x版本用mvn archetype:generate</br>
创建一个简单的Java工程：mvn archetype:generate -DgroupId=com.mycompany.example -DartifactId=Example</br>
创建一个java的web工程：mvn archetype:generate -DarchetypeGroupId=org.apache.maven.archetypes -DarchetypeArtifactId=maven-archetype-webapp -DgroupId=com.mycompany.app -DartifactId=my-webapp</br>

带上参数-DarchetypeCatalog=local，只读取本地的archetype-catalog.xml，用-DinterfactiveMode=false关闭交互模式</br>

查看实际pom信息: mvn help:effective-pom</br>
分析项目的依赖信息：mvn dependency:analyze 或 mvn dependency:tree</br>
查看帮助信息：mvn help:help 或 mvn help:help -Ddetail=true</br>
查看插件的帮助信息：mvn <plug-in>:help，比如：mvn dependency:help 或 mvn ant:help 等等。</br>

