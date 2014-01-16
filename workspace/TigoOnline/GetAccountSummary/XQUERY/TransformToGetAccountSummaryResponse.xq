(:: pragma bea:local-element-parameter parameter="$requestHeader1" type="ns3:GetAccountSummaryRequest/ns0:RequestHeader" location="../XSD/AccountSummaryRequest.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$getAccountSummaryResponse1" element="ns2:getAccountSummaryResponse" location="../XSD/AccountSummaryResponse.xsd" ::)
(:: pragma bea:global-element-return element="ns2:GetAccountSummaryResponse" location="../XSD/AccountSummaryResponse.xsd" ::)

declare namespace ns2 = "http://www.tigo.com/TigoOnLine/AccountSummaryResponse";
declare namespace ns1 = "http://xmlns.tigo.com/ResponseHeader/V3";
declare namespace ns3 = "http://www.tigo.com/TigoOnLine/AccountSummaryRequest";
declare namespace ns0 = "http://xmlns.tigo.com/RequestHeader/V3";
declare namespace xf = "http://tempuri.org/TigoOnline/GetAccountSummary/XQUERY/TransformToGetAccountSummaryResponse/";

declare function xf:TransformToGetAccountSummaryResponse($requestHeader1 as element(),
    $getAccountSummaryResponse1 as element(ns2:getAccountSummaryResponse))
    as element(ns2:GetAccountSummaryResponse) {
        <ns2:GetAccountSummaryResponse>
            <ns1:ResponseHeader>
                <ns1:GeneralResponse>
                    <ns1:correlationID>{ data($requestHeader1/ns0:GeneralConsumerInformation/ns0:correlationID) }</ns1:correlationID>
                    <ns1:status>OK</ns1:status>
                    <ns1:code/>
                    <ns1:codeType/>
                    <ns1:description/>
                </ns1:GeneralResponse>
            </ns1:ResponseHeader>
            <ns2:RequestBody>
                <ns2:getAccountSummaryResponse>
                    {
                        for $basicFee in $getAccountSummaryResponse1/ns2:basicFee
                        return
                            <ns2:basicFee>{ data($basicFee) }</ns2:basicFee>
                    }
                    {
                        for $additionalAmount in $getAccountSummaryResponse1/ns2:additionalAmount
                        return
                            <ns2:additionalAmount>{ data($additionalAmount) }</ns2:additionalAmount>
                    }
                    {
                        for $totalAmount in $getAccountSummaryResponse1/ns2:totalAmount
                        return
                            <ns2:totalAmount>{ data($totalAmount) }</ns2:totalAmount>
                    }
                    {
                        for $gprsSummary in $getAccountSummaryResponse1/ns2:gprsSummary
                        return
                            <ns2:gprsSummary>
                                {
                                    for $totalAmount in $gprsSummary/ns2:totalAmount
                                    return
                                        <ns2:totalAmount>{ data($totalAmount) }</ns2:totalAmount>
                                }
                                {
                                    for $total in $gprsSummary/ns2:total
                                    return
                                        <ns2:total>{ data($total) }</ns2:total>
                                }
                                {
                                    for $includedTransfer in $gprsSummary/ns2:includedTransfer
                                    return
                                        <ns2:includedTransfer>
                                            {
                                                for $bytesUsed in $includedTransfer/ns2:bytesUsed
                                                return
                                                    <ns2:bytesUsed>{ data($bytesUsed) }</ns2:bytesUsed>
                                            }
                                            {
                                                for $gbUsed in $includedTransfer/ns2:gbUsed
                                                return
                                                    <ns2:gbUsed>{ data($gbUsed) }</ns2:gbUsed>
                                            }
                                            {
                                                for $kbUsed in $includedTransfer/ns2:kbUsed
                                                return
                                                    <ns2:kbUsed>{ data($kbUsed) }</ns2:kbUsed>
                                            }
                                            {
                                                for $mbUsed in $includedTransfer/ns2:mbUsed
                                                return
                                                    <ns2:mbUsed>{ data($mbUsed) }</ns2:mbUsed>
                                            }
                                            {
                                                for $tbUsed in $includedTransfer/ns2:tbUsed
                                                return
                                                    <ns2:tbUsed>{ data($tbUsed) }</ns2:tbUsed>
                                            }
                                            {
                                                for $amount in $includedTransfer/ns2:amount
                                                return
                                                    <ns2:amount>{ data($amount) }</ns2:amount>
                                            }
                                        </ns2:includedTransfer>
                                }
                                {
                                    for $additionalTransfer in $gprsSummary/ns2:additionalTransfer
                                    return
                                        <ns2:additionalTransfer>
                                            {
                                                for $bytesUsed in $additionalTransfer/ns2:bytesUsed
                                                return
                                                    <ns2:bytesUsed>{ data($bytesUsed) }</ns2:bytesUsed>
                                            }
                                            {
                                                for $gbUsed in $additionalTransfer/ns2:gbUsed
                                                return
                                                    <ns2:gbUsed>{ data($gbUsed) }</ns2:gbUsed>
                                            }
                                            {
                                                for $kbUsed in $additionalTransfer/ns2:kbUsed
                                                return
                                                    <ns2:kbUsed>{ data($kbUsed) }</ns2:kbUsed>
                                            }
                                            {
                                                for $mbUsed in $additionalTransfer/ns2:mbUsed
                                                return
                                                    <ns2:mbUsed>{ data($mbUsed) }</ns2:mbUsed>
                                            }
                                            {
                                                for $tbUsed in $additionalTransfer/ns2:tbUsed
                                                return
                                                    <ns2:tbUsed>{ data($tbUsed) }</ns2:tbUsed>
                                            }
                                            {
                                                for $amount in $additionalTransfer/ns2:amount
                                                return
                                                    <ns2:amount>{ data($amount) }</ns2:amount>
                                            }
                                        </ns2:additionalTransfer>
                                }
                            </ns2:gprsSummary>
                    }
                    {
                        for $mmsSummary in $getAccountSummaryResponse1/ns2:mmsSummary
                        return
                            <ns2:mmsSummary>
                                {
                                    for $quantity in $mmsSummary/ns2:quantity
                                    return
                                        <ns2:quantity>{ data($quantity) }</ns2:quantity>
                                }
                                {
                                    for $amount in $mmsSummary/ns2:amount
                                    return
                                        <ns2:amount>{ data($amount) }</ns2:amount>
                                }
                            </ns2:mmsSummary>
                    }
                    <ns2:smsSummary>
                        {
                            for $smsSummary in $getAccountSummaryResponse1/ns2:smsSummary
                            return
                                <ns2:smsReceived/>
                        }
                        {
                            for $additionalSms in $getAccountSummaryResponse1/ns2:smsSummary/ns2:additionalSms
                            return
                                <ns2:additionalSms>
                                    {
                                        for $quantity in $additionalSms/ns2:quantity
                                        return
                                            <ns2:quantity>{ data($quantity) }</ns2:quantity>
                                    }
                                    {
                                        for $amount in $additionalSms/ns2:amount
                                        return
                                            <ns2:amount>{ data($amount) }</ns2:amount>
                                    }
                                </ns2:additionalSms>
                        }
                        {
                            for $specificDestinies in $getAccountSummaryResponse1/ns2:smsSummary/ns2:specificDestinies
                            return
                                <ns2:specificDestinies>
                                    {
                                        for $quantity in $specificDestinies/ns2:quantity
                                        return
                                            <ns2:quantity>{ data($quantity) }</ns2:quantity>
                                    }
                                    {
                                        for $amount in $specificDestinies/ns2:amount
                                        return
                                            <ns2:amount>{ data($amount) }</ns2:amount>
                                    }
                                </ns2:specificDestinies>
                        }
                        {
                            for $includedSms in $getAccountSummaryResponse1/ns2:smsSummary/ns2:includedSms
                            return
                                <ns2:includedSms>
                                    {
                                        for $quantity in $includedSms/ns2:quantity
                                        return
                                            <ns2:quantity>{ data($quantity) }</ns2:quantity>
                                    }
                                    {
                                        for $amount in $includedSms/ns2:amount
                                        return
                                            <ns2:amount>{ data($amount) }</ns2:amount>
                                    }
                                </ns2:includedSms>
                        }
                        {
                            for $includedSmsUsed in $getAccountSummaryResponse1/ns2:smsSummary/ns2:includedSmsUsed
                            return
                                <ns2:includedSmsUsed>
                                    {
                                        for $quantity in $includedSmsUsed/ns2:quantity
                                        return
                                            <ns2:quantity>{ data($quantity) }</ns2:quantity>
                                    }
                                    {
                                        for $amount in $includedSmsUsed/ns2:amount
                                        return
                                            <ns2:amount>{ data($amount) }</ns2:amount>
                                    }
                                </ns2:includedSmsUsed>
                        }
                        {
                            for $totalAmount in $getAccountSummaryResponse1/ns2:smsSummary/ns2:totalAmount
                            return
                                <ns2:totalAmount>{ data($totalAmount) }</ns2:totalAmount>
                        }
                        {
                            for $totalSms in $getAccountSummaryResponse1/ns2:smsSummary/ns2:totalSms
                            return
                                <ns2:totalSms>{ data($totalSms) }</ns2:totalSms>
                        }
                    </ns2:smsSummary>
                    {
                        for $voiceSummary in $getAccountSummaryResponse1/ns2:voiceSummary
                        return
                            <ns2:voiceSummary>
                                {
                                    for $incomingCalls in $voiceSummary/ns2:incomingCalls
                                    return
                                        <ns2:incomingCalls>{ data($incomingCalls) }</ns2:incomingCalls>
                                }
                                {
                                    for $specialDestinies in $voiceSummary/ns2:specialDestinies
                                    return
                                        <ns2:specialDestinies>
                                            {
                                                for $minutes in $specialDestinies/ns2:minutes
                                                return
                                                    <ns2:minutes>{ data($minutes) }</ns2:minutes>
                                            }
                                            {
                                                for $seconds in $specialDestinies/ns2:seconds
                                                return
                                                    <ns2:seconds>{ data($seconds) }</ns2:seconds>
                                            }
                                            {
                                                for $amount in $specialDestinies/ns2:amount
                                                return
                                                    <ns2:amount>{ data($amount) }</ns2:amount>
                                            }
                                        </ns2:specialDestinies>
                                }
                                {
                                    for $longDistance in $voiceSummary/ns2:longDistance
                                    return
                                        <ns2:longDistance>
                                            {
                                                for $minutes in $longDistance/ns2:minutes
                                                return
                                                    <ns2:minutes>{ data($minutes) }</ns2:minutes>
                                            }
                                            {
                                                for $seconds in $longDistance/ns2:seconds
                                                return
                                                    <ns2:seconds>{ data($seconds) }</ns2:seconds>
                                            }
                                            {
                                                for $amount in $longDistance/ns2:amount
                                                return
                                                    <ns2:amount>{ data($amount) }</ns2:amount>
                                            }
                                        </ns2:longDistance>
                                }
                                {
                                    for $local in $voiceSummary/ns2:local
                                    return
                                        <ns2:local>
                                            {
                                                for $minutes in $local/ns2:minutes
                                                return
                                                    <ns2:minutes>{ data($minutes) }</ns2:minutes>
                                            }
                                            {
                                                for $seconds in $local/ns2:seconds
                                                return
                                                    <ns2:seconds>{ data($seconds) }</ns2:seconds>
                                            }
                                            {
                                                for $amount in $local/ns2:amount
                                                return
                                                    <ns2:amount>{ data($amount) }</ns2:amount>
                                            }
                                        </ns2:local>
                                }
                                {
                                    for $localIncluded in $voiceSummary/ns2:localIncluded
                                    return
                                        <ns2:localIncluded>
                                            {
                                                for $minutes in $localIncluded/ns2:minutes
                                                return
                                                    <ns2:minutes>{ data($minutes) }</ns2:minutes>
                                            }
                                            {
                                                for $seconds in $localIncluded/ns2:seconds
                                                return
                                                    <ns2:seconds>{ data($seconds) }</ns2:seconds>
                                            }
                                            {
                                                for $amount in $localIncluded/ns2:amount
                                                return
                                                    <ns2:amount>{ data($amount) }</ns2:amount>
                                            }
                                        </ns2:localIncluded>
                                }
                                {
                                    for $incomingCallsSummary in $voiceSummary/ns2:incomingCallsSummary
                                    return
                                        <ns2:incomingCallsSummary>
                                            {
                                                for $minutes in $incomingCallsSummary/ns2:minutes
                                                return
                                                    <ns2:minutes>{ data($minutes) }</ns2:minutes>
                                            }
                                            {
                                                for $seconds in $incomingCallsSummary/ns2:seconds
                                                return
                                                    <ns2:seconds>{ data($seconds) }</ns2:seconds>
                                            }
                                            {
                                                for $amount in $incomingCallsSummary/ns2:amount
                                                return
                                                    <ns2:amount>{ data($amount) }</ns2:amount>
                                            }
                                        </ns2:incomingCallsSummary>
                                }
                                {
                                    for $totalAmount in $voiceSummary/ns2:totalAmount
                                    return
                                        <ns2:totalAmount>{ data($totalAmount) }</ns2:totalAmount>
                                }
                                {
                                    for $totalTime in $voiceSummary/ns2:totalTime
                                    return
                                        <ns2:totalTime>
                                            {
                                                for $minutes in $totalTime/ns2:minutes
                                                return
                                                    <ns2:minutes>{ data($minutes) }</ns2:minutes>
                                            }
                                            {
                                                for $seconds in $totalTime/ns2:seconds
                                                return
                                                    <ns2:seconds>{ data($seconds) }</ns2:seconds>
                                            }
                                        </ns2:totalTime>
                                }
                            </ns2:voiceSummary>
                    }
                    {
                        for $roamingGprsSummary in $getAccountSummaryResponse1/ns2:roamingGprsSummary
                        return
                            <ns2:roamingGprsSummary>
                                {
                                    for $bytesUsed in $roamingGprsSummary/ns2:bytesUsed
                                    return
                                        <ns2:bytesUsed>{ data($bytesUsed) }</ns2:bytesUsed>
                                }
                                {
                                    for $gbUsed in $roamingGprsSummary/ns2:gbUsed
                                    return
                                        <ns2:gbUsed>{ data($gbUsed) }</ns2:gbUsed>
                                }
                                {
                                    for $kbUsed in $roamingGprsSummary/ns2:kbUsed
                                    return
                                        <ns2:kbUsed>{ data($kbUsed) }</ns2:kbUsed>
                                }
                                {
                                    for $mbUsed in $roamingGprsSummary/ns2:mbUsed
                                    return
                                        <ns2:mbUsed>{ data($mbUsed) }</ns2:mbUsed>
                                }
                                {
                                    for $tbUsed in $roamingGprsSummary/ns2:tbUsed
                                    return
                                        <ns2:tbUsed>{ data($tbUsed) }</ns2:tbUsed>
                                }
                                {
                                    for $amount in $roamingGprsSummary/ns2:amount
                                    return
                                        <ns2:amount>{ data($amount) }</ns2:amount>
                                }
                            </ns2:roamingGprsSummary>
                    }
                    {
                        for $roamingMmsSummary in $getAccountSummaryResponse1/ns2:roamingMmsSummary
                        return
                            <ns2:roamingMmsSummary>
                                {
                                    for $amount in $roamingMmsSummary/ns2:amount
                                    return
                                        <ns2:amount>{ data($amount) }</ns2:amount>
                                }
                                {
                                    for $incomingRoaming in $roamingMmsSummary/ns2:incomingRoaming
                                    return
                                        <ns2:incomingRoaming>
                                            {
                                                for $quantity in $incomingRoaming/ns2:quantity
                                                return
                                                    <ns2:quantity>{ data($quantity) }</ns2:quantity>
                                            }
                                            {
                                                for $amount in $incomingRoaming/ns2:amount
                                                return
                                                    <ns2:amount>{ data($amount) }</ns2:amount>
                                            }
                                        </ns2:incomingRoaming>
                                }
                                {
                                    for $outgoingRoaming in $roamingMmsSummary/ns2:outgoingRoaming
                                    return
                                        <ns2:outgoingRoaming>
                                            {
                                                for $quantity in $outgoingRoaming/ns2:quantity
                                                return
                                                    <ns2:quantity>{ data($quantity) }</ns2:quantity>
                                            }
                                            {
                                                for $amount in $outgoingRoaming/ns2:amount
                                                return
                                                    <ns2:amount>{ data($amount) }</ns2:amount>
                                            }
                                        </ns2:outgoingRoaming>
                                }
                                {
                                    for $total in $roamingMmsSummary/ns2:total
                                    return
                                        <ns2:total>{ data($total) }</ns2:total>
                                }
                            </ns2:roamingMmsSummary>
                    }
                    <ns2:roamingSmsSummary>
                        {
                            for $amount in $getAccountSummaryResponse1/ns2:roamingSmsSummary/ns2:amount
                            return
                                <ns2:amount>{ data($amount) }</ns2:amount>
                        }
                        {
                            for $incomingRoaming in $getAccountSummaryResponse1/ns2:roamingSmsSummary/ns2:incomingRoaming
                            return
                                <ns2:incomingRoaming>
                                    {
                                        for $quantity in $incomingRoaming/ns2:quantity
                                        return
                                            <ns2:quantity>{ data($quantity) }</ns2:quantity>
                                    }
                                    {
                                        for $amount in $incomingRoaming/ns2:amount
                                        return
                                            <ns2:amount>{ data($amount) }</ns2:amount>
                                    }
                                </ns2:incomingRoaming>
                        }
                        {
                            for $outgoingRoaming in $getAccountSummaryResponse1/ns2:roamingSmsSummary/ns2:outgoingRoaming
                            return
                                <ns2:outgoingRoaming>
                                    {
                                        for $quantity in $outgoingRoaming/ns2:quantity
                                        return
                                            <ns2:quantity>{ data($quantity) }</ns2:quantity>
                                    }
                                    {
                                        for $amount in $outgoingRoaming/ns2:amount
                                        return
                                            <ns2:amount>{ data($amount) }</ns2:amount>
                                    }
                                </ns2:outgoingRoaming>
                        }
                        {
                            for $total in $getAccountSummaryResponse1/ns2:roamingSmsSummary/ns2:total
                            return
                                <ns2:total>{ data($total) }</ns2:total>
                        }
                    </ns2:roamingSmsSummary>
                    <ns2:roamingVoiceSummary>
                        {
                            for $amount in $getAccountSummaryResponse1/ns2:roamingVoiceSummary/ns2:amount
                            return
                                <ns2:amount>{ data($amount) }</ns2:amount>
                        }
                        {
                            for $incomingRoaming in $getAccountSummaryResponse1/ns2:roamingVoiceSummary/ns2:incomingRoaming
                            return
                                <ns2:incomingRoaming>
                                    {
                                        for $duration in $incomingRoaming/ns2:duration
                                        return
                                            <ns2:duration>
                                                {
                                                    for $minutes in $duration/ns2:minutes
                                                    return
                                                        <ns2:minutes>{ data($minutes) }</ns2:minutes>
                                                }
                                                {
                                                    for $seconds in $duration/ns2:seconds
                                                    return
                                                        <ns2:seconds>{ data($seconds) }</ns2:seconds>
                                                }
                                            </ns2:duration>
                                    }
                                    {
                                        for $amount in $incomingRoaming/ns2:amount
                                        return
                                            <ns2:amount>{ data($amount) }</ns2:amount>
                                    }
                                </ns2:incomingRoaming>
                        }
                        {
                            for $outgoingRoaming in $getAccountSummaryResponse1/ns2:roamingVoiceSummary/ns2:outgoingRoaming
                            return
                                <ns2:outgoingRoaming>
                                    {
                                        for $duration in $outgoingRoaming/ns2:duration
                                        return
                                            <ns2:duration>
                                                {
                                                    for $minutes in $duration/ns2:minutes
                                                    return
                                                        <ns2:minutes>{ data($minutes) }</ns2:minutes>
                                                }
                                                {
                                                    for $seconds in $duration/ns2:seconds
                                                    return
                                                        <ns2:seconds>{ data($seconds) }</ns2:seconds>
                                                }
                                            </ns2:duration>
                                    }
                                    {
                                        for $amount in $outgoingRoaming/ns2:amount
                                        return
                                            <ns2:amount>{ data($amount) }</ns2:amount>
                                    }
                                </ns2:outgoingRoaming>
                        }
                        {
                            for $total in $getAccountSummaryResponse1/ns2:roamingVoiceSummary/ns2:total
                            return
                                <ns2:total>{ $total/@* , $total/node() }</ns2:total>
                        }
                    </ns2:roamingVoiceSummary>
                </ns2:getAccountSummaryResponse>
            </ns2:RequestBody>
        </ns2:GetAccountSummaryResponse>
};

declare variable $requestHeader1 as element() external;
declare variable $getAccountSummaryResponse1 as element(ns2:getAccountSummaryResponse) external;

xf:TransformToGetAccountSummaryResponse($requestHeader1,
    $getAccountSummaryResponse1)