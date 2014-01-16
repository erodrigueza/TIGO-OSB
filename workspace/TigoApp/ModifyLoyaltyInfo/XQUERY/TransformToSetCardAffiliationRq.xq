(:: pragma  parameter="$config" type="anyType" ::)
(:: pragma bea:global-element-parameter parameter="$modifyLoyaltyInfoRequest" element="ns2:modifyLoyaltyInfoRequest" location="../XSD/ModifyLoyaltyInfoRequest.xsd" ::)
(:: pragma bea:global-element-return element="ns1:setCardAffiliation" location="../WSDL/BS_TIGOCRMOPERACIONES.wsdl" ::)

declare namespace ns2 = "http://xmlns.tigo.com/TigoAPI/ModifyLoyaltyInfoRequest/V1/schema";
declare namespace ns1 = "https://apps.beneficios.tigo.com.gt/WSTIGOCRMOPERACIONES/";
declare namespace ns0 = "http://xmlns.tigo.com/ParameterType/V2";
declare namespace xf = "http://tempuri.org/TigoOnline/ModifyLoyaltyInfo/XQUERY/TransformToSetCardAffiliationRq/";
declare namespace cfg = "http://www.tigo.com/TigoOnLine/ModifyLoyaltyInfo/ConfigFile";

declare function xf:TransformToSetCardAffiliationRq($config as element(*),
    $modifyLoyaltyInfoRequest as element(ns2:modifyLoyaltyInfoRequest))
    as element(ns1:setCardAffiliation) {
        <ns1:setCardAffiliation>
            <ns1:cardnumber>{ fn:replace($modifyLoyaltyInfoRequest/ns2:msisdn, '\d{3}', '') }</ns1:cardnumber>
            <ns1:cardname>{ data($modifyLoyaltyInfoRequest/ns2:name) }</ns1:cardname>
            <ns1:cardlastname>{ data($modifyLoyaltyInfoRequest/ns2:lastname) }</ns1:cardlastname>
            <ns1:cardbirthday>{ xs:string($modifyLoyaltyInfoRequest/ns2:birthday) }</ns1:cardbirthday>
            {
                for $gender in $modifyLoyaltyInfoRequest/ns2:gender
                return
                    <ns1:cardgender>{ data($gender) }</ns1:cardgender>
            }
            <ns1:cardemail>{ data($modifyLoyaltyInfoRequest/ns2:email) }</ns1:cardemail>
            {
                for $additionalPhone in $modifyLoyaltyInfoRequest/ns2:additionalPhone
                return
                    <ns1:cardphone>{ data($additionalPhone) }</ns1:cardphone>
            }
            {
                for $additionalInfo in $modifyLoyaltyInfoRequest/ns2:additionalInfo
                return
                    <ns1:cardfields>{ data($additionalInfo) }</ns1:cardfields>
            }
            <ns1:requestsource>{ data($config/cfg:source) }</ns1:requestsource>
            <ns1:key>{ data($config/cfg:key) }</ns1:key>
        </ns1:setCardAffiliation>
};

declare variable $config as element(*) external;
declare variable $modifyLoyaltyInfoRequest as element(ns2:modifyLoyaltyInfoRequest) external;

xf:TransformToSetCardAffiliationRq($config,
    $modifyLoyaltyInfoRequest)