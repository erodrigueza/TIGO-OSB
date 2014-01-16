(:: pragma bea:global-element-parameter parameter="$inicioResponse" element="ns1:InicioResponse" location="../WSDL/BS_CUS_Aumento_de_Limite_de_Credito_Tigo_Online.wsdl" ::)
(:: pragma bea:global-element-return element="ns2:RequestCreditLimitModificationResponse" location="../XSD/RequestCreditLimitModificationResponse.xsd" ::)

declare namespace ns2 = "http://xmlns.tigo.com/TigoBussines/RequestCreditLimitModificationResponse/V1/schema";
declare namespace ns1 = "http://DefaultNamespace";
declare namespace ns0 = "http://xmlns.tigo.com/ParameterType/V2";
declare namespace xf = "http://tempuri.org/TigoOnline/RequestCreditLimitModification/XQUERY/TransformToCreditLimitResponse/";

declare function xf:TransformToCreditLimitResponse($resultOper as xs:boolean,
    $inicioResponse as element(ns1:InicioResponse))
    as element(ns2:RequestCreditLimitModificationResponse) {
        <ns2:RequestCreditLimitModificationResponse>
            <ns2:responseBody>
                <ns2:success>{ $resultOper }</ns2:success>
                <ns2:additionalResults>
                {
                	for $ticketId in $inicioResponse/ns1:InicioReturn
                	return 
                    <ns0:ParameterType>
                        <ns0:parameterName>ticketid</ns0:parameterName>
                        <ns0:parameterValue>{ data($ticketId) }</ns0:parameterValue>
                    </ns0:ParameterType>
                }
                </ns2:additionalResults>
            </ns2:responseBody>
        </ns2:RequestCreditLimitModificationResponse>
};

declare variable $resultOper as xs:boolean external;
declare variable $inicioResponse as element(ns1:InicioResponse) external;

xf:TransformToCreditLimitResponse($resultOper,
    $inicioResponse)
