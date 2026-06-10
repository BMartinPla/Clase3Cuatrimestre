socios:
    - id
    - tipoSocio_id
    - persona_id
    - finscripcion
    - fbaja
    - categoria_id

tipoSocio:
    - id
    - nombre

catSocio:
    - id
    - nombre

tipoCuota:
    - id
    - nombre

cuota: 
    - id
    - tipoCuota_id
    - nombre

deporte:
    - id
    - nombre

cuotaDeporte:
    - id
    - categoriaSocio_id
    - deporte_id
    - monto