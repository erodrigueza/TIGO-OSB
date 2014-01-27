(:: pragma bea:global-element-parameter parameter="$getCardDataResponse" element="ns1:getCardDataResponse" location="../WSDL/BS_TIGOCRMOPERACIONES.wsdl" ::)
(:: pragma bea:global-element-return element="ns2:getBenefitsResponse" location="../XSD/GetLoyaltyInfoResponse.xsd" ::)

declare namespace ns2 = "http://xmlns.tigo.com/TigoAPI/GetLoyaltyInfoResponse/V1/schema";
declare namespace ns1 = "https://apps.beneficios.tigo.com.gt/WSTIGOCRMOPERACIONES/";
declare namespace ns0 = "http://xmlns.tigo.com/ParameterType/V2";
declare namespace xf = "http://tempuri.org/TigoOnline/GetLoyaltyInfo/XQUERY/TransformToGetBenefitsRs/";

declare function xf:yyyymmdd-to-date ( $dateString as xs:string? )  as xs:string? {
	if (fn:empty($dateString))
		then ()
	else if (fn:not(fn:matches($dateString, '^\D*(\d{4})\D*(\d{2})\D*(\d{2})\D*$')))
		then ''
	else fn:replace($dateString, '^\D*(\d{4})\D*(\d{2})\D*(\d{2})\D*$', '$1-$2-$3')
};
 
declare function xf:GetData($data as xs:string, $position as xs:integer)
    as xs:string {
    	let $seq := tokenize($data, ',')
    	return if (xs:integer($position) <= fn:count($seq))
    	then
    		$seq[$position]
    	else
        	''
};

declare function xf:TransformToGetBenefitsRs($getCardDataResponse as element(ns1:getCardDataResponse))
    as element(ns2:getBenefitsResponse) {
        <ns2:getBenefitsResponse>
        {   let $cardData as xs:string := xs:string(fn:data($getCardDataResponse/*:getCardDataResult/*:diffgram/*:NewDataSet/*:FirstTable/*:carddata))
    		let $seq := tokenize($cardData, '\|')
    	
        	for $benefit in $seq
        	return if (fn:string-length(fn:data($benefit)) > 0)
        	then
        	<ns2:Benefits>
				<ns2:prize>{ xf:GetData($benefit, 2) }</ns2:prize>
				<ns2:benefit>{ xf:GetData($benefit, 3) }</ns2:benefit>
				<ns2:date>{ xf:yyyymmdd-to-date(xf:GetData($benefit, 4)) }</ns2:date>
				<ns2:expireDate>{ xf:yyyymmdd-to-date(xf:GetData($benefit, 5)) }</ns2:expireDate>
			</ns2:Benefits>
			else ''
        }
        </ns2:getBenefitsResponse>
};

declare variable $getCardDataResponse as element(ns1:getCardDataResponse) external;

xf:TransformToGetBenefitsRs($getCardDataResponse)