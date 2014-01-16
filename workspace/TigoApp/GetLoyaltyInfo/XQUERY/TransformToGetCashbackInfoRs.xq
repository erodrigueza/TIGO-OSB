(:: pragma bea:global-element-parameter parameter="$getCardBalanceResponse" element="ns1:getCardBalanceResponse" location="../WSDL/BS_TIGOCRMOPERACIONES.wsdl" ::)
(:: pragma bea:global-element-return element="ns2:getCashbackInfoResponse" location="../XSD/GetLoyaltyInfoResponse.xsd" ::)

declare namespace ns2 = "http://xmlns.tigo.com/TigoAPI/GetLoyaltyInfoResponse/V1/schema";
declare namespace ns1 = "https://apps.beneficios.tigo.com.gt/WSTIGOCRMOPERACIONES/";
declare namespace ns0 = "http://xmlns.tigo.com/ParameterType/V2";
declare namespace xf = "http://tempuri.org/TigoOnline/GetLoyaltyInfo/XQUERY/TransformToGetCashbackInfoRs/";

declare function xf:GetCardData($cardDataRes as element(ns1:getCardBalanceResponse),
    $position as xs:integer)
    as xs:string {
    	let $cardData as xs:string := xs:string(fn:data($cardDataRes/*:getCardBalanceResult/*:diffgram/*:NewDataSet/*:FirstTable/*:cardbalancedetail))
    	let $seq := tokenize($cardData, '\|')
    	return if (xs:integer($position) <= fn:count($seq))
    	then
    		$seq[$position]
    	else
        	''
};

declare function xf:TransformToGetCashbackInfoRs($getCardBalanceResponse as element(ns1:getCardBalanceResponse))
    as element(ns2:getCashbackInfoResponse) {
        <ns2:getCashbackInfoResponse>
            <ns2:availableBalance>{ fn:data($getCardBalanceResponse/*:getCardBalanceResult/*:diffgram/*:NewDataSet/*:FirstTable/*:cardbalance) }</ns2:availableBalance>
            <ns2:usedBalance>{ xf:GetCardData($getCardBalanceResponse, 4) }</ns2:usedBalance>
            <ns2:accumulatedBalance>{ xf:GetCardData($getCardBalanceResponse, 3) }</ns2:accumulatedBalance>
            <ns2:expiredBalance>{ xf:GetCardData($getCardBalanceResponse, 5) }</ns2:expiredBalance>
            <ns2:nextToExpireBalance1>{ xf:GetCardData($getCardBalanceResponse, 6) }</ns2:nextToExpireBalance1>
            <ns2:expireDate1>{ xf:GetCardData($getCardBalanceResponse, 7) }</ns2:expireDate1>
            <ns2:nextToExpireBalance2>{ xf:GetCardData($getCardBalanceResponse, 8) }</ns2:nextToExpireBalance2>
            <ns2:expireDate2>{ xf:GetCardData($getCardBalanceResponse, 9) }</ns2:expireDate2>
            <ns2:lastMonthBalance>{ xf:GetCardData($getCardBalanceResponse, 1) }</ns2:lastMonthBalance>
            <ns2:lastMonth>{ xf:GetCardData($getCardBalanceResponse, 2) }</ns2:lastMonth>
            <ns2:cutoffDate>{ xf:GetCardData($getCardBalanceResponse, 10) }</ns2:cutoffDate>
        </ns2:getCashbackInfoResponse>
};

declare variable $getCardBalanceResponse as element(ns1:getCardBalanceResponse) external;

xf:TransformToGetCashbackInfoRs($getCardBalanceResponse)