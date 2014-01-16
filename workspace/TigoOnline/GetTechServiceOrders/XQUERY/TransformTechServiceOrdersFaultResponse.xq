(:: pragma bea:global-element-parameter parameter="$getTechServiceOrdersFault1" element="ns4:getTechServiceOrdersFault" location="../XSD/ServiceOrderFault.xsd" ::)
(:: pragma bea:local-element-parameter parameter="$requestHeader1" type="ns3:GetTechServiceOrdersRequest/ns1:RequestHeader" location="../XSD/ServiceOrderRequest.xsd" ::)
(:: pragma bea:global-element-return element="ns4:GetTechServiceOrdersFault" location="../XSD/ServiceOrderFault.xsd" ::)

declare namespace ns2 = "http://xmlns.tigo.com/ResponseHeader/V3";
declare namespace ns1 = "http://xmlns.tigo.com/RequestHeader/V3";
declare namespace ns4 = "http://www.tigo.com/TigoOnLine/ServiceOrderFault";
declare namespace ns3 = "http://www.tigo.com/TigoOnLine/ServiceOrderRequest";
declare namespace ns0 = "http://www.tigo.com/Core/Common/Error/V1";
declare namespace xf = "http://tempuri.org/TigoOnline/GetTechServiceOrders/XQUERY/TransformTechServiceOrdersFaultResponse/";

declare function xf:TransformTechServiceOrdersFaultResponse($getTechServiceOrdersFault1 as element(ns4:getTechServiceOrdersFault),
    $requestHeader1 as element())
    as element(ns4:GetTechServiceOrdersFault) {
        <ns4:GetTechServiceOrdersFault>
            <ns2:ResponseHeader>
                <ns2:GeneralResponse>
                    <ns2:correlationID>{ data($requestHeader1/ns1:GeneralConsumerInformation/ns1:correlationID) }</ns2:correlationID>
                    <ns2:status>ERROR</ns2:status>
                    <ns2:code>{ data($getTechServiceOrdersFault1/ns0:Error/ns0:code) }</ns2:code>
                    <ns2:codeType>{ data($getTechServiceOrdersFault1/ns0:Error/ns0:errorType) }</ns2:codeType>
                    <ns2:description>{ data($getTechServiceOrdersFault1/ns0:Error/ns0:description) }</ns2:description>
                </ns2:GeneralResponse>
            </ns2:ResponseHeader>
            <ns4:RequestBody>
                <ns4:getTechServiceOrdersFault>
                    <ns0:Error>
                        <ns0:errorType>{ data($getTechServiceOrdersFault1/ns0:Error/ns0:errorType) }</ns0:errorType>
                        <ns0:code>{ data($getTechServiceOrdersFault1/ns0:Error/ns0:code) }</ns0:code>
                        <ns0:reason>{ data($getTechServiceOrdersFault1/ns0:Error/ns0:reason) }</ns0:reason>
                        <ns0:description>{ data($getTechServiceOrdersFault1/ns0:Error/ns0:description) }</ns0:description>
                    </ns0:Error>
                </ns4:getTechServiceOrdersFault>
            </ns4:RequestBody>
        </ns4:GetTechServiceOrdersFault>
};

declare variable $getTechServiceOrdersFault1 as element(ns4:getTechServiceOrdersFault) external;
declare variable $requestHeader1 as element() external;

xf:TransformTechServiceOrdersFaultResponse($getTechServiceOrdersFault1,
    $requestHeader1)