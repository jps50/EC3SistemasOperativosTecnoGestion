# EC3 - Sistemas Operativos | TecnoGestión S.A.C.

## Descripción
Diseño, implementación y evaluación de una arquitectura de servicios virtualizados basada en Ubuntu Server para la administración segura de archivos empresariales.

TecnoGestión S.A.C. es una organización ficticia utilizada como caso de estudio académico.

## Objetivo
Implementar y evaluar una infraestructura virtualizada que integre control de accesos, compartición de archivos, administración remota, seguridad de red, monitoreo y respaldos automatizados.

## Tecnologías utilizadas
- Oracle VirtualBox
- Ubuntu Server 26.04.1 LTS
- Samba
- OpenSSH
- UFW
- rsync y cron
- stress-ng y sysstat
- Windows PowerShell

## Arquitectura
- Equipo anfitrión: Windows con VirtualBox.
- Máquina virtual: SERVIDOR-EC3.
- Adaptador NAT: 10.0.2.15.
- Adaptador solo-anfitrión: 192.168.56.101.
- Archivos empresariales: /srv/empresa/.
- Respaldos: /var/backups/empresa/.

## Pruebas realizadas
- P1: control de usuarios, grupos y permisos.
- P2: interrupción y recuperación manual de Samba.
- P3: evaluación de CPU con stress-ng y mpstat.
- P4: respaldo y restauración de archivos.

## Resultados destacados
- Integración funcional entre Windows y Samba.
- Restricción de acceso a usuarios no autorizados.
- Utilización promedio de CPU de 0,78 % en reposo y 43,06 % bajo carga.
- Recuperación de archivos desde una copia local.
- Ejecución automática de rsync mediante cron comprobada.

## Estructura del repositorio
- arquitectura/: diseño del sistema.
- configuraciones/: documentación de servicios y permisos.
- scripts/: scripts complementarios de automatización.
- pruebas/: metodología y resultados.
- evidencias/: capturas reales de la implementación.

## Limitaciones
El prototipo se implementó en un laboratorio virtual. Los respaldos permanecen en el mismo servidor y la recuperación de Samba se realizó manualmente. No se ha validado la operación con veinte usuarios simultáneos.

## Uso académico
Proyecto de Evaluación Continua 3 del curso Sistemas Operativos. Universidad Científica del Sur.
