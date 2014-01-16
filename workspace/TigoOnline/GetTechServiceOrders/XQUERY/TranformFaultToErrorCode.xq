declare namespace xf = "http://tempuri.org/TigoOnline/GetAccountSummary/XQUERY/TranformConsumosFault/";

declare function xf:TranformConsumosFault($codeError as xs:string,
    $reason as xs:string)
    as xs:string {
    
     if(fn:contains($reason, '&lt;errorCode>')) 
   then
	   	let $se as xs:string :=fn:substring-after($reason,'&lt;errorCode>')
	   	let $codEx as xs:string :=fn:substring-before($se,'&lt;/errorCode>')
	   	return $codEx	   
   else 
   		$codeError      
};

declare variable $codeError as xs:string external;
declare variable $reason as xs:string external;

xf:TranformConsumosFault($codeError,
    $reason)