Class DATASHEETPKG.BS.Interface.RestHandler Extends %CSP.REST
{

Parameter CONTENTTYPE = "application/json";

Parameter CONVERTINPUTSTREAM = 1;

Parameter CHARSET = "utf-8";

XData UrlMap
{
<Routes>
    <Map Prefix="/business" Forward="DATASHEETPKG.BS.Interface.Business"/>
  </Routes>
}

}
