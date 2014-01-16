(:: pragma  parameter="$config" type="anyType" ::)
(:: pragma bea:global-element-return element="ns0:getSubscriber" location="../XSD/DeezerService.xsd" ::)

declare namespace ns0 = "http://service.business.deezerapi.millicom.com/";
declare namespace xf = "http://tempuri.org/TigoOnline/GetDeezerAvailability/XQUERY/TransformToDeezerServiceRequest/";
declare namespace cfg = "http://www.tigo.com/TigoOnLine/GetDeezerAvailability/ConfigFile";

declare function xf:TransformToDeezerServiceRequest($msisdn as xs:string,
    $config as element(*))
    as element(ns0:getSubscriber) {
        <ns0:getSubscriber>
            <operatorId>{ data($config/cfg:operatorId) }</operatorId>
            <msisdnSubscriber>{ $msisdn }</msisdnSubscriber>
        </ns0:getSubscriber>
};

declare variable $msisdn as xs:string external;
declare variable $config as element(*) external;

xf:TransformToDeezerServiceRequest($msisdn,
    $config)