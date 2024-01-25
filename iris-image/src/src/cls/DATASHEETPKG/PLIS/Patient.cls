Class DATASHEETPKG.PLIS.Patient Extends %Persistent
{

Property Address As %String;

Property Age As %String;

Property AgeUnit As %String;

Property BirthTime As %TimeStamp;

Property Career As %String;

Property Gender As %String;

Property MaritalStatus As %String;

Property Name As %String;

Property PathologyNumber As %String;

Storage Default
{
<Data name="PatientDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Address</Value>
</Value>
<Value name="3">
<Value>Age</Value>
</Value>
<Value name="4">
<Value>AgeUnit</Value>
</Value>
<Value name="5">
<Value>BirthTime</Value>
</Value>
<Value name="6">
<Value>Career</Value>
</Value>
<Value name="7">
<Value>Gender</Value>
</Value>
<Value name="8">
<Value>MaritalStatus</Value>
</Value>
<Value name="9">
<Value>Name</Value>
</Value>
<Value name="10">
<Value>PathologyNumber</Value>
</Value>
</Data>
<DataLocation>^DATASHEETPKG.PLIS.PatientD</DataLocation>
<DefaultData>PatientDefaultData</DefaultData>
<IdLocation>^DATASHEETPKG.PLIS.PatientD</IdLocation>
<IndexLocation>^DATASHEETPKG.PLIS.PatientI</IndexLocation>
<StreamLocation>^DATASHEETPKG.PLIS.PatientS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
