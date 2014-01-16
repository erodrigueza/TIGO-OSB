(:: pragma bea:global-element-parameter parameter="$getCardDataResponse" element="ns1:getCardDataResponse" location="../WSDL/BS_TIGOCRMOPERACIONES.wsdl" ::)
(:: pragma bea:global-element-return element="ns2:getCardStatusResponse" location="../XSD/GetLoyaltyInfoResponse.xsd" ::)

declare namespace ns2 = "http://xmlns.tigo.com/TigoAPI/GetLoyaltyInfoResponse/V1/schema";
declare namespace ns1 = "https://apps.beneficios.tigo.com.gt/WSTIGOCRMOPERACIONES/";
declare namespace ns0 = "http://xmlns.tigo.com/ParameterType/V2";
declare namespace xf = "http://tempuri.org/TigoOnline/GetLoyaltyInfo/XQUERY/TransformToGetCardStatusRs/";

declare function xf:yyyymmdd-to-date ( $dateString as xs:string? )  as xs:string? {
	if (fn:empty($dateString))
		then ()
	else if (fn:not(fn:matches($dateString, '^\D*(\d{4})\D*(\d{2})\D*(\d{2})\D*$')))
		then ''
	else fn:replace($dateString, '^\D*(\d{4})\D*(\d{2})\D*(\d{2})\D*$', '$1-$2-$3')
};

declare function xf:GetCardData($cardDataRes as element(ns1:getCardDataResponse),
    $position as xs:integer)
    as xs:string {
    	let $cardData as xs:string := xs:string(fn:data($cardDataRes/*:getCardDataResult/*:diffgram/*:NewDataSet/*:FirstTable/*:carddata))
    	let $seq := tokenize($cardData, '\|')
    	return if (xs:integer($position) <= fn:count($seq))
    	then
    		$seq[$position]
    	else
        	''
};

declare function xf:TransformToGetCardStatusRs($getCardDataResponse as element(ns1:getCardDataResponse))
    as element(ns2:getCardStatusResponse) {
        <ns2:getCardStatusResponse>
            <ns2:name>{ xf:GetCardData($getCardDataResponse, 6) }</ns2:name>
            <ns2:segment>{ xf:GetCardData($getCardDataResponse, 2) }</ns2:segment>
            <ns2:membershipDate>{ xf:yyyymmdd-to-date(xf:GetCardData($getCardDataResponse, 3)) }</ns2:membershipDate>
            <ns2:contract>{ xf:GetCardData($getCardDataResponse, 5) }</ns2:contract>
            <ns2:birthDate>{ xf:yyyymmdd-to-date(xf:GetCardData($getCardDataResponse, 7)) }</ns2:birthDate>
        </ns2:getCardStatusResponse>
};

declare variable $getCardDataResponse as element(ns1:getCardDataResponse) external;

xf:TransformToGetCardStatusRs($getCardDataResponse)