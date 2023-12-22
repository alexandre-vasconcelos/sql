select a.id Tickets,
 CASE
    WHEN a.status = 1 THEN "Novo"
    WHEN a.status = 2 THEN "Em atendimento"
    WHEN a.status = 3 THEN "Planejado"
    WHEN a.status = 4 THEN "Esperando"
    WHEN a.status = 5 THEN "Resolvido"
    WHEN a.status = 6 THEN "Fechado"
END as Status, 
 CASE
    WHEN a.type = 1 THEN "Incidente"
    WHEN a.type = 2 THEN "Requisição"
END as Type,
a.name Assunto, c.name Empresa, d.name Categoria, d.completename CategoriaCompleta, b.firstname Analista, a.closedate DataFechado, a.date Data, a.solvedate DataSolucionado, a.date_creation DataCriado

from glpi_tickets a 
inner join glpi_users b on a.users_id_lastupdater = b.id 
inner join glpi_entities c on a.entities_id = c.id
inner join glpi_itilcategories d on a.itilcategories_id = d.id

where solvedate >= '2023-12-01 00:00:00' AND solvedate  <= '2023-12-31 23:59:59' OR STATUS IN (1,2,3,4) 
