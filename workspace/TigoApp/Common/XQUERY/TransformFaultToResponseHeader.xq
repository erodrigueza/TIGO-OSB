(:: pragma  parameter="$fault" type="anyType" ::)
(:: pragma bea:global-element-return element="ns0:ResponseHeader" location="../XSD/ResponseHeaderV3.xsd" ::)

declare namespace ns0 = "http://xmlns.tigo.com/ResponseHeader/V3";
declare namespace xf = "http://tempuri.org/TigoOnline/RequestCreditLimitModification/XQUERY/TransformFaultToResponseHeader/";

declare function xf:TransformFaultToResponseHeader($fault as element(*))
    as element(ns0:ResponseHeader) {
        <ns0:ResponseHeader>
            <ns0:GeneralResponse>
                <ns0:status>ERROR</ns0:status>
                <ns0:code>{ data($fault/*:errorCode) }</ns0:code>
                <ns0:codeType>Generic OSB</ns0:codeType>
                <ns0:description>{ data($fault/*:reason) }</ns0:description>
            </ns0:GeneralResponse>
        </ns0:ResponseHeader>
};

declare variable $fault as element(*) external;

xf:TransformFaultToResponseHeader($fault)