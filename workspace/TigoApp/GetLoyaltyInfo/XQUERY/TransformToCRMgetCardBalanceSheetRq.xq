(:: pragma  parameter="$config" type="anyType" ::)
(:: pragma bea:global-element-return element="ns0:getCardBalanceSheet" location="../WSDL/BS_TIGOCRMOPERACIONES.wsdl" ::)

declare namespace ns0 = "https://apps.beneficios.tigo.com.gt/WSTIGOCRMOPERACIONES/";
declare namespace xf = "http://tempuri.org/TigoOnline/GetLoyaltyInfo/XQUERY/TransformToCRMgetCardBalanceSheetRq/";
declare namespace cfg = "http://www.tigo.com/TigoOnLine/GetLoyaltyInfo/ConfigFile";

declare function xf:TransformToCRMgetCardBalanceSheetRq($config as element(*),
    $msisdn as xs:string)
    as element(ns0:getCardBalanceSheet) {
        <ns0:getCardBalanceSheet>
            <ns0:cardnumber>{ $msisdn }</ns0:cardnumber>
            <ns0:requestsource>{ data($config/cfg:source) }</ns0:requestsource>
            <ns0:key>{ data($config/cfg:key) }</ns0:key>
        </ns0:getCardBalanceSheet>
};

declare variable $config as element(*) external;
declare variable $msisdn as xs:string external;

xf:TransformToCRMgetCardBalanceSheetRq($config,
    $msisdn)