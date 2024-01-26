# Patient PSI Data Platform Container Version


 **The complete loading and startup of the Interoperability Suite Container Version take approximately 10-15 minutes.** 

The Patient PSI Data Platform Container Version consists of two containers:

+ iris-demo ： 这个容器里面包含患者PSI数据元及RESTful API：
  + 患者PSI数据元
  + 获取患者个人信息及病理检查信息的RESTful API
+ vue-demo: This container contains test cases used for testing, showcasing, and providing instructions for calls. Users can create their own frontend applications as needed. Test cases include:
  + Value set showcase
  + Patient PSI data information showcase, including clinical problem information, examination results, and personal information
  + Pathological examination report cases

## Deploying the Testing Environment Using Docker

**The 'IRISHealth community 2023.1.1.380.0' image needs to be pulled from the official InterSystems Docker image repository, and the 'nginx' image needs to be pulled from the Docker image repository. Therefore, an internet connection is required during the environment setup.**
1. Install Docker Desktop.(https://www.docker.com/products/docker-desktop)

2. Download the source code package or clone this repository.

3. In the downloaded installation folder, run the following Docker

   ```shell
   docker-compose up -d
   ```

4. After running docker-compose, two containers will be started, each with specific functionalities as described in the images above:

   ```shell
   iris-demo
   vue-demo
   ```

5. Access the InterSystems IRIS Management Portal with the following credentials:

   ```shell
   IRIS Management Portal: http://localhost:52775/csp/sys/UtilHome.csp
   Username:superuser
   Initial Password:SYS
   Change the password to '123' on the first login.
   Note: If the Management Portal does not load on the initial attempt, it indicates that IRIS has not completed its startup. Please wait a few minutes and try again.
   
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
   
## 系统运行步骤
1. 登录IRIS管理门户，确保命名空间【DataSheet】内Production【DATASHEETPKG.DataSheetProduction】已正常启动

![Alt text](/image/iris.png)

2. 访问患者PSI数据控制台：http://localhost:4007/#/patientPSI

![Alt text](/image/psi-init.png)

3. 疾病种类下拉框内选择不同的疾病种类，下方显示对应的患者列表

![Alt text](/image/psi-patient.png)

4. 点击患者卡片，会弹出患者信息页面，此页面包含患者PSI信息,包括
个人信息、临床问题信息、药物治疗信息 、免疫状态信息 、检查结果信息(实验室检查信息、影像学检查信息 、心电图信息、病理检查信息)、护理计划信息（诊断信息、随访信息、患者关系信息）

![Alt text](/image/patient-info.png)

5.【检查结果信息=》病理检查信息】包含了患者病理检查信息明细，如果有报告，则可以通过点击最后一列【pdf】进行下载并查看报告详细内容

![Alt text](/image/pliex.png)

![Alt text](/image/report.png)

[《安装步骤》]()
[《患者PSI用例的实施指南》](https://github.com/DaoChangMedical/Patient-PSI-Data/assets/157679162/bd7adc07-6eee-49a9-a12b-51603e64ae55) 这里有视频记录


**如果您部署的是互联互通套件Docker社区版，当前其InterSystems IRIS实例使用的是IRISHealth 2023.1.1.380.0 社区版，其内嵌License，仅供测试、二次开发使用。如果要进行生产环境的部署，请使用互联互通套件Docker标准版、本地或云部署的IRISHealth正式发布版本。**

