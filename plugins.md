# mybatis-generator-maven-plugin 自动生成代码
```
第一步，在pom文件中引入如下插件
<plugin>  
                <groupId>org.mybatis.generator</groupId>  
                <artifactId>mybatis-generator-maven-plugin</artifactId>  
                <version>1.3.2</version>  
                <configuration>  
                    <verbose>true</verbose>  
                    <overwrite>true</overwrite>  
                </configuration>  
</plugin>
在resources目录下添加generatorConfig.xml配置
```
