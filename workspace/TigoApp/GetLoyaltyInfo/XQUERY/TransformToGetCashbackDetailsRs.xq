(:: pragma bea:global-element-parameter parameter="$getCardBalanceSheetResponse" element="ns1:getCardBalanceSheetResponse" location="../WSDL/BS_TIGOCRMOPERACIONES.wsdl" ::)
(:: pragma bea:global-element-return element="ns2:getCashbackDetailsResponse" location="../XSD/GetLoyaltyInfoResponse.xsd" ::)

declare namespace ns2 = "http://xmlns.tigo.com/TigoAPI/GetLoyaltyInfoResponse/V1/schema";
declare namespace ns1 = "https://apps.beneficios.tigo.com.gt/WSTIGOCRMOPERACIONES/";
declare namespace ns0 = "http://xmlns.tigo.com/ParameterType/V2";
declare namespace xf = "http://tempuri.org/TigoOnline/GetLoyaltyInfo/XQUERY/TransformToGetCashbackDetailsRs/";

declare function xf:GetData($data as xs:string, $position as xs:integer)
    as xs:string {
    	let $seq := tokenize($data, ',')
    	return if (xs:integer($position) <= fn:count($seq))
    	then
    		$seq[$position]
    	else
        	''
};

declare function xf:TransformToGetCashbackDetailsRs($getCardBalanceSheetResponse as element(ns1:getCardBalanceSheetResponse))
    as element(ns2:getCashbackDetailsResponse) {
        <ns2:getCashbackDetailsResponse>
        {   let $cardData as xs:string := xs:string(fn:data($getCardBalanceSheetResponse/*:getCardBalanceSheetResult/*:diffgram/*:NewDataSet/*:FirstTable/*:cardbalancesheet))
    		let $seq := tokenize($cardData, '\|')
    	
        	for $benefit in $seq
        	return if (fn:string-length(fn:data($benefit)) > 0)
        	then
        	<ns2:CashbackDetails>
            	<ns2:date>{ xf:GetData($benefit, 1) }</ns2:date>
            	<ns2:transaction>{ xf:GetData($benefit, 2) }</ns2:transaction>
            	<ns2:amount>{ xf:GetData($benefit, 3) }</ns2:amount>
            	<ns2:balance>{ xf:GetData($benefit, 5) }</ns2:balance>
            	<ns2:reference>{ xf:GetData($benefit, 4) }</ns2:reference>
            </ns2:CashbackDetails>
            else ''
        }    
        </ns2:getCashbackDetailsResponse>
};

declare variable $getCardBalanceSheetResponse as element(ns1:getCardBalanceSheetResponse) external;

xf:TransformToGetCashbackDetailsRs($getCardBalanceSheetResponse)