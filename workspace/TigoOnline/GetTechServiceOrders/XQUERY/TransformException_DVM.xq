(:: pragma  parameter="$dvmTable" type="anyType" ::)
(:: pragma bea:global-element-return element="ns1:getTechServiceOrdersFault" location="../XSD/ServiceOrderFault.xsd" ::)

declare namespace ns1 = "http://www.tigo.com/TigoOnLine/ServiceOrderFault";
declare namespace ns0 = "http://www.tigo.com/Core/Common/Error/V1";
declare namespace xf = "http://tempuri.org/TigoOnline/GetTechServiceOrders/XQUERY/TransformException_DVM/";
declare namespace dvm = "http://xmlns.oracle.com/dvm";

declare function dvm:lookupValue($dvmTable as element(*), $sourceColumnName as xs:string,
    $sourceValue as xs:string, $targetColumnName as xs:string)
    as xs:string {    
    
       let $idxSource as xs:integer := for $n at $i in $dvmTable/dvm:columns/dvm:column where ($n/@name = $sourceColumnName) return $i
       let $idxTarget as xs:integer := for $n at $i in $dvmTable/dvm:columns/dvm:column where ($n/@name = $targetColumnName) return $i
       
       let $res1 := $dvmTable/dvm:rows/dvm:row/dvm:cell[position() = $idxSource and text()=$sourceValue]/../dvm:cell[position() = $idxTarget]/text()
       return
       
        string($res1)
       
};
declare function xf:EvaluateError($errorCod as xs:string,$dvmTable) as xs:string{
	
	   let $temp as xs:string :=dvm:lookupValue($dvmTable, 'ResponseCode', fn:string($errorCod),'ResponseCode')
	   let $val  := compare($errorCod,$temp)
	   let $errorDef as xs:string:='DES-999' 
  return if($val=0) then	
	  	   		 $errorCod
	   else 
			 $errorDef 
		
};

declare function xf:TransformException_DVM($CodeErrorOSB as xs:string,
    $dvmTable as element(*))
    as element(ns1:getTechServiceOrdersFault) {
        let $error := xf:EvaluateError($CodeErrorOSB ,$dvmTable)
        return
            <ns1:getTechServiceOrdersFault>
                <ns0:Error>
                    	<ns0:errorType>{ substring(dvm:lookupValue($dvmTable, 'ResponseCode', fn:string($error),'Message'), 1, 3) }</ns0:errorType>
           			 	<ns0:code>{  substring(dvm:lookupValue($dvmTable, 'ResponseCode', fn:string($error),'Message'), 5, 3) }</ns0:code>
            		 	<ns0:reason></ns0:reason>
            		 	<ns0:description>{ dvm:lookupValue($dvmTable, 'ResponseCode', fn:string($error),'MessageResponse') }</ns0:description>
                </ns0:Error>
            </ns1:getTechServiceOrdersFault>
};

declare variable $CodeErrorOSB as xs:string external;
declare variable $dvmTable as element(*) external;

xf:TransformException_DVM($CodeErrorOSB,
    $dvmTable)