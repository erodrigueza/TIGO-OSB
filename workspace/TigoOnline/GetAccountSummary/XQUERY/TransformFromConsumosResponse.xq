(:: pragma bea:global-element-parameter parameter="$consultarConsumosResponse1" element="ns0:ConsultarConsumosResponse" location="../XSD/Consumos.xsd" ::)
(:: pragma bea:global-element-return element="ns1:getAccountSummaryResponse" location="../XSD/AccountSummaryResponse.xsd" ::)

declare namespace ns1 = "http://www.tigo.com/TigoOnLine/AccountSummaryResponse";
declare namespace ns0 = "http://www.bytesw.com/ns/tigo/sac/consumos";
declare namespace xf = "http://tempuri.org/TigoOnline/GetAccountSummary/XQUERY/TransformFromConsumosResponse/";

declare function xf:TransformFromConsumosResponse($consultarConsumosResponse1 as element(ns0:ConsultarConsumosResponse))
    as element(ns1:getAccountSummaryResponse) {
        <ns1:getAccountSummaryResponse>
            <ns1:basicFee>{ data($consultarConsumosResponse1/DetalleConsumo/cuotaBasica) }</ns1:basicFee>
            <ns1:additionalAmount>{ data($consultarConsumosResponse1/DetalleConsumo/montoAdicional) }</ns1:additionalAmount>
            <ns1:totalAmount>{ data($consultarConsumosResponse1/DetalleConsumo/totalConsumo) }</ns1:totalAmount>
            {
                for $resumenConsumoGPRS in $consultarConsumosResponse1/DetalleConsumo/resumenConsumoGPRS
                return
                    <ns1:gprsSummary>
                        <ns1:totalAmount>{ data($resumenConsumoGPRS/montoTotal) }</ns1:totalAmount>
                        <ns1:total>{ data($resumenConsumoGPRS/total) }</ns1:total>
                        {
                            for $transferenciaPlan in $resumenConsumoGPRS/transferenciaPlan
                            return
                                <ns1:includedTransfer>
                                    <ns1:bytesUsed>{ data($transferenciaPlan/bytes) }</ns1:bytesUsed>
                                    <ns1:gbUsed>{ data($transferenciaPlan/GB) }</ns1:gbUsed>
                                    <ns1:kbUsed>{ data($transferenciaPlan/KB) }</ns1:kbUsed>
                                    <ns1:mbUsed>{ data($transferenciaPlan/MB) }</ns1:mbUsed>
                                    <ns1:tbUsed>{ data($transferenciaPlan/TB) }</ns1:tbUsed>
                                    <ns1:amount>{ data($transferenciaPlan/monto) }</ns1:amount>
                                </ns1:includedTransfer>
                        }
                        {
                            for $transferenciaAdicional in $resumenConsumoGPRS/transferenciaAdicional
                            return
                                <ns1:additionalTransfer>
                                    <ns1:bytesUsed>{ data($transferenciaAdicional/bytes) }</ns1:bytesUsed>
                                    <ns1:gbUsed>{ data($transferenciaAdicional/GB) }</ns1:gbUsed>
                                    <ns1:kbUsed>{ data($transferenciaAdicional/KB) }</ns1:kbUsed>
                                    <ns1:mbUsed>{ data($transferenciaAdicional/MB) }</ns1:mbUsed>
                                    <ns1:tbUsed>{ data($transferenciaAdicional/TB) }</ns1:tbUsed>
                                    <ns1:amount>{ data($transferenciaAdicional/monto) }</ns1:amount>
                                </ns1:additionalTransfer>
                        }
                    </ns1:gprsSummary>
            }
            {
                for $resumenConsumoMMS in $consultarConsumosResponse1/DetalleConsumo/resumenConsumoMMS
                return
                    <ns1:mmsSummary>
                        <ns1:quantity>{ data($resumenConsumoMMS/cantidadMMS) }</ns1:quantity>
                        <ns1:amount>{ data($resumenConsumoMMS/montoTotal) }</ns1:amount>
                    </ns1:mmsSummary>
            }
            {
                for $resumenConsumoSMS in $consultarConsumosResponse1/DetalleConsumo/resumenConsumoSMS
                return
                    <ns1:smsSummary>
                        <ns1:smsReceived>{ data($resumenConsumoSMS/cantidadMensajesRecibidos) }</ns1:smsReceived>
                        {
                            for $mensajesAdicionales in $resumenConsumoSMS/mensajesAdicionales
                            return
                                <ns1:additionalSms>
                                    <ns1:quantity>{ data($mensajesAdicionales/cantidad) }</ns1:quantity>
                                    <ns1:amount>{ data($mensajesAdicionales/monto) }</ns1:amount>
                                </ns1:additionalSms>
                        }
                        {
                            for $mensajesDestinosEspecificos in $resumenConsumoSMS/mensajesDestinosEspecificos
                            return
                                <ns1:specificDestinies>
                                    <ns1:quantity>{ data($mensajesDestinosEspecificos/cantidad) }</ns1:quantity>
                                    <ns1:amount>{ data($mensajesDestinosEspecificos/monto) }</ns1:amount>
                                </ns1:specificDestinies>
                        }
                        {
                            for $mensajesPlan in $resumenConsumoSMS/mensajesPlan
                            return
                                <ns1:includedSms>
                                    <ns1:quantity>{ data($mensajesPlan/cantidad) }</ns1:quantity>
                                    <ns1:amount>{ data($mensajesPlan/monto) }</ns1:amount>
                                </ns1:includedSms>
                        }
                        {
                            for $mensajesUtilizadosPlan in $resumenConsumoSMS/mensajesUtilizadosPlan
                            return
                                <ns1:includedSmsUsed>
                                    <ns1:quantity>{ data($mensajesUtilizadosPlan/cantidad) }</ns1:quantity>
                                    <ns1:amount>{ data($mensajesUtilizadosPlan/monto) }</ns1:amount>
                                </ns1:includedSmsUsed>
                        }
                        <ns1:totalAmount>{ data($resumenConsumoSMS/montoTotalMensajes) }</ns1:totalAmount>
                        <ns1:totalSms>{ data($resumenConsumoSMS/cantidadTotalMensajes) }</ns1:totalSms>
                    </ns1:smsSummary>
            }
            {
                for $resumenConsumoVoz in $consultarConsumosResponse1/DetalleConsumo/resumenConsumoVoz
                return
                    <ns1:voiceSummary>
                        <ns1:incomingCalls>{ data($resumenConsumoVoz/cantidadLlamadasEntrantes) }</ns1:incomingCalls>
                        {
                            for $llamadasDestinosEspeciales in $resumenConsumoVoz/llamadasDestinosEspeciales
                            return
                                <ns1:specialDestinies>
                                    <ns1:minutes>{ data($llamadasDestinosEspeciales/duracion/minutos) }</ns1:minutes>
                                    <ns1:seconds>{ data($llamadasDestinosEspeciales/duracion/segundos) }</ns1:seconds>
                                    <ns1:amount>{ data($llamadasDestinosEspeciales/monto) }</ns1:amount>
                                </ns1:specialDestinies>
                        }
                        <ns1:longDistance>
                            <ns1:minutes>{ data($resumenConsumoVoz/llamadasLargaDistancia/duracion/minutos) }</ns1:minutes>
                            <ns1:seconds>{ data($resumenConsumoVoz/llamadasLargaDistancia/duracion/segundos) }</ns1:seconds>
                            <ns1:amount>{ data($resumenConsumoVoz/llamadasLargaDistancia/monto) }</ns1:amount>
                        </ns1:longDistance>
                        <ns1:local>
                            <ns1:minutes>{ data($resumenConsumoVoz/llamadasLocalesAdicionales/duracion/minutos) }</ns1:minutes>
                            <ns1:seconds>{ data($resumenConsumoVoz/llamadasLocalesAdicionales/duracion/segundos) }</ns1:seconds>
                            <ns1:amount>{ data($resumenConsumoVoz/llamadasLocalesAdicionales/monto) }</ns1:amount>
                        </ns1:local>
                        {
                            for $llamadasLocalesPlan in $resumenConsumoVoz/llamadasLocalesPlan
                            return
                                <ns1:localIncluded>
                                    <ns1:minutes>{ data($llamadasLocalesPlan/duracion/minutos) }</ns1:minutes>
                                    <ns1:seconds>{ data($llamadasLocalesPlan/duracion/segundos) }</ns1:seconds>
                                    <ns1:amount>{ data($llamadasLocalesPlan/monto) }</ns1:amount>
                                </ns1:localIncluded>
                        }
                        {
                            for $llamadasRecibidas in $resumenConsumoVoz/llamadasRecibidas
                            return
                                <ns1:incomingCallsSummary>
                                    <ns1:minutes>{ data($llamadasRecibidas/duracion/minutos) }</ns1:minutes>
                                    <ns1:seconds>{ data($llamadasRecibidas/duracion/segundos) }</ns1:seconds>
                                    <ns1:amount>{ data($llamadasRecibidas/monto) }</ns1:amount>
                                </ns1:incomingCallsSummary>
                        }
                        <ns1:totalAmount>{ data($resumenConsumoVoz/montoTotal) }</ns1:totalAmount>
                        {
                            for $total in $resumenConsumoVoz/total
                            return
                                <ns1:totalTime>
                                    <ns1:minutes>{ data($total/minutos) }</ns1:minutes>
                                    <ns1:seconds>{ data($total/segundos) }</ns1:seconds>
                                </ns1:totalTime>
                        }
                    </ns1:voiceSummary>
            }
            {
                for $resumenRoamingGPRS in $consultarConsumosResponse1/DetalleConsumo/resumenRoamingGPRS
                return
                    <ns1:roamingGprsSummary>
                        <ns1:bytesUsed>{ data($resumenRoamingGPRS/bytes) }</ns1:bytesUsed>
                        <ns1:gbUsed>{ data($resumenRoamingGPRS/GB) }</ns1:gbUsed>
                        <ns1:kbUsed>{ data($resumenRoamingGPRS/KB) }</ns1:kbUsed>
                        <ns1:mbUsed>{ data($resumenRoamingGPRS/MB) }</ns1:mbUsed>
                        <ns1:tbUsed>{ data($resumenRoamingGPRS/TB) }</ns1:tbUsed>
                        <ns1:amount>{ data($resumenRoamingGPRS/monto) }</ns1:amount>
                    </ns1:roamingGprsSummary>
            }
            {
                for $resumenRoamingMMS in $consultarConsumosResponse1/DetalleConsumo/resumenRoamingMMS
                return
                    <ns1:roamingMmsSummary>
                        <ns1:amount>{ data($resumenRoamingMMS/montoTotal) }</ns1:amount>
                        <ns1:incomingRoaming>
                            <ns1:quantity>{ data($resumenRoamingMMS/roamingEntrante/cantidad) }</ns1:quantity>
                            <ns1:amount>{ data($resumenRoamingMMS/roamingEntrante/monto) }</ns1:amount>
                        </ns1:incomingRoaming>
                        {
                            for $roamingSaliente in $resumenRoamingMMS/roamingSaliente
                            return
                                <ns1:outgoingRoaming>
                                    <ns1:quantity>{ data($roamingSaliente/cantidad) }</ns1:quantity>
                                    <ns1:amount>{ data($roamingSaliente/monto) }</ns1:amount>
                                </ns1:outgoingRoaming>
                        }
                        <ns1:total>{ data($resumenRoamingMMS/total) }</ns1:total>
                    </ns1:roamingMmsSummary>
            }
            {
                for $resumenRoamingSMS in $consultarConsumosResponse1/DetalleConsumo/resumenRoamingSMS
                return
                    <ns1:roamingSmsSummary>
                        <ns1:amount>{ data($resumenRoamingSMS/montoTotal) }</ns1:amount>
                        {
                            for $roamingEntrante in $resumenRoamingSMS/roamingEntrante
                            return
                                <ns1:incomingRoaming>
                                    <ns1:quantity>{ data($roamingEntrante/cantidad) }</ns1:quantity>
                                    <ns1:amount>{ data($roamingEntrante/monto) }</ns1:amount>
                                </ns1:incomingRoaming>
                        }
                        {
                            for $roamingSaliente in $resumenRoamingSMS/roamingSaliente
                            return
                                <ns1:outgoingRoaming>
                                    <ns1:quantity>{ data($roamingSaliente/cantidad) }</ns1:quantity>
                                    <ns1:amount>{ data($roamingSaliente/monto) }</ns1:amount>
                                </ns1:outgoingRoaming>
                        }
                        <ns1:total>{ data($resumenRoamingSMS/total) }</ns1:total>
                    </ns1:roamingSmsSummary>
            }
            {
                for $resumenRoamingVoz in $consultarConsumosResponse1/DetalleConsumo/resumenRoamingVoz
                return
                    <ns1:roamingVoiceSummary>
                        <ns1:amount>{ data($resumenRoamingVoz/montoTotal) }</ns1:amount>
                        {
                            for $roamingEntrante in $resumenRoamingVoz/roamingEntrante
                            return
                                <ns1:incomingRoaming>
                                    {
                                        for $duracion in $roamingEntrante/duracion
                                        return
                                            <ns1:duration>
                                                <ns1:minutes>{ data($duracion/minutos) }</ns1:minutes>
                                                <ns1:seconds>{ data($duracion/segundos) }</ns1:seconds>
                                            </ns1:duration>
                                    }
                                    <ns1:amount>{ data($roamingEntrante/monto) }</ns1:amount>
                                </ns1:incomingRoaming>
                        }
                        {
                            for $roamingSaliente in $resumenRoamingVoz/roamingSaliente
                            return
                                <ns1:outgoingRoaming>
                                    {
                                        for $duracion in $roamingSaliente/duracion
                                        return
                                            <ns1:duration>
                                                <ns1:minutes>{ data($duracion/minutos) }</ns1:minutes>
                                                <ns1:seconds>{ data($duracion/segundos) }</ns1:seconds>
                                            </ns1:duration>
                                    }
                                    <ns1:amount>{ data($roamingSaliente/monto) }</ns1:amount>
                                </ns1:outgoingRoaming>
                        }
                        {
                            for $total in $resumenRoamingVoz/total
                            return
                                <ns1:total>
                                    <ns1:minutes>{ data($total/minutos) }</ns1:minutes>
                                    <ns1:seconds>{ data($total/segundos) }</ns1:seconds>
                                </ns1:total>
                        }
                    </ns1:roamingVoiceSummary>
            }
        </ns1:getAccountSummaryResponse>
};

declare variable $consultarConsumosResponse1 as element(ns0:ConsultarConsumosResponse) external;

xf:TransformFromConsumosResponse($consultarConsumosResponse1)