(:: pragma bea:global-element-parameter parameter="$requestHeader" element="ns0:RequestHeader" location="../XSD/RequestHeaderV3.xsd" ::)
(:: pragma bea:global-element-return element="ns1:ResponseHeader" location="../XSD/ResponseHeaderV3.xsd" ::)

declare namespace ns1 = "http://xmlns.tigo.com/ResponseHeader/V3";
declare namespace ns0 = "http://xmlns.tigo.com/RequestHeader/V3";
declare namespace xf = "http://tempuri.org/TigoOnline/RequestCreditLimitModification/XQUERY/TransformToCreditLimitHeaderResponse/";

declare function xf:TransformToCreditLimitHeaderResponse($requestHeader as element(ns0:RequestHeader))
    as element(ns1:ResponseHeader) {
        <ns1:ResponseHeader>
            <ns1:GeneralResponse>
                <ns1:correlationID>{ data($requestHeader/ns0:GeneralConsumerInformation/ns0:correlationID) }</ns1:correlationID>
                <ns1:status>OK</ns1:status>
            </ns1:GeneralResponse>
        </ns1:ResponseHeader>
};

declare variable $requestHeader as element(ns0:RequestHeader) external;

xf:TransformToCreditLimitHeaderResponse($requestHeader)