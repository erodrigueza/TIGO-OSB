(:: pragma bea:global-element-return element="ns0:ConsultarOrdenServicioTecnicoRequest" location="../XSD/Incidencias.xsd" ::)

declare namespace ns0 = "http://www.bytesw.com/ns/tigo/sac/incidencias";
declare namespace xf = "http://tempuri.org/TigoOnline/GetTechServiceOrders/XQUERY/TransformToIncidenciasRequest/";

declare function xf:TransformToIncidenciasRequest($token as xs:string,
    $number as xs:string)
    as element(ns0:ConsultarOrdenServicioTecnicoRequest) {
        <ns0:ConsultarOrdenServicioTecnicoRequest>
            <usuario>{ $token }</usuario>
            <numeroTelefono>{ $number }</numeroTelefono>
        </ns0:ConsultarOrdenServicioTecnicoRequest>
};

declare variable $token as xs:string external;
declare variable $number as xs:string external;

xf:TransformToIncidenciasRequest($token,
    $number)