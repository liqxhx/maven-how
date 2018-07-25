## -u 强制更新
```
-e详细异常，-U强制更新
```

## 排除jar
```
mvn dependency:tree -Dincludes=org.slf4j:log4j-over-slf4j

然后根据结果在pom.xml中的相应dependency下排除
<exclusions>
  <exclusion>
    <groupId>org.slf4j</groupId>
    <artifactId>log4j-over-slf4j</artifactId>
  </exclusion>
</exclusions>

要重复检查
```

## 打包
```shell
mvn clean package dependency:copy-dependencies -Dmaven.test.skip=true

# -U 强制让Maven检查所有SNAPSHOT依赖更新
# -o，--offline 离线模式工作
# -B参数：该参数表示让Maven使用批处理模式构建项目，能够避免一些需要人工参与交互而造成的挂起状态
mvn compile --settings D:/usr/apache-maven-3.5.0/conf/settings.xml -e -U -o

```

##手动安装jar到本地仓库
```

mvn install:install-file -Dfile=/Users/qhli/Downloads/spring-tx-3.0.7.RELEASE.jar -DgroupId=org.springframework -DartifactId=spring-tx -Dversion=3.0.7.RELEASE -Dpackaging=jar

手动安装jar源码到本地仓库
mvn install:install-file -Dfile=/Users/qhli/Downloads/spring-tx-3.0.7.RELEASE-sources.jar -DgroupId=org.springframework -DartifactId=spring-tx -Dversion=3.0.7.RELEASE -Dpackaging=jar -Dclassifier=sources

手动安装doc到本地仓库
mvn install:install-file -Dfile=D:/spymemcached-2.10.3-javadoc.jar -DgroupId=net.spy -DartifactId=spymemcached -Dversion=2.10.3 -Dpackaging=jar -Dclassifier=javadoc
```
## 创建项目
```
2.x版本用mvn archetype:create
3.x版本用mvn archetype:generate
创建一个简单的Java工程：mvn archetype:generate -DgroupId=com.mycompany.example -DartifactId=Example
创建一个java的web工程：mvn archetype:generate -DarchetypeGroupId=org.apache.maven.archetypes -DarchetypeArtifactId=maven-archetype-webapp -DgroupId=com.mycompany.app -DartifactId=my-webapp

带上参数-DarchetypeCatalog=local，只读取本地的archetype-catalog.xml，用-DinterfactiveMode=false关闭交互模式

查看实际pom信息: mvn help:effective-pom
分析项目的依赖信息：mvn dependency:analyze 或 mvn dependency:tree
查看帮助信息：mvn help:help 或 mvn help:help -Ddetail=true
查看插件的帮助信息：mvn <plug-in>:help，比如：mvn dependency:help 或 mvn ant:help 等等。

```
