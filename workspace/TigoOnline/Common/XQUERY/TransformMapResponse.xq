(:: pragma bea:global-element-parameter parameter="$responseData" element="ns1:ResponseData" location="../XSD/MapResponse.xsd" ::)
(:: pragma bea:global-element-return element="ns0:ResponseHeader" location="../XSD/ResponseHeaderV3.xsd" ::)

declare namespace ns1 = "http://www.tigo.com.gt/MapResponseStructure";
declare namespace ns0 = "http://xmlns.tigo.com/ResponseHeader/V3";
declare namespace xf = "http://tempuri.org/TigoOnline/RequestCreditLimitModification/XQUERY/TransformMapResponse/";

declare function xf:TransformMapResponse($responseData as element(ns1:ResponseData))
    as element(ns0:ResponseHeader) {
        <ns0:ResponseHeader>
            <ns0:GeneralResponse>
                <ns0:status>ERROR</ns0:status>
                <ns0:code>{ fn:substring(data($responseData/ns1:CodeResponse), 5) }</ns0:code>
                <ns0:codeType>{ fn:substring(data($responseData/ns1:CodeResponse), 1, 3) }</ns0:codeType>
                <ns0:description>{ data($responseData/ns1:MessageResponse) }</ns0:description>
            </ns0:GeneralResponse>
        </ns0:ResponseHeader>
};

declare variable $responseData as element(ns1:ResponseData) external;

xf:TransformMapResponse($responseData)