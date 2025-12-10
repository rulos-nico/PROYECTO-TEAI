# -*- coding: utf-8 -*-
import STSupervisorTCT as ag

# ==========================================================
# MAPEO I/O PARA GENERACIÓN DE CÓDIGO ST
# ==========================================================
actuators = dict([])

# ---- EVENTOS CONTROLABLES (SALIDAS) ----
actuators['l2_on'] = 'GD_OUT_0:ON:%QX100.0'
actuators['l2_off'] = 'GD_OUT_0:OFF'
actuators['banda2_on'] = 'GD_OUT_1:ON:%QX100.1'
actuators['banda2_off'] = 'GD_OUT_1:OFF'
actuators['l1_on'] = 'GD_OUT_2:ON:%QX100.2'
actuators['l1_off'] = 'GD_OUT_2:OFF'
actuators['banda1_on'] = 'GD_OUT_3:ON:%QX100.3'
actuators['banda1_off'] = 'GD_OUT_3:OFF'
actuators['aceptado_on'] = 'GD_OUT_4:ON:%QX100.4'
actuators['aceptado_off'] = 'GD_OUT_4:OFF'
actuators['rechazado_on'] = 'GD_OUT_5:ON:%QX100.5'
actuators['rechazado_off'] = 'GD_OUT_5:OFF'
actuators['giro_on'] = 'GD_OUT_6:ON:%QX100.6'
actuators['giro_off'] = 'GD_OUT_6:OFF'
actuators['encendido_total_on'] = 'GD_OUT_7:ON:%QX100.7'
# ---- EVENTOS NO CONTROLABLES (SENSORES/ENTRADAS) ----
actuators['l2_p1'] = 'RE_l2p1:GD_IN_0:%IX100.0'
actuators['l1_p1'] = 'RE_l1p1:GD_IN_1:%IX100.1'
actuators['azul'] = 'RE_azul:GD_IN_2:%IX100.2'
actuators['verde'] = 'RE_verde:GD_IN_3:%IX100.3'
actuators['salida_aceptado'] = 'RE_salidaacep:GD_IN_4:%IX100.4'
actuators['salida_rechazado'] = 'RE_salidarecha:GD_IN_5:%IX100.5'
p = ag.process('MESA_ROTATORIA')

# ##########################################################
# PARTE 1: DEFINICIÓN DE PLANTAS
# ##########################################################

# ==========================================================
# PLANTA EMITTER 2
# ==========================================================
M2 = p.new_automaton('M2')
p.add_state(M2, 2, [], [True,True])
p.add_transition(M2,transitions=[(0,1),(1,0)],events=['l2_on','l2_off'],uncontrollable=[])
# ==========================================================
# PLANTA EMITTER 1
# ==========================================================
M1 = p.new_automaton('M1')
p.add_state(M1, 2, [], [True,True])
p.add_transition(M1,transitions=[(0,1),(1,0)],events=['l1_on','l1_off'],uncontrollable=[])
# ==========================================================
# PLANTA BANDA 2
# ==========================================================
B2 = p.new_automaton('B2')
p.add_state(B2, 2, [], [True,True])
p.add_transition(B2,transitions=[(0,1),(1,0)],events=['banda2_off','banda2_on'],uncontrollable=[])
# ==========================================================
# PLANTA BANDA 1
# ==========================================================
B1 = p.new_automaton('B1')
p.add_state(B1, 2, [], [True,True])
p.add_transition(B1,transitions=[(0,1),(1,0)],events=['banda1_off','banda1_on'],uncontrollable=[])
# ==========================================================
# PLANTA MESA
# ==========================================================
Mesa = p.new_automaton('Mesa')
p.add_state(Mesa, 10, [], [True,True,True,True,True,True,True,True,True,True])
p.add_transition(Mesa,transitions=[(0,1),(0,1),(1,2),(1,2),(2,3),(3,4),(4,5),(5,6),(6,0),(3,7),(7,8),(8,9),(9,0)],events=['banda2_on','banda1_on','azul','verde','giro_on','aceptado_on','salida_aceptado','aceptado_off','giro_off','rechazado_on','salida_rechazado','rechazado_off','giro_off'],uncontrollable=['azul','verde','salida_aceptado','salida_rechazado'])
# ==========================================================
# Encendido Total
# ==========================================================
Encendido = p.new_automaton('Encendido')
p.add_state(Encendido,2,[],[True,True])
p.add_transition(Encendido,transitions=[(0,1),(1,1),(1,1),(1,1),(1,1)],events=['encendido_total_on','l1_on','l2_on','banda1_on','banda2_on'],uncontrollable=['l1_on','l2_on','banda1_on','banda2_on'])

# ##########################################################
# PARTE 2: DEFINICIÓN DE ESPECIFICACIONES
# ##########################################################

# ==========================================================
# Envio 2
# ==========================================================
REQ_envio2=p.new_automaton('REQ_envio2')
p.add_state(REQ_envio2,5,[],[True,True,True,True,True])
p.add_transition(REQ_envio2,transitions=[(0,1),(1,2),(2,3),(3,4),(4,0)],events=['l2_on','l2_off','l2_p1','banda2_off','banda2_on'],uncontrollable=['l2_p1'])
""" p.add_self_event(REQ_envio2,'l2_p1') """
""" p.complete_spec(REQ_envio2) """
# ==========================================================
# Envio 1
# ==========================================================
REQ_envio1=p.new_automaton('REQ_envio1')
p.add_state(REQ_envio1,5,[],[True,True,True,True,True])
p.add_transition(REQ_envio1,transitions=[(0,1),(1,2),(2,3),(3,4),(4,0)],events=['l1_on','l1_off','l1_p1','banda1_off','banda1_on'],uncontrollable=['l1_p1'])
""" p.add_self_event(REQ_envio1,'l1_p1') """
""" p.complete_spec(REQ_envio1) """
# ==========================================================
# OrdenEnvio
# ==========================================================
REQ_orden=p.new_automaton('REQ_orden')
p.add_state(REQ_orden,5,[],[True,True,True,True,True])
p.add_transition(REQ_orden,transitions=[(0,1),(1,0),(1,2),(2,3),(0,3),(3,4),(3,0),(4,1)],
                 events=['l1_p1','banda1_on','l2_p1','banda1_on','l2_p1','l1_p1','banda2_on','banda2_on'],uncontrollable=['l1_p1','l2_p1'])
""" p.add_self_event(REQ_orden,'l1_p1')
p.add_self_event(REQ_orden,'l2_p1') """
""" p.complete_spec(REQ_orden) """
# ==========================================================
# OrdenColor
# ==========================================================
REQ_color=p.new_automaton('REQ_color')
p.add_state(REQ_color,7,[],[True,True,True,True,True,True,True])
p.add_transition(REQ_color,transitions=[(0,1),(1,2),(2,3),(3,2),(0,4),(4,5),(5,6),(6,5),(2,4),(5,1)],
                 events=['verde','aceptado_on','verde','rechazado_on','azul','aceptado_on','azul','rechazado_on','azul','verde'],uncontrollable=['azul','verde'])
""" p.add_self_event(REQ_color,'azul')
p.add_self_event(REQ_color,'verde') """
""" p.complete_spec(REQ_color) """

p.generate_all_automata()

# ##########################################################
# PARTE 3: Calculo de planta, especificaciones y supervisor
# ##########################################################

Planta=p.automata_syncronize(['M2','M1','B2','B1','Mesa'],name_sync='PLANT')

Spect_orden_color = p.automata_syncronize(['REQ_orden','REQ_color','REQ_envio1','REQ_envio2','PLANT'],name_sync='Spect_orden_color')
p.load_automata([Spect_orden_color])


supdat=p.condat(Planta,Spect_orden_color,'SUPDAT')
p.load_automata([Planta,Spect_orden_color])
p.generate_ST_OPENPLC([Spect_orden_color],[Planta],actuators,'Mesa')

print("\nAutomaton Especificacion Orden y Color:")
print(p.get_automaton('Spect_orden_color'))






