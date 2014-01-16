(:: pragma bea:global-element-return element="ns0:ErrorAdapterInput" location="../../Common/XSD/ErrorRequest.xsd" ::)

declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ErrorAdapter";
declare namespace xf = "http://tempuri.org/TigoOnline/GetAccountSummary/XQUERY/TransformToErrorRequest/";

declare function xf:TransformToErrorRequest($tipoAlarma as xs:string,
    $mensajeError as xs:string,
    $accion as xs:string)
    as element(ns0:ErrorAdapterInput) {
        <ns0:ErrorAdapterInput>
            <ns0:TipoAlarma>{ $tipoAlarma }</ns0:TipoAlarma>
            <ns0:MensajeError>{ $mensajeError }</ns0:MensajeError>
            <ns0:Accion>{ $accion }</ns0:Accion>
        </ns0:ErrorAdapterInput>
};

declare variable $tipoAlarma as xs:string external;
declare variable $mensajeError as xs:string external;
declare variable $accion as xs:string external;

xf:TransformToErrorRequest($tipoAlarma,
    $mensajeError,
    $accion)