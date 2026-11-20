# Pruebas de validación del sistema

**Proyecto:** Diseño, implementación y evaluación de una arquitectura de servidores virtualizados basada en Linux para TecnoGestión S.A.C.

**Entorno:** Oracle VirtualBox, Ubuntu Server 26.04.1 LTS y Windows.

## P1. Control de acceso y permisos

**Objetivo:** Comprobar que los usuarios solo puedan acceder a los directorios autorizados.

**Procedimiento:**
- Se creó el grupo `contabilidad` y se le asignó el usuario `usuario_conta`.
- Se configuraron permisos `2770` en `/srv/empresa/contabilidad`.
- Se intentó acceder al directorio con `usuario_conta` y `usuario_ventas`.

**Resultados:**
- `usuario_conta`: ACCESO PERMITIDO.
- `usuario_ventas`: ACCESO DENEGADO.

**Conclusión:** Los permisos de Linux restringieron correctamente el acceso por departamentos.

## P2. Interrupción y recuperación del servicio Samba

**Objetivo:** Evaluar la recuperación manual del servicio de archivos compartidos.

**Procedimiento:**
- Se comprobó que Samba estuviera activo.
- Se detuvo mediante `sudo systemctl stop smbd`.
- Se verificó la pérdida de acceso desde Windows.
- Se reinició mediante `sudo systemctl start smbd`.
- Se revisaron los registros y se volvió a acceder desde Windows.

**Resultado:** Samba pasó de activo a inactivo y posteriormente volvió a estar activo. Windows recuperó el acceso a la carpeta compartida.

**Conclusión:** Se demostró la recuperación manual del servicio después de una interrupción controlada.

## P3. Evaluación del rendimiento de CPU

**Objetivo:** Medir la utilización del procesador antes y durante una carga de trabajo controlada.

**Herramientas:** `stress-ng` y `mpstat`.

**Configuración:**
- 2 CPU virtuales.
- 1 trabajador de CPU.
- 60 segundos de carga.

| Indicador | Resultado |
|---|---:|
| CPU utilizada en reposo | 0,78 % |
| CPU utilizada durante la carga | 43,06 % |
| Incremento | 42,28 puntos porcentuales |
| Operaciones realizadas | 138 453 |
| Ejecuciones fallidas | 0 |

**Conclusión:** Se observó un incremento medible en la utilización del procesador durante la carga controlada, sin fallos reportados por `stress-ng`.

## P4. Respaldo y restauración de información

**Objetivo:** Comprobar que los archivos empresariales pueden recuperarse después de una eliminación controlada.

**Procedimiento:**
- Se creó el archivo `prueba_respaldo.txt`.
- Se generó una copia mediante `rsync`.
- Se comparó el archivo original con su respaldo mediante `cmp`.
- Se eliminó el archivo de prueba del directorio original.
- Se restauró utilizando `cp -a`.
- Se verificó el contenido recuperado.

**Resultado:** RESPALDO VERIFICADO. El archivo fue restaurado y su contenido pudo leerse correctamente.

**Conclusión:** El mecanismo permitió recuperar información desde una copia local.

## Verificación adicional: respaldos programados

Se utilizó `cron` para ejecutar respaldos mediante `rsync`. Los registros mostraron ejecuciones automáticas y se verificó el archivo `prueba_cron.txt` en el destino.

La configuración final quedó programada diariamente a las 02:00 según la zona horaria del servidor.

## Limitaciones

- Las pruebas se realizaron en un entorno virtualizado de laboratorio.
- La recuperación de Samba fue manual, no automática.
- Los respaldos permanecen en el mismo servidor.
- La sincronización con `rsync -a` no conserva versiones históricas.
- Los resultados no representan una prueba de producción con 20 usuarios simultáneos.
