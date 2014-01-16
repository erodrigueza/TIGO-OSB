(:: pragma bea:global-element-parameter parameter="$requestCreditLimitModificationRequest" element="ns1:RequestCreditLimitModificationRequest" location="../XSD/RequestCreditLimitModificationRequest.xsd" ::)
(:: pragma bea:global-element-return element="ns0:CambiarLimiteCreditoRequest" location="../XSD/AdministracionAbonado.xsd" ::)

declare namespace ns2 = "http://xmlns.tigo.com/ParameterType/V2";
declare namespace ns1 = "http://xmlns.tigo.com/TigoBussines/RequestCreditLimitModificationRequest/V1/schema";
declare namespace ns0 = "http://www.bytesw.com/ns/tigo/sac/admin_abonado";
declare namespace xf = "http://tempuri.org/TigoOnline/RequestCreditLimitModification/XQUERY/TransformToAdminAbonadoRequest/";

declare function xf:TransformToAdminAbonadoRequest($requestCreditLimitModificationRequest as element(ns1:RequestCreditLimitModificationRequest),
    $userAutenticado as xs:string)
    as element(ns0:CambiarLimiteCreditoRequest) {
        <ns0:CambiarLimiteCreditoRequest>
            <usuario>{ $userAutenticado }</usuario>
            <DetalleCambioLimiteCredito>
                <numeroTelefonico>{ replace($requestCreditLimitModificationRequest/ns1:requestBody/ns1:msisdn, '\d{3}', '') }</numeroTelefonico>
                <tipoCambioLimite>TEMPORAL</tipoCambioLimite>
                <limiteCredito>{ xs:double(data($requestCreditLimitModificationRequest/ns1:requestBody/ns1:amount)) }</limiteCredito>
                <diasVigencia>{ data($requestCreditLimitModificationRequest/ns1:requestBody/ns1:days) }</diasVigencia>
            </DetalleCambioLimiteCredito>
        </ns0:CambiarLimiteCreditoRequest>
};

declare variable $requestCreditLimitModificationRequest as element(ns1:RequestCreditLimitModificationRequest) external;
declare variable $userAutenticado as xs:string external;

xf:TransformToAdminAbonadoRequest($requestCreditLimitModificationRequest,
    $userAutenticado)
