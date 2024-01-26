# 互联互通套件容器版

如果遇到 
```
failed to solve: containers.intersystems.com/intersystems/webgateway:2023.1.1.380.0: pulling from host containers.intersystems.com failed with status code [manifests 2023.1.1.380.0]: 403 Forbidden
```
请containers.intersystems.com 进行验证，可以使用community 的账号登陆


 **环境完全载入启动需要大概10-15分钟的时间** 

互联互通套件容器版包含两个容器：

+ cch-iris ： 这个容器里面包含InterSystems IRIS的所有特性和互联互通测评的基础：
  + 数据元、值集SQL模型
  + 发布/订阅交互服务
  + 互联互通文档转FHIR功能
  + 互联互通相关的所有RESTful API
  + FHIR服务器、资源仓库、FHIR SQL Builder
+ cch-webgateway：这个容器里面包含一些测试用例（**这些用例只用于测试、展示、调用说明，用户可以根据需要创建自己的前端应用开发**）
  + 数据元、值集展示用例
  + 电子病历共享文档生成用例
  + 发布/订阅用例（模拟HIS、EMR数据交互用例）
  + 平台监控用例
  + SmartOnFHIR用例

## 使用Docker部署测试环境

**Image 'IRISHealth community 2023.1.1.380.0' 需要从InterSystems官方Docker镜像仓库中拉取，所以该环境搭建时需要连网**

1. 安装[Docker-destop](https://www.docker.com/products/docker-desktop)

2. 下载源代码包，或者克隆此仓库。

3. 在已下载的安装文件夹中运行以下Docker命令

   ```shell
   docker-compose up -d
   ```

4. 运行docker-compose后，会启动两个container其具体功能[如上Image中所述](#互联互通套件容器版包含两个Image：)

   ```shell
   cch-iris
   cch-webgateway
   ```

5. 访问InterSystems IRIS管理门户，端口号52880

   ```shell
   IRIS管理门户： http://localhost:52880/csp/sys/%25CSP.Portal.Home.zen?$NAMESPACE=%25SYS&
   用户名：superuser
   密码：fountain
   ```

6. 访问用例网址，端口号8080

   ```shell
   共享文档控制台：http://localhost:8080/hccs/control/#/dataset
   添加订户/订阅：http://localhost:8080/hccs/dist/#/index/index
   服务监控：http://localhost:8080/hccs/monitor/#/hlht
   模拟HIS：http://localhost:8080/hccs/his/#/patient
   模拟EMR：http://localhost:8080/hccs/emr/#/patients
   ```
[《实施路径指南》](https://shimo.im/docs/aBAYMK7opotPlRAj/])
[《CCH基于用例的实施指南》](https://shimo.im/docx/Wr3DpvJvaeUpBy3J/) 这里有详细文档


**如果您部署的是互联互通套件Docker社区版，当前其InterSystems IRIS实例使用的是IRISHealth 2023.1.1.380.0 社区版，其内嵌License，仅供测试、二次开发使用。如果要进行生产环境的部署，请使用互联互通套件Docker标准版、本地或云部署的IRISHealth正式发布版本。**

