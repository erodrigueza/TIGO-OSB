declare namespace xf = "http://tempuri.org/TigoOnline/GetAccountSummary/XQUERY/ReadCadena/";
declare namespace xq="http://www.tigo.com/TigoOnLine/AccesosValues";



declare function xf:ReadCadena($param as xs:string, $cadena as xs:string)
    as xs:string {
     
     	let $search1 as xs:string:=concat('&lt;',$param,'>')
     	let $search2 as xs:string:=concat('&lt;/',$param,'>')
       	let $se as xs:string :=fn:substring-after($cadena,$search1)
	   	let $val as xs:string :=fn:substring-before($se,$search2)
	   	return $val	   
        
};

declare variable $param as xs:string external;
declare variable $cadena as xs:string external;

xf:ReadCadena($param,$cadena)