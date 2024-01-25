/// 
Class DATASHEETPKG.PLIExamBP Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='DATASHEETPKG.Message.pisRequestMessage' response='EnsLib.REST.GenericMessage' height='2000' width='2000' >
<context>
<property name='encCode' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='500' />
</parameters>
</property>
<property name='ReturnMsg' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50000' />
</parameters>
</property>
<property name='ResultStream' type='Ens.StreamContainer' instantiate='1' />
<property name='arrtemp' type='%DynamicArray' instantiate='0' />
<property name='tempData' type='DATASHEETPKG.Message.callPISRequest' instantiate='1' />
</context>
<sequence xend='200' yend='1700' >
<assign property="context.encCode" value="request.EncryptionCode" action="set" xpos='200' ypos='250' />
<scope xpos='200' ypos='350' xend='200' yend='1500' >
<switch xpos='200' ypos='450' xend='200' yend='1250' >
<case condition='context.encCode="daochang"' name='正确' >
<transform name='信息转换' class='DATASHEETPKG.PISDataTrans' source='request' target='context.tempData' xpos='470' ypos='600' />
<call name='查询病理检查信息' target='QueryPISInfo' async='0' xpos='470' ypos='700' >
<request type='DATASHEETPKG.Message.callPISRequest' >
<assign property="callrequest" value="context.tempData" action="set" />
</request>
<response type='Ens.StreamContainer' >
<assign property="context.ResultStream" value="callresponse" action="set" />
</response>
</call>
<if condition='context.ResultStream.Stream = ""' xpos='470' ypos='800' xend='470' yend='1150' >
<true>
<assign property="context.ReturnMsg" value="&quot;{&quot;&quot;status&quot;&quot;:&quot;&quot;-1&quot;&quot;}&quot;" action="set" xpos='470' ypos='950' />
</true>
<false>
<code xpos='740' ypos='950' >
<![CDATA[  SET temp=##class(HS.Util.StreamUtils).EnsureString(context.ResultStream.Stream)
  set entity=##class(%DynamicObject).%FromJSON(temp)
  set items = entity.%GetIterator()
  while items.%GetNext(.key,.val){ do context.arrtemp.%Push(val) }]]>
</code>
<assign property="context.ReturnMsg" value="$REPLACE(context.arrtemp.%ToJSON(),&quot;\u0000&quot;,&quot;&quot;)" action="set" xpos='740' ypos='1050' />
</false>
</if>
</case>
<default>
<assign property="context.ReturnMsg" value="&quot;{&quot;&quot;status&quot;&quot;:&quot;&quot;-2&quot;&quot;}&quot;" action="set" xpos='200' ypos='600' />
</default>
</switch>
<faulthandlers>
<catchall xpos='200' ypos='1350' xend='200' yend='350' >
<assign property="context.ReturnMsg" value="&quot;{&quot;&quot;status&quot;&quot;:&quot;&quot;-3&quot;&quot;}&quot;" action="set" xpos='200' ypos='250' />
</catchall>
</faulthandlers>
</scope>
<code xpos='200' ypos='1600' >
<![CDATA[ set tmp = ##class(%Stream.GlobalCharacter).%New()
 do tmp.Write(context.ReturnMsg)
 Set response.Stream = tmp]]>
</code>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
