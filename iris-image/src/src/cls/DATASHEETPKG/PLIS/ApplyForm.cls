Class DATASHEETPKG.PLIS.ApplyForm Extends %Persistent
{

Property ApplyNumber As %String;

Property CheckitemName As %String;

Property ClinicalResult As %String;

Property HBsAg As %String;

Property HCV As %String;

Property HIV As %String;

Property InPatientNumber As %String;

Property MedicalHistorySummary As %String;

Property OutPatientNumber As %String;

Property PathologyNumber As %String;

Property PatientSource As %String;

Property SubmittingDepartment As %String;

Property SurgeryFinding As %String;

Property TP As %String;

Storage Default
{
<Data name="ApplyFormDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ApplyNumber</Value>
</Value>
<Value name="3">
<Value>CheckitemName</Value>
</Value>
<Value name="4">
<Value>ClinicalResult</Value>
</Value>
<Value name="5">
<Value>HBsAg</Value>
</Value>
<Value name="6">
<Value>HCV</Value>
</Value>
<Value name="7">
<Value>HIV</Value>
</Value>
<Value name="8">
<Value>InPatientNumber</Value>
</Value>
<Value name="9">
<Value>MedicalHistorySummary</Value>
</Value>
<Value name="10">
<Value>OutPatientNumber</Value>
</Value>
<Value name="11">
<Value>PathologyNumber</Value>
</Value>
<Value name="12">
<Value>PatientSource</Value>
</Value>
<Value name="13">
<Value>SubmittingDepartment</Value>
</Value>
<Value name="14">
<Value>SurgeryFinding</Value>
</Value>
<Value name="15">
<Value>TP</Value>
</Value>
</Data>
<DataLocation>^DATASHEETPKG.PLIS.ApplyFormD</DataLocation>
<DefaultData>ApplyFormDefaultData</DefaultData>
<IdLocation>^DATASHEETPKG.PLIS.ApplyFormD</IdLocation>
<IndexLocation>^DATASHEETPKG.PLIS.ApplyFormI</IndexLocation>
<StreamLocation>^DATASHEETPKG.PLIS.ApplyFormS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
