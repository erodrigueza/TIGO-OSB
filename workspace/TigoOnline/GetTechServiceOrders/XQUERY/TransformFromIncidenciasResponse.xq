(:: pragma bea:global-element-parameter parameter="$consultarOrdenServicioTecnicoResponse1" element="ns1:ConsultarOrdenServicioTecnicoResponse" location="../XSD/Incidencias.xsd" ::)
(:: pragma bea:global-element-return element="ns0:getTechServiceOrdersResponse" location="../XSD/ServiceOrderResponse.xsd" ::)

declare namespace ns1 = "http://www.bytesw.com/ns/tigo/sac/incidencias";
declare namespace ns0 = "http://www.tigo.com/TigoOnLine/ServiceOrderResponse";
declare namespace xf = "http://tempuri.org/TigoOnline/GetTechServiceOrders/XQUERY/TransformFromIncidenciasResponse/";

declare function xf:TransformFromIncidenciasResponse($consultarOrdenServicioTecnicoResponse1 as element(ns1:ConsultarOrdenServicioTecnicoResponse))
    as element(ns0:getTechServiceOrdersResponse) {
        <ns0:getTechServiceOrdersResponse>
            {
                for $OrdenServicioTecnico in $consultarOrdenServicioTecnicoResponse1/OrdenServicioTecnico
                return
                    <ns0:orderList>
                        <ns0:orderDate>{ concat(string($OrdenServicioTecnico/dia),'-',string($OrdenServicioTecnico/mes),'-',string($OrdenServicioTecnico/anio)) }</ns0:orderDate>
                        <ns0:orderStatus>{ data($OrdenServicioTecnico/estado) }</ns0:orderStatus>
                        <ns0:orderProblem>{ data($OrdenServicioTecnico/problemaIdentificado) }</ns0:orderProblem>
                        <ns0:orderBranch>{ data($OrdenServicioTecnico/nombreAgencia) }</ns0:orderBranch>
                        <ns0:orderSolution>{ data($OrdenServicioTecnico/solucionReparacion) }</ns0:orderSolution>
                        <ns0:orderTechnician>{ data($OrdenServicioTecnico/tecnicoActual) }</ns0:orderTechnician>
                        <ns0:orderReceivedBy>{ data($OrdenServicioTecnico/tecnicoRecepcion) }</ns0:orderReceivedBy>
                        <ns0:orderCost>{ data($OrdenServicioTecnico/valorReparacion) }</ns0:orderCost>
                    </ns0:orderList>
            }
        </ns0:getTechServiceOrdersResponse>
};

declare variable $consultarOrdenServicioTecnicoResponse1 as element(ns1:ConsultarOrdenServicioTecnicoResponse) external;

xf:TransformFromIncidenciasResponse($consultarOrdenServicioTecnicoResponse1)