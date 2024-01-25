Class DATASHEETPKG.DataSheetProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="DATASHEETPKG.DataSheetProduction" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="QueryPatientInfo" Category="" ClassName="EnsLib.SQL.Operation.GenericOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="Query">select p.Address,
p.Age,
p.AgeUnit,
CONVERT(varchar(100),p.BirthTime,111) As BirthTime,
p.Career,
p.Gender,
p.MaritalStatus,
p.Name,
p.PathologyNumber,
af.InPatientNumber,
af.OutPatientNumber
from DATASHEETPKG_PLIS.Patient As p
left join DATASHEETPKG_PLIS.ApplyForm As af on af.PathologyNumber=p.PathologyNumber</Setting>
    <Setting Target="Adapter" Name="DSN">irisjdbc</Setting>
    <Setting Target="Host" Name="RequestClass">EnsLib.REST.GenericMessage</Setting>
    <Setting Target="Adapter" Name="JGService">JGService</Setting>
  </Item>
  <Item Name="DataSheetPatientSumBP" Category="" ClassName="DATASHEETPKG.PatientSumBP" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="RequestPatientSumService" Category="" ClassName="DATASHEETPKG.BS.RequestPatientSumServ" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Port"></Setting>
    <Setting Target="Host" Name="TargetConfigName">DataSheetPatientSumBP</Setting>
    <Setting Target="Host" Name="TargetConfigNames">DataSheetPatientSumBP</Setting>
  </Item>
  <Item Name="QueryPISInfo" Category="" ClassName="EnsLib.SQL.Operation.GenericOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="DSN">irisjdbc</Setting>
    <Setting Target="Host" Name="Query">select 
af.PathologyNumber,
af.ApplyNumber,
af.CheckitemName,
af.ClinicalResult,
af.HBsAg,
af.HCV,
af.HIV,
af.InPatientNumber,
af.MedicalHistorySummary,
af.OutPatientNumber,
af.PatientSource,
af.SubmittingDepartment,
af.SurgeryFinding,
af.TP,
rt.GrossFindingResult,
rt.LibType,
rt.M,
rt.MicroscopeFindingDescription,
rt.MoleResult,
rt.N,
rt.PathologyType,
rt.PhthisisType,
rt.SlideCount,
rt.SpecialAdviceResult,
rt.SpecimenName,
rt.T,
rt.ThirdResult,
rt.ThirdResultTime,
rt.TumorType,
rt.Type,
rt.WaxBlockInfo,
rt.WaxBlocksCount,
rt.pdfName,
rt.pdfUrl
from DATASHEETPKG_PLIS.ApplyForm As af
inner join DATASHEETPKG_PLIS.Report As rt on rt.PathologyNumber=af.PathologyNumber
where af.PathologyNumber=?</Setting>
    <Setting Target="Host" Name="InputParameters">*PathologyNumber</Setting>
    <Setting Target="Host" Name="RequestClass">DATASHEETPKG.Message.callPISRequest</Setting>
    <Setting Target="Adapter" Name="JGService">JGService</Setting>
  </Item>
  <Item Name="DataSheetPLIExamBP" Category="" ClassName="DATASHEETPKG.PLIExamBP" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="RequestPLIExamServ" Category="" ClassName="DATASHEETPKG.BS.RequestPLIExamServ" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">DataSheetPLIExamBP</Setting>
  </Item>
  <Item Name="JGService" Category="" ClassName="EnsLib.JavaGateway.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
