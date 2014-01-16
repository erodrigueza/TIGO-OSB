(:: pragma bea:global-element-return element="ns0:ValidarAccesoAtencionClienteRequest" location="../../Common/XSD/Accesos.xsd" ::)

declare namespace ns0 = "http://www.bytesw.com/ns/tigo/sac/accesos";
declare namespace xf = "http://tempuri.org/TigoOnline/GetAccountSummary/XQUERY/TransformToAccesoRequest/";

declare function xf:TransformToAccesoRequest($usuario1 as xs:string,
    $clave1 as xs:string)
    as element(ns0:ValidarAccesoAtencionClienteRequest) {
        <ns0:ValidarAccesoAtencionClienteRequest>
            <usuario>{ $usuario1 }</usuario>
            <clave>{ $clave1 }</clave>
        </ns0:ValidarAccesoAtencionClienteRequest>
};

declare variable $usuario1 as xs:string external;
declare variable $clave1 as xs:string external;

xf:TransformToAccesoRequest($usuario1,
    $clave1)