(:: pragma  parameter="$accesosInput" type="anyType" ::)
(:: pragma bea:global-element-return element="ns0:ValidarAccesoAtencionClienteRequest" location="../XSD/Accesos.xsd" ::)

declare namespace ns0 = "http://www.bytesw.com/ns/tigo/sac/accesos";
declare namespace xf = "http://tempuri.org/TigoOnline/RequestCreditLimitModification/XQUERY/TransformToAccesosRequest/";
declare namespace ac = "http://www.tigo.com/TigoOnLine/AccesosValues";

declare function xf:TransformToAccesosRequest($accesosInput as element(*))
    as element(ns0:ValidarAccesoAtencionClienteRequest) {
        <ns0:ValidarAccesoAtencionClienteRequest>
        	<usuario>{ data($accesosInput/ac:usuario) }</usuario>
            <clave>{ data($accesosInput/ac:clave) }</clave>
        </ns0:ValidarAccesoAtencionClienteRequest>
};

declare variable $accesosInput as element(*) external;

xf:TransformToAccesosRequest($accesosInput)