CREATE VIEW vw_callcenter_porcentage_filas AS
SELECT sum(vw_callcenter_consolidado.total_chamadas) AS total_chamadas,
    sum(vw_callcenter_consolidado.abandono) AS abandono,
    sum(vw_callcenter_consolidado.atendido) AS atendido,
    ((((sum(vw_callcenter_consolidado.abandono) * (100)::numeric) / sum(vw_callcenter_consolidado.total_chamadas)))::numeric(10,2) || '%'::text) AS porc_abd,
    ((((sum(vw_callcenter_consolidado.atendido) * (100)::numeric) / sum(vw_callcenter_consolidado.total_chamadas)))::numeric(10,2) || '%'::text) AS porc_atd,
    ((vw_callcenter_consolidado.dt_call_system_data)::date) as dt_call,
    vw_callcenter_consolidado.cc_queue as fila
 FROM vw_callcenter_consolidado
group by vw_callcenter_consolidado.dt_call_system_data, vw_callcenter_consolidado.cc_queue
order by dt_call;
