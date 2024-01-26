# Patient PSI Data Platform Container Version


 **The complete loading and startup of the Interoperability Suite Container Version take approximately 10-15 minutes.** 

The Patient PSI Data Platform Container Version consists of two containers:

+ iris-demo ： This container contains the Patient PSI data elements and a RESTful API for retrieving patient personal information and pathological examination data：
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
6. Manually start the production in the Management Portal under the
   ```shell
   namespace: 'DATASHEET'
   production :'DATASHEETPKG.DataSheetProduction'.
   ```
7. Access the example website at http://localhost:4007/#/patientPSI
   ```shell
   Note:Google Chrome is recommended
   ```
   
## System Operation Steps:
1. Log in to the IRIS Management Portal, ensuring that the namespace 'DataSheet' and production 'DATASHEETPKG.DataSheetProduction' have started successfully.

![Alt text](/image/iris.png)

2. Visit the Patient PSI Data Platform: http://localhost:4007/#/patientPSI.

![Alt text](/image/psi-init.png)

3. In the dropdown for disease categories, select different disease types; the corresponding patient list will be displayed below.

![Alt text](/image/psi-patient.png)

4. Click on a patient card to open the patient information page. This page includes the patient's PSI information, covering Personal Details, Clinical Issues, Medication Therapy, Vaccination Status, Test Results (Lab Tests, Imaging Tests,  ECG (Heart Test), Pathology Tests), and Nursing Plans (Diagnoses, Follow-ups, Patient relations).

![Alt text](/image/patient-info.png)

5. In the "Test Results" section, specifically the "Pathology Tests," detailed patient pathology examination information is available. If a report is present, it can be downloaded and viewed by clicking on the last column [pdf].

![Alt text](/image/pliex.png)

![Alt text](/image/report.png)

[《Installation Steps》](https://github.com/DaoChangMedical/Patient-PSI-Data/assets/157679162/9f5c74b7-3549-4085-ae74-49bc7ab17d52)
[《Implementation Guide for Patient PSI Use Cases》](https://github.com/DaoChangMedical/Patient-PSI-Data/assets/157679162/d5f0bcad-b471-4573-bc10-47074bee2cf5) can be found here along with video recordings.


**If you are deploying the Docker Community Edition, the current InterSystems IRIS instance being used is IRISHealth 2023.1.1.380.0 Community Edition, which comes with an embedded license and is intended for testing and secondary development purposes only. If you intend to deploy in a production environment, please use the Docker Standard Edition or the officially released version of IRISHealth for local or cloud deployment.**

