# -*- coding: utf-8 -*-
import STSupervisorTCT as ag

# ----------------------------------------------------------
# Mapeo I/O para generación de código ST
# ----------------------------------------------------------
actuators = dict([])

# Eventos Mesa Rotatoria
actuators['salida_aceptado']  = 'GD_OUT_0:ON:%IX100.0'
actuators['salida_rechazado'] = 'GD_OUT_1:ON:%IX100.1'
actuators['giro_on']          = 'GD_OUT_2:ON:%QX100.0'
actuators['giro_off']         = 'GD_OUT_2:OFF'
actuators['aceptado_on']      = 'GD_OUT_3:ON:%QX100.1'
actuators['aceptado_off']     = 'GD_OUT_3:OFF'
actuators['rechazado_on']     = 'GD_OUT_4:ON:%QX100.2'
actuators['rechazado_off']    = 'GD_OUT_4:OFF'
# Sensor de color
actuators['color_azul']  = 'GD_OUT_2:ON:%IX100.2'
actuators['color_verde'] = 'GD_OUT_3:ON:%IX100.4'
# Maquina # L1
actuators['emiter_on']  = 'GD_OUT_5:ON:%QX101.0'
actuators['emiter_off'] = 'GD_OUT_5:OFF'
# Buffer # L1
actuators['InicioTrabajo_L1'] = 'GD_OUT_6:ON:%IX101.0'
# Cinta de ingreso #1
actuators['CintaIngreso1_ON']     = 'GD_OUT_7:ON:%QX102.0'
actuators['CintaIngreso1_OFF']    = 'GD_OUT_7:OFF'
# Cinta de ingreso #2
actuators['CintaIngreso2_ON']     = 'GD_OUT_8:ON:%QX102.1'
actuators['CintaIngreso2_OFF']    = 'GD_OUT_8:OFF'


# ----------------------------------------------------------
p = ag.process('MESA_ROTATORIA')

# ==========================================================
# Definición de plantas
# ==========================================================
# PLANTA MESA ROTATORIA
PL_MESA = p.new_automaton('PLANTA_MESA')
p.add_state(PL_MESA, 9, [], [True])
p.add_transition(PL_MESA, [(0, 1),(0,1),(1,2),(2,3),(2,4),(3,5),(4,6),(6,8),(3,5),(1,2)],
                ['color_azul'],['color_verde'],['giro_on'],['aceptado_on'],)

# PLANTA L1
PL_L1 = p.new_automaton('PLANTA_L1')
p.add_state(PL_L1, 2, [], [[True, True]])
p.add_transition(PL_L1, [(0, 1)], ['InicioTrabajo_L1'], ['InicioTrabajo_L1'])
p.add_transition(PL_L1, [(1, 0)], ['FinTrabajo_L1'], ['FinTrabajo_L1'])
p.add_transition(PL_L1, [(0, 0)], ['Apagado_L1'], [])

# PLANTA L2
PL_L2 = p.new_automaton('PLANTA_L2')
p.add_state(PL_L2, 2, [], [[True, True]])
p.add_transition(PL_L2, [(0, 1)], ['InicioTrabajo_L2'], ['InicioTrabajo_L2'])
p.add_transition(PL_L2, [(1, 0)], ['FinTrabajo_L2'], ['FinTrabajo_L2'])
p.add_transition(PL_L2, [(0, 0)], ['Apagado_L2'], [])

# Cintas (cada una 2 estados, 3 transiciones)
CINTA_INGRESO1 = p.new_automaton('CINTA_INGRESO1')
p.add_state(CINTA_INGRESO1, 2, [], [True, True])
p.add_transition(CINTA_INGRESO1, [(0, 1)], ['CintaIngreso1_ON'], [])
p.add_transition(CINTA_INGRESO1, [(1, 0)], ['CintaIngreso1_OFF'], [])
p.add_transition(CINTA_INGRESO1, [(1, 1)], ['CintaIngreso1_Sensor'], ['CintaIngreso1_Sensor'])

CINTA_INGRESO2 = p.new_automaton('CINTA_INGRESO2')
p.add_state(CINTA_INGRESO2, 2, [], [True, True])
p.add_transition(CINTA_INGRESO2, [(0, 1)], ['CintaIngreso2_ON'], [])
p.add_transition(CINTA_INGRESO2, [(1, 0)], ['CintaIngreso2_OFF'], [])
p.add_transition(CINTA_INGRESO2, [(1, 1)], ['CintaIngreso2_Sensor'], ['CintaIngreso2_Sensor'])

CINTA_SALIDA1 = p.new_automaton('CINTA_SALIDA1')
p.add_state(CINTA_SALIDA1, 2, [], [True, True])
p.add_transition(CINTA_SALIDA1, [(0, 1)], ['CintaSalida1_ON'], [])
p.add_transition(CINTA_SALIDA1, [(1, 0)], ['CintaSalida1_OFF'], [])
p.add_transition(CINTA_SALIDA1, [(1, 1)], ['CintaSalida1_Sensor'], ['CintaSalida1_Sensor'])

CINTA_SALIDA2 = p.new_automaton('CINTA_SALIDA2')
p.add_state(CINTA_SALIDA2, 2, [], [True, True])
p.add_transition(CINTA_SALIDA2, [(0, 1)], ['CintaSalida2_ON'], [])
p.add_transition(CINTA_SALIDA2, [(1, 0)], ['CintaSalida2_OFF'], [])
p.add_transition(CINTA_SALIDA2, [(1, 1)], ['CintaSalida2_Sensor'], ['CintaSalida2_Sensor'])

# ==========================================================
# Especificaciones
# ==========================================================
ESPEC_COLOR = p.new_automaton('ESPEC_COLOR')
p.add_state(ESPEC_COLOR, 4, [], [[True] * 4])
# Especificación simplificada: Azul->Rechazar, Verde->Aceptar
p.add_transition(ESPEC_COLOR, [(0, 1)], ['LlegadaAzul'], [])
p.add_transition(ESPEC_COLOR, [(0, 2)], ['LlegadaVerde'], [])
p.add_transition(ESPEC_COLOR, [(1, 3)], ['Rechazar'], [])
p.add_transition(ESPEC_COLOR, [(2, 3)], ['Aceptar'], [])
p.add_transition(ESPEC_COLOR, [(3, 0)], ['DescargarAceptadoCompleto'], [])
p.add_transition(ESPEC_COLOR, [(3, 0)], ['DescargarRechazadoCompleto'], [])

# ==========================================================
# ESPECIFICACIÓN: PRIORIDAD POR LÍNEA
# ==========================================================
PRIORIDAD_LINEA = p.new_automaton('Prioridad_por_linea')
p.add_state(PRIORIDAD_LINEA, 3, [], [[True] * 3])

# Permite ambas líneas pero solo una pieza a la vez en la mesa
# C0 -> C1 [Llegada_L1 o Llegada_L2]
p.add_transition(PRIORIDAD_LINEA, [(0, 1)], ['Llegada_L1'], [])
p.add_transition(PRIORIDAD_LINEA, [(0, 1)], ['Llegada_L2'], [])
# C1 -> C2 [LlegadaVerde o LlegadaAzul]
p.add_transition(PRIORIDAD_LINEA, [(1, 2)], ['LlegadaVerde'], [])
p.add_transition(PRIORIDAD_LINEA, [(1, 2)], ['LlegadaAzul'], [])
# C2 -> C0 [DescargarAceptadoCompleto o DescargarRechazadoCompleto]
p.add_transition(PRIORIDAD_LINEA, [(2, 0)], ['DescargarAceptadoCompleto'], [])
p.add_transition(PRIORIDAD_LINEA, [(2, 0)], ['DescargarRechazadoCompleto'], [])

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

p.complete_spec(BUFFER_L1)
p.complete_spec(BUFFER_L2)
p.complete_spec(PRIORIDAD_LINEA)
p.complete_spec(ESPEC_COLOR)

p.generate_all_automata()
# ==========================================================
# SÍNTESIS DE SUPERVISOR
# ==========================================================

# Sincronización de plantas
PL_AUTO = p.automata_syncronize(['PLANTA_MESA', 'PLANTA_L1', 'PLANTA_L2',
                                  'CINTA_INGRESO1','CINTA_INGRESO2',
                                  'CINTA_SALIDA1','CINTA_SALIDA2'], 
                                 name_sync='PL_AUTO')

# Sincronización de especificaciones
PL_ESPEC = p.automata_syncronize(['ESPEC_COLOR', 'Prioridad_por_linea', 
                                   'Buffer_linea1', 'Buffer_linea2'], 
                                  name_sync='PL_ESPEC')

# Calcular supervisor: supcon(PLANTA, ESPECIFICACIÓN)
SUP = p.supcon(PL_AUTO, PL_ESPEC, 'SUP')
SUP_DAT = p.condat(PL_AUTO, SUP, 'SUP_DAT')
SIMSUP = p.supreduce(PL_AUTO, SUP, SUP_DAT, 'SIMSUP')

# Cargar autómatas
p.load_automata([PL_AUTO, PL_ESPEC, SUP])

# Mostrar resultados
print('\n=== RESULTADOS ===')
print('Planta sincronizada:')
print(p.get_automaton(PL_AUTO))
print('\nEspecificación sincronizada:')
print(p.get_automaton(PL_ESPEC))
print('\nSupervisor:')
print(p.get_automaton(SUP))