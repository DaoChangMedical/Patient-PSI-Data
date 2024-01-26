# 互联互通套件容器版


 **环境完全载入启动需要大概10-15分钟的时间** 

互联互通套件容器版包含两个容器：

+ iris-demo ： 这个容器里面包含InterSystems IRIS的所有特性和互联互通测评的基础：
  + 数据元、值集SQL模型
  + 发布/订阅交互服务
  + 互联互通相关的所有RESTful API
+ vue-demo：这个容器里面包含一些测试用例（**这些用例只用于测试、展示、调用说明，用户可以根据需要创建自己的前端应用开发**）
  + 值集展示用例
  + 临床问题信息、检查结果信息、个人信息等患者PSI数据信息展示用例
  + 病理检查报告用例

## 使用Docker部署测试环境

**Image 'IRISHealth community 2023.1.1.380.0' 需要从InterSystems官方Docker镜像仓库中拉取，**
**Image 'nginx' 需要Docker镜像仓库中拉取，所以该环境搭建时需要连网**
1. 安装[Docker-destop](https://www.docker.com/products/docker-desktop)

2. 下载源代码包，或者克隆此仓库。

3. 在已下载的安装文件夹中运行以下Docker命令

   ```shell
   docker-compose up -d
   ```

4. 运行docker-compose后，会启动两个container其具体功能[如上Image中所述](#互联互通套件容器版包含两个Image：)

   ```shell
   iris-demo
   vue-demo
   ```

5. 访问InterSystems IRIS管理门户，端口号52775

   ```shell
   IRIS管理门户： http://localhost:52775/csp/sys/UtilHome.csp
   用户名：superuser
   初始密码：SYS
   新密码请改为：123
   ※管理门户初次访问无法加载的情况下，请等待2分钟左右再次尝试
   ```
6. 进入管理门户后需手动启动production
   ```shell
   命名空间：DATASHEET
   production：DATASHEETPKG.DataSheetProduction
   ```
7. 访问用例网址，端口号4007

   ```shell
   患者PSI数据控制台：http://localhost:4007/#/patientPSI
   ※建议使用谷歌浏览器
   ```
[《实施路径指南》](https://shimo.im/docs/aBAYMK7opotPlRAj/])
[《CCH基于用例的实施指南》](https://shimo.im/docx/Wr3DpvJvaeUpBy3J/) 这里有详细文档


**如果您部署的是互联互通套件Docker社区版，当前其InterSystems IRIS实例使用的是IRISHealth 2023.1.1.380.0 社区版，其内嵌License，仅供测试、二次开发使用。如果要进行生产环境的部署，请使用互联互通套件Docker标准版、本地或云部署的IRISHealth正式发布版本。**

