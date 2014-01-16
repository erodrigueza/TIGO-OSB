(:: pragma bea:global-element-return element="ns0:AuditAdapterInput" location="../XSD/AuditRequest.xsd" ::)

declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/AuditAdapter";
declare namespace xf = "http://tempuri.org/TigoOnline/GetAccountSummary/XQUERY/TransformToAuditRequest/";

declare function xf:TransformToAuditRequest($indentificador as xs:string,
    $respuesta as xs:string)
    as element(ns0:AuditAdapterInput) {
        <ns0:AuditAdapterInput>
            <ns0:Identificador>{ $indentificador }</ns0:Identificador>
            <ns0:Respuesta>{ $respuesta }</ns0:Respuesta>
        </ns0:AuditAdapterInput>
};

declare variable $indentificador as xs:string external;
declare variable $respuesta as xs:string external;

xf:TransformToAuditRequest($indentificador,
    $respuesta)