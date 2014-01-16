(:: pragma bea:local-element-parameter parameter="$requestHeader1" type="ns4:GetAccountSummaryRequest/ns1:RequestHeader" location="../XSD/AccountSummaryRequest.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$getAccountSummaryFault1" element="ns3:getAccountSummaryFault" location="../XSD/AccountSummaryFault.xsd" ::)
(:: pragma bea:global-element-return element="ns3:GetAccountSummaryFault" location="../XSD/AccountSummaryFault.xsd" ::)

declare namespace ns2 = "http://xmlns.tigo.com/ResponseHeader/V3";
declare namespace ns1 = "http://xmlns.tigo.com/RequestHeader/V3";
declare namespace ns4 = "http://www.tigo.com/TigoOnLine/AccountSummaryRequest";
declare namespace ns3 = "http://www.tigo.com/TigoOnLine/AccountSummaryFault";
declare namespace ns0 = "http://www.tigo.com/Core/Common/Error/V1";
declare namespace xf = "http://tempuri.org/TigoOnline/GetAccountSummary/XQUERY/TransformToGetAccountSummaryFaultResponse/";

declare function xf:TransformToGetAccountSummaryFaultResponse($requestHeader1 as element(),
    $getAccountSummaryFault1 as element(ns3:getAccountSummaryFault))
    as element(ns3:GetAccountSummaryFault) {
        <ns3:GetAccountSummaryFault>
            <ns2:ResponseHeader>
                <ns2:GeneralResponse>
                    <ns2:correlationID>{ data($requestHeader1/ns1:GeneralConsumerInformation/ns1:correlationID) }</ns2:correlationID>
                    <ns2:status>ERROR</ns2:status>
                    <ns2:code>{ data($getAccountSummaryFault1/ns0:Error/ns0:code) }</ns2:code>
                    <ns2:codeType>{ data($getAccountSummaryFault1/ns0:Error/ns0:errorType) }</ns2:codeType>
                    <ns2:description>{ data($getAccountSummaryFault1/ns0:Error/ns0:description) }</ns2:description>
                </ns2:GeneralResponse>
            </ns2:ResponseHeader>
            <ns3:RequestBody>
                <ns3:getAccountSummaryFault>
                    <ns0:Error>
                        <ns0:errorType>{ data($getAccountSummaryFault1/ns0:Error/ns0:errorType) }</ns0:errorType>
                        <ns0:code>{ data($getAccountSummaryFault1/ns0:Error/ns0:code) }</ns0:code>
                        <ns0:reason>{ data($getAccountSummaryFault1/ns0:Error/ns0:reason) }</ns0:reason>
                        <ns0:description>{ data($getAccountSummaryFault1/ns0:Error/ns0:description) }</ns0:description>
                    </ns0:Error>
                </ns3:getAccountSummaryFault>
            </ns3:RequestBody>
        </ns3:GetAccountSummaryFault>
};

declare variable $requestHeader1 as element() external;
declare variable $getAccountSummaryFault1 as element(ns3:getAccountSummaryFault) external;

xf:TransformToGetAccountSummaryFaultResponse($requestHeader1,
    $getAccountSummaryFault1)