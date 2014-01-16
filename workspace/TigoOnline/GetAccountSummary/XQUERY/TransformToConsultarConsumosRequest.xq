(:: pragma bea:global-element-return element="ns0:ConsultarConsumosRequest" location="../XSD/Consumos.xsd" ::)

declare namespace ns0 = "http://www.bytesw.com/ns/tigo/sac/consumos";
declare namespace xf = "http://tempuri.org/TigoOnline/GetAccountSummary/XQUERY/TransformToConsultarConsumosRequest/";

declare function xf:TransformToConsultarConsumosRequest($usuario1 as xs:string,
    $numeroTelefono1 as xs:string)
    as element(ns0:ConsultarConsumosRequest) {
        <ns0:ConsultarConsumosRequest>
            <usuario>{ $usuario1 }</usuario>
            <numeroTelefono>{ $numeroTelefono1 }</numeroTelefono>
        </ns0:ConsultarConsumosRequest>
};

declare variable $usuario1 as xs:string external;
declare variable $numeroTelefono1 as xs:string external;

xf:TransformToConsultarConsumosRequest($usuario1,
    $numeroTelefono1)