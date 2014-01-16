(:: pragma bea:global-element-parameter parameter="$setCardAffiliationResponse" element="ns1:setCardAffiliationResponse" location="../WSDL/BS_TIGOCRMOPERACIONES.wsdl" ::)
(:: pragma bea:global-element-return element="ns2:modifyLoyaltyInfoResponse" location="../XSD/ModifyLoyaltyInfoResponse.xsd" ::)

declare namespace ns2 = "http://xmlns.tigo.com/TigoAPI/ModifyLoyaltyInfoResponse/V1/schema";
declare namespace ns1 = "https://apps.beneficios.tigo.com.gt/WSTIGOCRMOPERACIONES/";
declare namespace ns0 = "http://xmlns.tigo.com/ParameterType/V2";
declare namespace xf = "http://tempuri.org/TigoOnline/ModifyLoyaltyInfo/XQUERY/TransformToModifyLoyaltyInfoRs/";

declare function xf:TransformToModifyLoyaltyInfoRs($setCardAffiliationResponse as element(ns1:setCardAffiliationResponse))
    as element(ns2:modifyLoyaltyInfoResponse) {
        <ns2:modifyLoyaltyInfoResponse>
            <ns2:success>true</ns2:success>
        </ns2:modifyLoyaltyInfoResponse>
};

declare variable $setCardAffiliationResponse as element(ns1:setCardAffiliationResponse) external;

xf:TransformToModifyLoyaltyInfoRs($setCardAffiliationResponse)