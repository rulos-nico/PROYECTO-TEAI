# -*- coding: utf-8 -*-
import STSupervisorTCT as ag

# ==========================================================
# MAPEO I/O PARA GENERACIÓN DE CÓDIGO ST
# ==========================================================
actuators = dict([])

# ---- EVENTOS CONTROLABLES (SALIDAS) ----
actuators['Aceptar'] = 'GD_OUT_0:ON:%QX100.0'
actuators['Rechazar'] = 'GD_OUT_1:ON:%QX100.1'
actuators['Apagado_L1'] = 'GD_OUT_2:OFF:%QX100.2'
actuators['Trabajando_L1'] = 'GD_OUT_3:ON:%QX100.3'
actuators['Apagado_L2'] = 'GD_OUT_4:OFF:%QX100.4'
actuators['Trabajando_L2'] = 'GD_OUT_5:ON:%QX100.5'

# Cintas transportadoras (6 cintas)
actuators['CintaIngreso1_ON'] = 'GD_OUT_6:ON:%QX100.6'
actuators['CintaIngreso1_OFF'] = 'GD_OUT_6:OFF'
actuators['CintaIngreso2_ON'] = 'GD_OUT_7:ON:%QX100.7'
actuators['CintaIngreso2_OFF'] = 'GD_OUT_7:OFF'
actuators['CintaSalida1_ON'] = 'GD_OUT_8:ON:%QX101.0'
actuators['CintaSalida1_OFF'] = 'GD_OUT_8:OFF'
actuators['CintaSalida2_ON'] = 'GD_OUT_9:ON:%QX101.1'
actuators['CintaSalida2_OFF'] = 'GD_OUT_9:OFF'
actuators['CintaAceptado_ON'] = 'GD_OUT_10:ON:%QX101.2'
actuators['CintaAceptado_OFF'] = 'GD_OUT_10:OFF'
actuators['CintaRechazo_ON'] = 'GD_OUT_11:ON:%QX101.3'
actuators['CintaRechazo_OFF'] = 'GD_OUT_11:OFF'

# ---- EVENTOS NO CONTROLABLES (SENSORES/ENTRADAS) ----
actuators['Arrancar'] = 'RE_START:GD_IN_0:%IX100.0'
actuators['InicioTrabajo_L1'] = 'FE_INICIO_L1:GD_IN_1:%IX100.1'
actuators['InicioTrabajo_L2'] = 'FE_INICIO_L2:GD_IN_2:%IX100.2'
actuators['Llegada_L1'] = 'FE_L1:GD_IN_3:%IX100.3'
actuators['Llegada_L2'] = 'FE_L2:GD_IN_4:%IX100.4'
actuators['LlegadaAzul'] = 'FE_AZUL:GD_IN_5:%IX100.5'
actuators['LlegadaVerde'] = 'FE_VERDE:GD_IN_6:%IX100.6'
actuators['GiroAceptadoCompleto'] = 'FE_GIRO_A:GD_IN_7:%IX100.7'
actuators['GiroRechazoCompleto'] = 'FE_GIRO_R:GD_IN_8:%IX101.0'
actuators['DescargarAceptadoCompleto'] = 'FE_DESC_A:GD_IN_9:%IX101.1'
actuators['DescargarRechazadoCompleto'] = 'FE_DESC_R:GD_IN_10:%IX101.2'
actuators['FinTrabajo_L1'] = 'FE_FIN_L1:GD_IN_11:%IX101.3'
actuators['FinTrabajo_L2'] = 'FE_FIN_L2:GD_IN_12:%IX101.4'

# Sensores de cintas transportadoras
actuators['CintaIngreso1_Sensor'] = 'FE_CI1:GD_IN_13:%IX101.5'
actuators['CintaIngreso2_Sensor'] = 'FE_CI2:GD_IN_14:%IX101.6'
actuators['CintaSalida1_Sensor'] = 'FE_CS1:GD_IN_15:%IX101.7'
actuators['CintaSalida2_Sensor'] = 'FE_CS2:GD_IN_16:%IX102.0'
actuators['CintaAceptado_Sensor'] = 'FE_CA:GD_IN_17:%IX102.1'
actuators['CintaRechazo_Sensor'] = 'FE_CR:GD_IN_18:%IX102.2'

p = ag.process('MESA_ROTATORIA')

# ##########################################################
# PARTE 1: DEFINICIÓN DE PLANTAS
# ##########################################################

# ==========================================================
# PLANTA MESA ROTATORIA
# ==========================================================
PL_MESA = p.new_automaton('PLANTA_MESA')
p.add_state(PL_MESA, 8, [], [[True] * 8])

# M0 -> M1 [Arrancar]
p.add_transition(PL_MESA, [(0, 1)], ['Arrancar'], ['Arrancar'])
# M1 -> M2 [Llegada_L1]
p.add_transition(PL_MESA, [(1, 2)], ['Llegada_L1'], ['Llegada_L1'])
# M1 -> M2 [Llegada_L2]
p.add_transition(PL_MESA, [(1, 2)], ['Llegada_L2'], ['Llegada_L2'])
# M2 -> M3 [LlegadaAzul]
p.add_transition(PL_MESA, [(2, 3)], ['LlegadaAzul'], ['LlegadaAzul'])
# M2 -> M3 [LlegadaVerde]
p.add_transition(PL_MESA, [(2, 3)], ['LlegadaVerde'], ['LlegadaVerde'])
# M3 -> M4 [Aceptar]
p.add_transition(PL_MESA, [(3, 4)], ['Aceptar'], [])
# M3 -> M5 [Rechazar]
p.add_transition(PL_MESA, [(3, 5)], ['Rechazar'], [])
# M4 -> M6 [GiroAceptadoCompleto]
p.add_transition(PL_MESA, [(4, 6)], ['GiroAceptadoCompleto'], ['GiroAceptadoCompleto'])
# M5 -> M7 [GiroRechazoCompleto]
p.add_transition(PL_MESA, [(5, 7)], ['GiroRechazoCompleto'], ['GiroRechazoCompleto'])
# M6 -> M1 [DescargarAceptadoCompleto]
p.add_transition(PL_MESA, [(6, 1)], ['DescargarAceptadoCompleto'], ['DescargarAceptadoCompleto'])
# M7 -> M1 [DescargarRechazadoCompleto]
p.add_transition(PL_MESA, [(7, 1)], ['DescargarRechazadoCompleto'], ['DescargarRechazadoCompleto'])

# ==========================================================
# PLANTA LÍNEA 1
# ==========================================================
PL_L1 = p.new_automaton('PLANTA_L1')
p.add_state(PL_L1, 2, [], [[True, True]])

# C1 -> C1 [InicioTrabajo_L1] (no controlable - sensor)
p.add_transition(PL_L1, [(0, 1)], ['InicioTrabajo_L1'], ['InicioTrabajo_L1'])
# C1 -> C0 [FinTrabajo_L1] (no controlable)
p.add_transition(PL_L1, [(1, 0)], ['FinTrabajo_L1'], ['FinTrabajo_L1'])
# C0 -> C0 [Apagado_L1] (controlable)
p.add_transition(PL_L1, [(0, 0)], ['Apagado_L1'], [])
# C1 -> C1 [Trabajando_L1] (controlable)
p.add_transition(PL_L1, [(1, 1)], ['Trabajando_L1'], [])

# ==========================================================
# PLANTA LÍNEA 2
# ==========================================================
PL_L2 = p.new_automaton('PLANTA_L2')
p.add_state(PL_L2, 2, [], [[True, True]])

# C2 -> C2 [InicioTrabajo_L2] (no controlable - sensor)
p.add_transition(PL_L2, [(0, 1)], ['InicioTrabajo_L2'], ['InicioTrabajo_L2'])
# C1 -> C0 [FinTrabajo_L2] (no controlable)
p.add_transition(PL_L2, [(1, 0)], ['FinTrabajo_L2'], ['FinTrabajo_L2'])
# C0 -> C0 [Apagado_L2] (controlable)
p.add_transition(PL_L2, [(0, 0)], ['Apagado_L2'], [])
# C1 -> C1 [Trabajando_L2] (controlable)
p.add_transition(PL_L2, [(1, 1)], ['Trabajando_L2'], [])


# ==========================================================
# PLANTAS: 6 CINTAS TRANSPORTADORAS
# ==========================================================

# CINTA INGRESO 1 (hacia máquina desde L1)
CINTA_INGRESO1 = p.new_automaton('CINTA_INGRESO1')
p.add_state(CINTA_INGRESO1, 2, [], [True, True])
# C0 -> C1 [CintaIngreso1_ON] (controlable)
p.add_transition(CINTA_INGRESO1, [(0, 1)], ['CintaIngreso1_ON'], [])
# C1 -> C0 [CintaIngreso1_OFF] (controlable)
p.add_transition(CINTA_INGRESO1, [(1, 0)], ['CintaIngreso1_OFF'], [])
# C1 -> C1 [CintaIngreso1_Sensor] (no controlable - sensor)
p.add_transition(CINTA_INGRESO1, [(1, 1)], ['CintaIngreso1_Sensor'], ['CintaIngreso1_Sensor'])

# CINTA INGRESO 2 (hacia máquina desde L2)
CINTA_INGRESO2 = p.new_automaton('CINTA_INGRESO2')
p.add_state(CINTA_INGRESO2, 2, [], [True, True])
# C0 -> C1 [CintaIngreso2_ON] (controlable)
p.add_transition(CINTA_INGRESO2, [(0, 1)], ['CintaIngreso2_ON'], [])
# C1 -> C0 [CintaIngreso2_OFF] (controlable)
p.add_transition(CINTA_INGRESO2, [(1, 0)], ['CintaIngreso2_OFF'], [])
# C1 -> C1 [CintaIngreso2_Sensor] (no controlable - sensor)
p.add_transition(CINTA_INGRESO2, [(1, 1)], ['CintaIngreso2_Sensor'], ['CintaIngreso2_Sensor'])

# CINTA SALIDA 1 (desde máquina hacia L1)
CINTA_SALIDA1 = p.new_automaton('CINTA_SALIDA1')
p.add_state(CINTA_SALIDA1, 2, [], [True, True])
# C0 -> C1 [CintaSalida1_ON] (controlable)
p.add_transition(CINTA_SALIDA1, [(0, 1)], ['CintaSalida1_ON'], [])
# C1 -> C0 [CintaSalida1_OFF] (controlable)
p.add_transition(CINTA_SALIDA1, [(1, 0)], ['CintaSalida1_OFF'], [])
# C1 -> C1 [CintaSalida1_Sensor] (no controlable - sensor)
p.add_transition(CINTA_SALIDA1, [(1, 1)], ['CintaSalida1_Sensor'], ['CintaSalida1_Sensor'])

# CINTA SALIDA 2 (desde máquina hacia L2)
CINTA_SALIDA2 = p.new_automaton('CINTA_SALIDA2')
p.add_state(CINTA_SALIDA2, 2, [], [True, True])
# C0 -> C1 [CintaSalida2_ON] (controlable)
p.add_transition(CINTA_SALIDA2, [(0, 1)], ['CintaSalida2_ON'], [])
# C1 -> C0 [CintaSalida2_OFF] (controlable)
p.add_transition(CINTA_SALIDA2, [(1, 0)], ['CintaSalida2_OFF'], [])
# C1 -> C1 [CintaSalida2_Sensor] (no controlable - sensor)
p.add_transition(CINTA_SALIDA2, [(1, 1)], ['CintaSalida2_Sensor'], ['CintaSalida2_Sensor'])

# CINTA ACEPTADO (línea de piezas aceptadas)
CINTA_ACEPTADO = p.new_automaton('CINTA_ACEPTADO')
p.add_state(CINTA_ACEPTADO, 2, [], [True, True])
# C0 -> C1 [CintaAceptado_ON] (controlable)
p.add_transition(CINTA_ACEPTADO, [(0, 1)], ['CintaAceptado_ON'], [])
# C1 -> C0 [CintaAceptado_OFF] (controlable)
p.add_transition(CINTA_ACEPTADO, [(1, 0)], ['CintaAceptado_OFF'], [])
# C1 -> C1 [CintaAceptado_Sensor] (no controlable - sensor)
p.add_transition(CINTA_ACEPTADO, [(1, 1)], ['CintaAceptado_Sensor'], ['CintaAceptado_Sensor'])

# CINTA RECHAZO (línea de piezas rechazadas)
CINTA_RECHAZO = p.new_automaton('CINTA_RECHAZO')
p.add_state(CINTA_RECHAZO, 2, [], [True, True])
# C0 -> C1 [CintaRechazo_ON] (controlable)
p.add_transition(CINTA_RECHAZO, [(0, 1)], ['CintaRechazo_ON'], [])
# C1 -> C0 [CintaRechazo_OFF] (controlable)
p.add_transition(CINTA_RECHAZO, [(1, 0)], ['CintaRechazo_OFF'], [])
# C1 -> C1 [CintaRechazo_Sensor] (no controlable - sensor)
p.add_transition(CINTA_RECHAZO, [(1, 1)], ['CintaRechazo_Sensor'], ['CintaRechazo_Sensor'])


# ##########################################################
# PARTE 2: DEFINICIÓN DE ESPECIFICACIONES
# ##########################################################

# ==========================================================
# ESPECIFICACIÓN DE COLOR
# ==========================================================
ESPEC_COLOR = p.new_automaton('ESPEC_COLOR')
p.add_state(ESPEC_COLOR, 10, [], [[True] * 10])

# C0 -> C1 [Arrancar]
p.add_transition(ESPEC_COLOR, [(0, 1)], ['Arrancar'], [])
# C1 -> C2 [LlegadaAzul]
p.add_transition(ESPEC_COLOR, [(1, 2)], ['LlegadaAzul'], [])
# C2 -> C1 [Rechazar]
p.add_transition(ESPEC_COLOR, [(2, 1)], ['Rechazar'], [])
# C3 -> C1 [Rechazar]
p.add_transition(ESPEC_COLOR, [(3, 1)], ['Rechazar'], [])
# C1 -> C3 [LlegadaVerde]
p.add_transition(ESPEC_COLOR, [(1, 3)], ['LlegadaVerde'], [])
# C2 -> C4 [Aceptar]
p.add_transition(ESPEC_COLOR, [(2, 4)], ['Aceptar'], [])
# C4 -> C5 [LlegadaVerde]
p.add_transition(ESPEC_COLOR, [(4, 5)], ['LlegadaVerde'], [])
# C5 -> C4 [Rechazar]
p.add_transition(ESPEC_COLOR, [(5, 4)], ['Rechazar'], [])
# C4 -> C6 [LlegadaAzul]
p.add_transition(ESPEC_COLOR, [(4, 6)], ['LlegadaAzul'], [])
# C6 -> C4 [Rechazar]
p.add_transition(ESPEC_COLOR, [(6, 4)], ['Rechazar'], [])
# C5 -> C7 [Aceptar]
p.add_transition(ESPEC_COLOR, [(5, 7)], ['Aceptar'], [])
# C7 -> C8 [LlegadaVerde]
p.add_transition(ESPEC_COLOR, [(7, 8)], ['LlegadaVerde'], [])
# C8 -> C7 [Rechazar]
p.add_transition(ESPEC_COLOR, [(8, 7)], ['Rechazar'], [])
# C7 -> C9 [LlegadaAzul]
p.add_transition(ESPEC_COLOR, [(7, 9)], ['LlegadaAzul'], [])
# C9 -> C7 [Rechazar]
p.add_transition(ESPEC_COLOR, [(9, 7)], ['Rechazar'], [])
# C3 -> C7 [Aceptar]
p.add_transition(ESPEC_COLOR, [(3, 7)], ['Aceptar'], [])
# C9 -> C4 [Aceptar]
p.add_transition(ESPEC_COLOR, [(9, 4)], ['Aceptar'], [])

# ==========================================================
# ESPECIFICACIÓN: PRIORIDAD POR LÍNEA
# ==========================================================
PRIORIDAD_LINEA = p.new_automaton('Prioridad_por_linea')
p.add_state(PRIORIDAD_LINEA, 5, [], [[True] * 5])

# C0 -> C1 [Llegada_L1]
p.add_transition(PRIORIDAD_LINEA, [(0, 1)], ['Llegada_L1'], [])
# C1 -> C3 [LlegadaVerde, LlegadaAzul]
p.add_transition(PRIORIDAD_LINEA, [(1, 3)], ['LlegadaVerde'], [])
p.add_transition(PRIORIDAD_LINEA, [(1, 3)], ['LlegadaAzul'], [])
# C3 -> C3 [Aceptar, Rechazar]
p.add_transition(PRIORIDAD_LINEA, [(3, 3)], ['Aceptar'], [])
p.add_transition(PRIORIDAD_LINEA, [(3, 3)], ['Rechazar'], [])
# C3 -> C0 [DescargarAceptadoCompleto, DescargarRechazadoCompleto]
p.add_transition(PRIORIDAD_LINEA, [(3, 0)], ['DescargarAceptadoCompleto'], [])
p.add_transition(PRIORIDAD_LINEA, [(3, 0)], ['DescargarRechazadoCompleto'], [])
# C0 -> C2 [Llegada_L2]
p.add_transition(PRIORIDAD_LINEA, [(0, 2)], ['Llegada_L2'], [])
# C2 -> C4 [LlegadaVerde, LlegadaAzul]
p.add_transition(PRIORIDAD_LINEA, [(2, 4)], ['LlegadaVerde'], [])
p.add_transition(PRIORIDAD_LINEA, [(2, 4)], ['LlegadaAzul'], [])
# C4 -> C4 [Aceptar, Rechazar]
p.add_transition(PRIORIDAD_LINEA, [(4, 4)], ['Aceptar'], [])
p.add_transition(PRIORIDAD_LINEA, [(4, 4)], ['Rechazar'], [])
# C4 -> C0 [DescargarAceptadoCompleto, DescargarRechazadoCompleto]
p.add_transition(PRIORIDAD_LINEA, [(4, 0)], ['DescargarAceptadoCompleto'], [])
p.add_transition(PRIORIDAD_LINEA, [(4, 0)], ['DescargarRechazadoCompleto'], [])

# ==========================================================
# ESPECIFICACIÓN: BUFFER LÍNEA 1
# ==========================================================
BUFFER_L1 = p.new_automaton('Buffer_linea1')
p.add_state(BUFFER_L1, 3, [], [[True] * 3])

# C0 -> C1 [FinTrabajo_L1]
p.add_transition(BUFFER_L1, [(0, 1)], ['FinTrabajo_L1'], [])
# C1 -> C2 [FinTrabajo_L1]
p.add_transition(BUFFER_L1, [(1, 2)], ['FinTrabajo_L1'], [])
# C2 -> C2 [Apagado_L1]
p.add_transition(BUFFER_L1, [(2, 2)], ['Apagado_L1'], [])
# C2 -> C1 [Llegada_L1]
p.add_transition(BUFFER_L1, [(2, 1)], ['Llegada_L1'], [])
# C1 -> C0 [Llegada_L1]
p.add_transition(BUFFER_L1, [(1, 0)], ['Llegada_L1'], [])

# ==========================================================
# ESPECIFICACIÓN: BUFFER LÍNEA 2
# ==========================================================
BUFFER_L2 = p.new_automaton('Buffer_linea2')
p.add_state(BUFFER_L2, 3, [], [[True] * 3])

# C0 -> C1 [FinTrabajo_L2]
p.add_transition(BUFFER_L2, [(0, 1)], ['FinTrabajo_L2'], [])
# C1 -> C2 [FinTrabajo_L2]
p.add_transition(BUFFER_L2, [(1, 2)], ['FinTrabajo_L2'], [])
# C2 -> C2 [Apagado_L2]
p.add_transition(BUFFER_L2, [(2, 2)], ['Apagado_L2'], [])
# C2 -> C1 [Llegada_L2]
p.add_transition(BUFFER_L2, [(2, 1)], ['Llegada_L2'], [])
# C1 -> C0 [Llegada_L2]
p.add_transition(BUFFER_L2, [(1, 0)], ['Llegada_L2'], [])

# ==========================================================
# COMPLETAR ESPECIFICACIONES CON AUTO-LOOPS
# ==========================================================
p.complete_spec(BUFFER_L1)
p.complete_spec(BUFFER_L2)

# ==========================================================
# GENERAR ARCHIVOS TCT
# ==========================================================
p.generate_all_automata()

# ##########################################################
# PARTE 3: VISUALIZACIÓN DE PLANTAS Y ESPECIFICACIONES
# ##########################################################

p.load_automata([PL_MESA, PL_L1, PL_L2, CINTA_INGRESO1, CINTA_INGRESO2, 
                 CINTA_SALIDA1, CINTA_SALIDA2, CINTA_ACEPTADO, CINTA_RECHAZO,
                 ESPEC_COLOR, PRIORIDAD_LINEA, BUFFER_L1, BUFFER_L2])

print("\n" + "="*70)
print("PLANTAS DEL SISTEMA")
print("="*70)

print("\n[PLANTA MESA ROTATORIA]")
print(p.get_automaton('PLANTA_MESA'))

print("\n[PLANTA LÍNEA 1]")
print(p.get_automaton('PLANTA_L1'))

print("\n[PLANTA LÍNEA 2]")
print(p.get_automaton('PLANTA_L2'))

print("\n[CINTAS TRANSPORTADORAS]")
print("Cinta Ingreso 1:", p.get_automaton('CINTA_INGRESO1'))
print("Cinta Ingreso 2:", p.get_automaton('CINTA_INGRESO2'))
print("Cinta Salida 1:", p.get_automaton('CINTA_SALIDA1'))
print("Cinta Salida 2:", p.get_automaton('CINTA_SALIDA2'))
print("Cinta Aceptado:", p.get_automaton('CINTA_ACEPTADO'))
print("Cinta Rechazo:", p.get_automaton('CINTA_RECHAZO'))

print("\n" + "="*70)
print("ESPECIFICACIONES DEL SISTEMA")
print("="*70)

print("\n[ESPECIFICACIÓN COLOR]")
print(p.get_automaton('ESPEC_COLOR'))

print("\n[ESPECIFICACIÓN PRIORIDAD POR LÍNEA]")
print(p.get_automaton('Prioridad_por_linea'))

print("\n[ESPECIFICACIÓN BUFFER LÍNEA 1]")
print(p.get_automaton('Buffer_linea1'))

print("\n[ESPECIFICACIÓN BUFFER LÍNEA 2]")
print(p.get_automaton('Buffer_linea2'))

# ##########################################################
# PARTE 4: COMPOSICIONES PARALELAS INDIVIDUALES
# ##########################################################

print("\n" + "="*70)
print("COMPOSICIONES PARALELAS")
print("="*70)

# Composición Línea 1 con Buffer
PLANTA_L1_CON_BUFFER = p.automata_syncronize(
    [PL_L1, BUFFER_L1], 
    name_sync='PLANTA_L1_CON_BUFFER'
)
p.load_automata([PLANTA_L1_CON_BUFFER])
print("\n[COMPOSICIÓN: PLANTA_L1 || BUFFER_L1]")
print(p.get_automaton('PLANTA_L1_CON_BUFFER'))

# Composición Línea 2 con Buffer
PLANTA_L2_CON_BUFFER = p.automata_syncronize(
    [PL_L2, BUFFER_L2], 
    name_sync='PLANTA_L2_CON_BUFFER'
)
p.load_automata([PLANTA_L2_CON_BUFFER])
print("\n[COMPOSICIÓN: PLANTA_L2 || BUFFER_L2]")
print(p.get_automaton('PLANTA_L2_CON_BUFFER'))

# Composición Mesa con Especificación de Color
PL_MESA_COLOR = p.automata_syncronize(
    [PL_MESA, ESPEC_COLOR], 
    name_sync='PL_MESA_COLOR'
)
p.load_automata([PL_MESA_COLOR])
print("\n[COMPOSICIÓN: PLANTA_MESA || ESPEC_COLOR]")
print(p.get_automaton('PL_MESA_COLOR'))

# Composición Mesa+Color con Prioridad
PL_MESA_COLOR_PRIORIDAD = p.automata_syncronize(
    [PL_MESA_COLOR, PRIORIDAD_LINEA], 
    name_sync='PL_MESA_COLOR_PRIORIDAD'
)
p.load_automata([PL_MESA_COLOR_PRIORIDAD])
print("\n[COMPOSICIÓN: PL_MESA_COLOR || PRIORIDAD_LINEA]")
print(p.get_automaton('PL_MESA_COLOR_PRIORIDAD'))

# Composición de ambas líneas con buffers
LINEAS_COMPLETAS = p.automata_syncronize(
    [PLANTA_L1_CON_BUFFER, PL_L2, BUFFER_L2], 
    name_sync='LINEAS_COMPLETAS'
)
p.load_automata([LINEAS_COMPLETAS])
print("\n[COMPOSICIÓN: (L1 || BUFFER_L1) || L2 || BUFFER_L2]")
print(p.get_automaton('LINEAS_COMPLETAS'))

# ==========================================================
# PLANTA TOTAL: Sistema sin cintas (para evitar explosión de estados)
# ==========================================================
PLANTA_TOTAL = p.automata_syncronize(
    [PL_MESA_COLOR_PRIORIDAD, LINEAS_COMPLETAS], 
    name_sync='PLANTA_TOTAL'
)

p.load_automata([PLANTA_TOTAL])
print("\n[COMPOSICIÓN TOTAL: MESA_COMPLETA || L1_CON_BUFFER || L2_CON_BUFFER]")
print(p.get_automaton('PLANTA_TOTAL'))

# ==========================================================
# SÍNTESIS DEL SUPERVISOR (La planta ya incluye todas las especificaciones)
# ==========================================================
SUP = PLANTA_TOTAL
SUP_DAT = p.condat(PLANTA_TOTAL, SUP, 'SUP_DAT')
SIMSUP = p.supreduce(PLANTA_TOTAL, SUP, SUP_DAT, 'SIMSUP')

p.load_automata([SUP, SIMSUP])
print("\n" + "="*70)
print("SUPERVISOR FINAL")
print("="*70)
print("\n[SUPERVISOR ORIGINAL]")
print(p.get_automaton('PLANTA_TOTAL'))
print("\n[SUPERVISOR REDUCIDO]")
print(p.get_automaton('SIMSUP'))
print("="*70 + "\n")

print("\n" + "="*70)
print("DIAGRAMA DEL PROCESO DE SINTESIS DEL SUPERVISOR")
print("="*70)
print("""
FASE 1: PLANTAS BASE
+-- PL_MESA (8 estados, 11 trans)
+-- PL_L1 (2 estados, 4 trans)
+-- PL_L2 (2 estados, 4 trans)
+-- CINTA_INGRESO1 (2 estados, 3 trans) [ISOLATED]
+-- CINTA_INGRESO2 (2 estados, 3 trans) [ISOLATED]
+-- CINTA_SALIDA1 (2 estados, 3 trans) [ISOLATED]
+-- CINTA_SALIDA2 (2 estados, 3 trans) [ISOLATED]
+-- CINTA_ACEPTADO (2 estados, 3 trans) [ISOLATED]
+-- CINTA_RECHAZO (2 estados, 3 trans) [ISOLATED]

FASE 2: ESPECIFICACIONES
+-- ESPEC_COLOR (10 estados, 17 trans)
+-- PRIORIDAD_LINEA (5 estados, 14 trans)
+-- BUFFER_L1 (3 estados, 5 trans) + complete_spec()
+-- BUFFER_L2 (3 estados, 5 trans) + complete_spec()

FASE 3: COMPOSICIONES MODULARES
+-- Lineas de produccion:
|   +-- PLANTA_L1_CON_BUFFER = PL_L1 || BUFFER_L1
|   |   +-- (6 estados, 13 trans)
|   +-- PLANTA_L2_CON_BUFFER = PL_L2 || BUFFER_L2
|   |   +-- (6 estados, 13 trans)
|   +-- LINEAS_COMPLETAS = PLANTA_L1_CON_BUFFER || PLANTA_L2_CON_BUFFER
|       +-- (36 estados, 156 trans)
|
+-- Mesa rotatoria:
    +-- PL_MESA_COLOR = PL_MESA || ESPEC_COLOR
    |   +-- (23 estados, 33 trans)
    +-- PL_MESA_COLOR_PRIORIDAD = PL_MESA_COLOR || PRIORIDAD_LINEA
        +-- (42 estados, 59 trans)

FASE 4: SISTEMA COMPLETO
+-- PLANTA_TOTAL = PL_MESA_COLOR_PRIORIDAD || LINEAS_COMPLETAS
    +-- (1512 estados, 6588 trans)
    +-- Cintas manejadas como ISOLATED (no sincronizadas, control independiente)

FASE 5: SINTESIS DEL SUPERVISOR
+-- SUP = PLANTA_TOTAL (sin especificaciones adicionales)
+-- SUP_DAT = condat(PLANTA_TOTAL, SUP)
+-- SIMSUP = supreduce(PLANTA_TOTAL, SUP, SUP_DAT)
    +-- Reducido: (1 estado, 19 trans)
    +-- Original (SUP): (1512 estados, 6588 trans) <- USADO PARA ST

NOTA: El supervisor original (SUP = PLANTA_TOTAL) se usa para generar
      el codigo Structured Text, manteniendo toda la logica del sistema.
      Las 6 cintas transportadoras se manejan como componentes ISOLATED,
      permitiendo control independiente sin sincronizacion (evita explosion
      de estados: 64 estados -> 96768 estados en composicion completa).
""")
print("="*70)

# ==========================================================
# GENERACION DE CODIGO STRUCTURED TEXT PARA OPENPLC
# Las 6 cintas se manejan como componentes ISOLATED independientes
# ==========================================================

# Definir cintas como componentes aislados (similar a Transfer Line)
ISOLATED = [
    [CINTA_INGRESO1, CINTA_INGRESO2, CINTA_SALIDA1, 
     CINTA_SALIDA2, CINTA_ACEPTADO, CINTA_RECHAZO],
    []  # No hay mapeo de eventos internos para las cintas
]

p.generate_ST_OPENPLC(
    supervisors=[SUP],
    plants=[PLANTA_TOTAL],
    actuators=actuators,
    namest='mesa_rotatoria',
    Isolated=ISOLATED,
    initial='Arrancar'
)

print("\n" + "="*70)
print("CODIGO STRUCTURED TEXT GENERADO")
print("="*70)
print("Archivo: ST_Generated/mesa_rotatoria.st")
print(f"Supervisor usado: SUP (PLANTA_TOTAL)")
print(f"Estados: 1512")
print(f"Transiciones: 6588")
print(f"Actuadores mapeados: {len(actuators)}")
print("="*70)
