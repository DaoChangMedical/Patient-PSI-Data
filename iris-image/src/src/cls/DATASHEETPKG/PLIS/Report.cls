Class DATASHEETPKG.PLIS.Report Extends (%Persistent, %Populate, %XML.Adaptor, %JSON.Adaptor)
{

Property GrossFindingResult As %String;

Property LibType As %String;

Property M As %String;

Property MicroscopeFindingDescription As %String;

Property MoleResult As %String;

Property N As %String;

Property PathologyNumber As %String;

Property PathologyType As %String;

Property PhthisisType As %String;

Property SlideCount As %String;

Property SpecialAdviceResult As %String;

Property SpecimenName As %String;

Property T As %String;

Property ThirdResult As %String;

Property ThirdResultTime As %TimeStamp;

Property TumorType As %String;

Property Type As %String;

Property WaxBlockInfo As %String;

Property WaxBlocksCount As %String;

Property pdfName As %String;

Property pdfUrl As %String;

Storage Default
{
<Data name="ReportDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>GrossFindingResult</Value>
</Value>
<Value name="3">
<Value>LibType</Value>
</Value>
<Value name="4">
<Value>M</Value>
</Value>
<Value name="5">
<Value>MicroscopeFindingDescription</Value>
</Value>
<Value name="6">
<Value>MoleResult</Value>
</Value>
<Value name="7">
<Value>N</Value>
</Value>
<Value name="8">
<Value>PathologyNumber</Value>
</Value>
<Value name="9">
<Value>PathologyType</Value>
</Value>
<Value name="10">
<Value>PhthisisType</Value>
</Value>
<Value name="11">
<Value>SlideCount</Value>
</Value>
<Value name="12">
<Value>SpecialAdviceResult</Value>
</Value>
<Value name="13">
<Value>SpecimenName</Value>
</Value>
<Value name="14">
<Value>T</Value>
</Value>
<Value name="15">
<Value>ThirdResult</Value>
</Value>
<Value name="16">
<Value>ThirdResultTime</Value>
</Value>
<Value name="17">
<Value>TumorType</Value>
</Value>
<Value name="18">
<Value>Type</Value>
</Value>
<Value name="19">
<Value>WaxBlockInfo</Value>
</Value>
<Value name="20">
<Value>WaxBlocksCount</Value>
</Value>
<Value name="21">
<Value>pdfName</Value>
</Value>
<Value name="22">
<Value>pdfUrl</Value>
</Value>
</Data>
<DataLocation>^DATASHEETPKG.PLIS.ReportD</DataLocation>
<DefaultData>ReportDefaultData</DefaultData>
<IdLocation>^DATASHEETPKG.PLIS.ReportD</IdLocation>
<IndexLocation>^DATASHEETPKG.PLIS.ReportI</IndexLocation>
<StreamLocation>^DATASHEETPKG.PLIS.ReportS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
