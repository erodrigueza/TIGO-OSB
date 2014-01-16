(:: pragma  parameter="$config" type="anyType" ::)
(:: pragma bea:global-element-parameter parameter="$setCardLoginResponse" element="ns0:setCardLoginResponse" location="../WSDL/BS_TIGOCRMOPERACIONES.wsdl" ::)
(:: pragma bea:global-element-return element="ns0:getCardData" location="../WSDL/BS_TIGOCRMOPERACIONES.wsdl" ::)

declare namespace ns0 = "https://apps.beneficios.tigo.com.gt/WSTIGOCRMOPERACIONES/";
declare namespace xf = "http://tempuri.org/TigoOnline/GetLoyaltyInfo/XQUERY/TransformToCRMgetCardDataRq/";
declare namespace cfg = "http://www.tigo.com/TigoOnLine/GetLoyaltyInfo/ConfigFile";

declare function xf:TransformToCRMgetCardDataRq($config as element(*),
    $setCardLoginResponse as element(ns0:setCardLoginResponse), $dataType as xs:string)
    as element(ns0:getCardData) {
        <ns0:getCardData>
            <ns0:cardnumber>{ data($setCardLoginResponse/ns0:setCardLoginResult/*:diffgram/NewDataSet/FirstTable/cardnumber) }</ns0:cardnumber>
            <ns0:datatype>{ $dataType }</ns0:datatype>
            <ns0:requestsource>{ data($config/cfg:source) }</ns0:requestsource>
            <ns0:transactionid>{ data($setCardLoginResponse/ns0:setCardLoginResult/*:diffgram/NewDataSet/FirstTable/transactionid) }</ns0:transactionid>
            <ns0:key>{ data($config/cfg:key) }</ns0:key>
        </ns0:getCardData>
};

declare variable $config as element(*) external;
declare variable $setCardLoginResponse as element(ns0:setCardLoginResponse) external;
declare variable $dataType as xs:string external;

xf:TransformToCRMgetCardDataRq($config,
    $setCardLoginResponse, $dataType)