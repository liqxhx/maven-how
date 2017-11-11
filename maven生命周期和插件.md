
[参考这里](http://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html)

## 先看mvn help:describe -Dplugin=compiler用来描述一些常用插件的信息

1. mvn org.apache.maven.plugins:maven-help-plugin:3.5.2:describe -Dplugin=org.apache.maven.plugins:maven-compiler-plugin
2. mvn maven-help-plugin:describe -Dplugin=maven-compiler-plugin
3. mvn help:describe -Dplugin=compiler
4. mvn help:describe -Dplugin=compiler -Dgoal=compile
5. mvn help:describe -Dplugin=compiler -Ddetail
 
maven通过插件的goal(目标)来工作，goal一般要绑定到生命周期的phase(阶段)来执行，一个插件可以包含多个goal，一般每个goal都默认与一个phase绑定，也可以不绑定，</br>
maven支持直接从命令行调用插件goal</br>
如：
>mvn maven-help-plugin:describe</br>
mvn maven-dependnecy-plugin:tree</br>
mvn maven-dependency-plugin:copy</br>  

上前命令中mvn maven-help-plugin:describe与mvn help:describe是一样的，后面一个使用了插件前缀。</br>
即help是maven-help-plugin的插件前缀。</br>
一条完整的命令应该是像1那样，即有完整的坐标信息：mvn groupId:atrifictId:version:goal[ options]</br>
2中省略了groupId和version，在执行时maven会自动解析出groupId和version</br>
3中直接使用插件前缀，在执行时maven会自动解析出groupId、artifactId、version</br>
不指定groupId时会默认使用org.apache.maven.plugins</br>
或者通过setting.xml的pluginGroups指定自定义的插件
> &lt;settings&gt;</br>
&lt;pluginGroups&gt;</br>
 &lt;pluginGroup&gt;here.your.plugins&lt;/pluginGroup&gt;</br>
&lt;/pluginGroups&gt;</br>
&lt;/settings&gt;</br>
version如果不指定，则通过解析通过groupId/artifactId/maven-medtadata.xml得到最新的版本</br>
插件前缀的配置位于插件仓库
http://repo1.maven.org/maven2/org/apache/maven/plugins/maven-metadata.xml</br>、
local/repo/plugins/maven-metadata.xml中</br>
其中类似key-value的形似配置了插件前缀与插件artifactId的对应关系

</br>
自定义的插件如果没有配置pluginGroup和在本地插件仓库local/repo/plugins/maven-metadata.xml中指定，要执行插件必须给出完成的命令

## maven的三套生命周期
* clean
* default
* site
  
每套生命周期由不同的Phases(阶段)组成,phase是一个抽象的概念，不做任何事情，具体事情由绑定的插件的某个goal(目标)来完成。
</br>
### clean生命周期phase及默认绑定的插件的goal
pre-clean</br>
clean                         clean:clean</br>
post-clean</br>
### site生命周期phase及默认绑定的插件的goal
pre-site</br>
site                          site:site</br>
post-site</br>
site-deploy                   site:deploy</br>
### default生命周期phase及默认绑定的插件的goal
validate</br>
initialize</br>
generate-sources</br>
process-sources               resources:resources</br>
generate-resources</br>
process-resources</br>
compile                       compiler:compile</br>
process-classes</br>
generate-test-sources</br>
process-test-sources          resources:testResources</br>
generate-test-resources</br>
process-test-resources</br>
test-compile                  compiler:testCompile</br>
process-test-classes</br>
test                          surefire:test</br>
prepare-package</br>
package                       jar:jar</br>
pre-integration-test</br>
integration-test</br>
post-integration-test</br>
verify</br>
install                       install:install</br>
deploy                        deploy:deploy


### 自定义插件的goal绑定到生命周期的那个phase来执行
很多插件绑定中goal已默认绑定了一个phase</br>
如果配置中不指定phase，则使用默认

> &lt;build&gt;</br>
    &lt;plugins&gt;</br>
        &lt;plugin&gt;</br>
            &lt;groupId&gt;org.apache.maven.plugins&lt;/groupId&gt;</br>
            &lt;artifactId&gt;maven-compiler-plugin&lt;/artifactId&gt;</br>
            &lt;version&gt;3.5.1&lt;/version&gt;</br>
            &lt;configuration&gt;</br>
                &lt;source&gt;${java.version}&lt;/source&gt;</br>
                &lt;target&gt;${java.version}&lt;/target&gt;</br>
                &lt;testSource&gt;${java.version}&lt;/testSource&gt;</br>
                &lt;testTarget&gt;${java.version}&lt;/testTarget&gt;</br>
            &lt;/configuration&gt;</br>
        &lt;/plugin&gt;</br>
        &lt;!--配置生成Javadoc包--&gt;</br>
        &lt;plugin&gt;</br>
            &lt;groupId&gt;org.apache.maven.plugins&lt;/groupId&gt;</br>
            &lt;artifactId&gt;maven-javadoc-plugin&lt;/artifactId&gt;</br>
            &lt;version&gt;2.10.4&lt;/version&gt;</br>
            &lt;configuration&gt;</br>
                &lt;encoding&gt;UTF-8&lt;/encoding&gt;</br>
                &lt;aggregate&gt;true&lt;/aggregate&gt;</br>
                &lt;charset&gt;UTF-8&lt;/charset&gt;</br>
                &lt;docencoding&gt;UTF-8&lt;/docencoding&gt;</br>
            &lt;/configuration&gt;</br>
            &lt;executions&gt;</br>
                &lt;execution&gt;</br>
                    &lt;id&gt;attach-javadocs&lt;/id&gt;</br>
                    &lt;goals&gt;</br>
                        &lt;goal&gt;jar&lt;/goal&gt;</br>
                    &lt;/goals&gt;</br>
                &lt;/execution&gt;</br>
            &lt;/executions&gt;</br>
        &lt;/plugin&gt;</br>
        &lt;!--配置生成源码包--&gt;</br>
        &lt;plugin&gt;</br>
            &lt;groupId&gt;org.apache.maven.plugins&lt;/groupId&gt;</br>
            &lt;artifactId&gt;maven-source-plugin&lt;/artifactId&gt;</br>
            &lt;version&gt;3.0.1&lt;/version&gt;</br>
            &lt;executions&gt;</br>
                &lt;execution&gt;</br>
                    &lt;id&gt;attach-sources&lt;/id&gt;</br>
                    &lt;goals&gt;</br>
                        &lt;goal&gt;jar&lt;/goal&gt;</br>
                    &lt;/goals&gt;</br>
                &lt;/execution&gt;</br>
            &lt;/executions&gt;</br>
        &lt;/plugin&gt;</br>
    &lt;/plugins&gt;</br>
&lt;/build&gt;</br>
