DELETE FROM alimentacion
DELETE FROM aportacionsemanalegresos
DELETE FROM aportacionsemanalingresos
DELETE FROM apoyoenespecie --- no se esta llenando
DELETE FROM caracteristicas_casa  -- en esta tabla el folio_disp se llena con n 1
DELETE FROM datosgenerales --- en essta tabla la fechadecaptura no se esta llenando
DELETE FROM documentos
DELETE FROM equipamiento -- no se esta llenando
DELETE FROM escolaridadSeguridadSocial
DELETE FROM estadoDeLaCasaYConstruccion
DELETE FROM estructuraFamiliar  -- en esta tabla se encontro un nulo en fecha de nacimiento
DELETE FROM fotografia
DELETE FROM integrante_clasificacion --  no se esta llenando
DELETE FROM integrante_condiciones -- no se esta llenando
DELETE FROM integrante_prestacionLaboral -- no se esta llenando
DELETE FROM remesas -- revisar campos de clavefrecuenciaaopyo y ordenfecuenciaapoyo que estan en nulo
DELETE FROM resolucion
DELETE FROM resolucionBAL -- revisar campos de clavedeFrecuencia, OrdenFrecuencia, claaveDuracion, ordenDuracion
DELETE FROM saludPertenenciaIndigena --
DELETE FROM servicios -- no se esta llenando