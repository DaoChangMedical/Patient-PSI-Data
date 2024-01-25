Class DATASHEETPKG.PISDataTrans Extends Ens.DataTransformDTL [ DependsOn = (DATASHEETPKG.Message.pisRequestMessage, DATASHEETPKG.Message.callPISRequest) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='DATASHEETPKG.Message.pisRequestMessage' targetClass='DATASHEETPKG.Message.callPISRequest' create='new' language='objectscript' >
<assign value='source.PathologyNumber' property='target.PathologyNumber' action='set' />
</transform>
}

}
