declare namespace xf = "http://tempuri.org/TigoOnline/GetTechServiceOrders/XQUERY/ReadCad/";

declare function xf:ReadCad($parametro as xs:string,
    $cadena as xs:string)
    as xs:string {
        let $search1 as xs:string:=concat('&lt;',$parametro,'>')
     	let $search2 as xs:string:=concat('&lt;/',$parametro,'>')
       	let $se as xs:string :=fn:substring-after($cadena,$search1)
	   	let $val as xs:string :=fn:substring-before($se,$search2)
	   	return $val	 
};

declare variable $parametro as xs:string external;
declare variable $cadena as xs:string external;

xf:ReadCad($parametro,
    $cadena)