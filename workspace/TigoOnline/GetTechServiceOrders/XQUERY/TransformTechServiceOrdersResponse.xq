(:: pragma bea:local-element-parameter parameter="$requestHeader1" type="ns3:GetTechServiceOrdersRequest/ns0:RequestHeader" location="../XSD/ServiceOrderRequest.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$getTechServiceOrdersResponse1" element="ns2:getTechServiceOrdersResponse" location="../XSD/ServiceOrderResponse.xsd" ::)
(:: pragma bea:global-element-return element="ns2:GetTechServiceOrdersResponse" location="../XSD/ServiceOrderResponse.xsd" ::)

declare namespace ns2 = "http://www.tigo.com/TigoOnLine/ServiceOrderResponse";
declare namespace ns1 = "http://xmlns.tigo.com/ResponseHeader/V3";
declare namespace ns3 = "http://www.tigo.com/TigoOnLine/ServiceOrderRequest";
declare namespace ns0 = "http://xmlns.tigo.com/RequestHeader/V3";
declare namespace xf = "http://tempuri.org/TigoOnline/GetTechServiceOrders/XQUERY/TransformTechServiceOrdersResponse/";

declare function xf:TransformTechServiceOrdersResponse($requestHeader1 as element(),
    $getTechServiceOrdersResponse1 as element(ns2:getTechServiceOrdersResponse))
    as element(ns2:GetTechServiceOrdersResponse) {
        <ns2:GetTechServiceOrdersResponse>
            <ns1:ResponseHeader>
                <ns1:GeneralResponse>
                    <ns1:correlationID>{ data($requestHeader1/ns0:GeneralConsumerInformation/ns0:correlationID) }</ns1:correlationID>
                    <ns1:status>OK</ns1:status>
                    <ns1:code/>
                    <ns1:codeType/>
                    <ns1:description/>
                </ns1:GeneralResponse>
            </ns1:ResponseHeader>
            <ns2:ResponseBody>
                <ns2:getTechServiceOrdersResponse>
                    {
                        for $orderList in $getTechServiceOrdersResponse1/ns2:orderList
                        return
                            <ns2:orderList>
                                <ns2:orderDate>{ data($orderList/ns2:orderDate) }</ns2:orderDate>
                                <ns2:orderStatus>{ data($orderList/ns2:orderStatus) }</ns2:orderStatus>
                                <ns2:orderProblem>{ data($orderList/ns2:orderProblem) }</ns2:orderProblem>
                                <ns2:orderBranch>{ data($orderList/ns2:orderBranch) }</ns2:orderBranch>
                                <ns2:orderSolution>{ data($orderList/ns2:orderSolution) }</ns2:orderSolution>
                                <ns2:orderTechnician>{ data($orderList/ns2:orderTechnician) }</ns2:orderTechnician>
                                <ns2:orderReceivedBy>{ data($orderList/ns2:orderReceivedBy) }</ns2:orderReceivedBy>
                                <ns2:orderCost>{ data($orderList/ns2:orderCost) }</ns2:orderCost>
                            </ns2:orderList>
                    }
                </ns2:getTechServiceOrdersResponse>
            </ns2:ResponseBody>
        </ns2:GetTechServiceOrdersResponse>
};

declare variable $requestHeader1 as element() external;
declare variable $getTechServiceOrdersResponse1 as element(ns2:getTechServiceOrdersResponse) external;

xf:TransformTechServiceOrdersResponse($requestHeader1,
    $getTechServiceOrdersResponse1)