
========================================================================================
手动安装jar到本地仓库
mvn install:install-file -Dfile=/Users/qhli/Downloads/spring-tx-3.0.7.RELEASE.jar -DgroupId=org.springframework -DartifactId=spring-tx -Dversion=3.0.7.RELEASE -Dpackaging=jar

手动安装jar源码到本地仓库
mvn install:install-file -Dfile=/Users/qhli/Downloads/spring-tx-3.0.7.RELEASE-sources.jar -DgroupId=org.springframework -DartifactId=spring-tx -Dversion=3.0.7.RELEASE -Dpackaging=jar -Dclassifier=sources

手动安装doc到本地仓库
mvn install:install-file -Dfile=D:/spymemcached-2.10.3-javadoc.jar -DgroupId=net.spy -DartifactId=spymemcached -Dversion=2.10.3 -Dpackaging=jar -Dclassifier=javadoc

==========================================================================================
下载源码
mvn dependency:sources
下载javadoc
mvn dependnecy:resolve -Dclassifier=javadoc
