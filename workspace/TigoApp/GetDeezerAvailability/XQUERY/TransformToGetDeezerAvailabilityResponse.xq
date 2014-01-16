(:: pragma bea:global-element-parameter parameter="$getSubscriberResponse" element="ns1:getSubscriberResponse" location="../XSD/DeezerService.xsd" ::)
(:: pragma  parameter="$config" type="anyType" ::)
(:: pragma bea:global-element-return element="ns2:getDeezerAvailabilityResponse" location="../XSD/GetDeezerAvailabilityResponse.xsd" ::)

declare namespace ns2 = "http://xmlns.tigo.com/TigoAPI/GetDeezerAvailabilityResponse/V1/schema";
declare namespace ns1 = "http://service.business.deezerapi.millicom.com/";
declare namespace ns0 = "http://xmlns.tigo.com/ParameterType/V2";
declare namespace xf = "http://tempuri.org/TigoOnline/GetDeezerAvailability/XQUERY/TransformToGetDeezerAvailabilityResponse/";
declare namespace cfg = "http://www.tigo.com/TigoOnLine/GetDeezerAvailability/ConfigFile";

declare function xf:TransformToGetDeezerAvailabilityResponse($getSubscriberResponse as element(ns1:getSubscriberResponse),
    $config as element(*))
    as element(ns2:getDeezerAvailabilityResponse) {
        <ns2:getDeezerAvailabilityResponse>
            <ns2:deezerStatus>{ 
            		if (data($getSubscriberResponse/return/code) = 1 and data($config/cfg:activeCode) = data($getSubscriberResponse/return/subscriber/active)) 
            		then 
            			data($config/cfg:activeResponse)
            		else
            			data($config/cfg:inactiveResponse)
            }</ns2:deezerStatus>
            <ns2:packageId>{ data($getSubscriberResponse/return/subscriber/offerCode) }</ns2:packageId>
        </ns2:getDeezerAvailabilityResponse>
};

declare variable $getSubscriberResponse as element(ns1:getSubscriberResponse) external;
declare variable $config as element(*) external;

xf:TransformToGetDeezerAvailabilityResponse($getSubscriberResponse,
    $config)