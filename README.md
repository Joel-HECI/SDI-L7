# SDI-L7
Temas: Contadores, Divisores de frecuencia, VHDL, Basys 3, Visualización dinámica.

Problema a solucionar:

Se desea diseñar en VHDL (diseñar por componentes) un contador ascendente síncrono de tres dígitos decimales programable cuya frecuencia de conteo sea:
Opción 1: 1 Hz
Opción 2: 2 Hz
Opción 3: 4 Hz
Opción 4: 8 Hz
Estas opciones se eligen con DIPSWITCH de la Basys.

La frecuencia seleccionada es división del oscilador local de la tarjeta el cual es a 100MHz. Ponga en un LED de manera permanente la salida de 1Hz. Esto sirve de monitoreo del reloj.

La salida del contador debe ser en el rango de 000 a 999 (decimal) pero se debe iniciar en el valor que indiquen 12 DIPSW (o sea que el contador es de carga en paralelo con un pulsador se carga de los 12 dipsw pre seleccionados), la salida se visualiza en tres display 7 segmentos (visualización dinámica).
Un pulsador debe hacer el reset (puesta a cero) de los 3 contadores.
Un switch debe detener o continuar el conteo.
En archivo adjunto les muestro el ejemplo de visualización dinámica para 4 dígitos.

Tener en cuenta que como el  el diseño es VHDL, el contador VHDL solo consiste en el incremento de una señal tipo vector. Ver la presentación en Moodle sobre sistemas secuenciales.

Prepare para presentar:
Diagrama de bloques (defina muy bien los pines de salida y entrada)
Diagrama esquemático RTL (Lo arroja el Vivado)
Código VHDL (Lo hacen y sustentan ustedes)
Simulación de al menos 20 cuentas.
Tarjeta Basys 3 programada.
