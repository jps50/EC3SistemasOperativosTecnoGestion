# Configuraciones del sistema

Esta carpeta documenta las configuraciones implementadas en el servidor virtualizado Ubuntu Server de TecnoGestión S.A.C.

## 1. Administración de usuarios y grupos

Se crearon cuatro grupos empresariales:

- `administracion`
- `contabilidad`
- `ventas`
- `soporte`

Se configuraron cuatro cuentas de prueba: `usuario_admin`, `usuario_conta`, `usuario_ventas` y `usuario_soporte`.

Cada usuario fue asignado al grupo correspondiente a su departamento.

## 2. Permisos de directorios

Las carpetas empresariales están ubicadas en `/srv/empresa/`.

Se utilizaron los comandos `chown` y `chmod 2770` para restringir los accesos según los grupos.

## 3. Servidor Samba

Se configuró el recurso compartido `Contabilidad` para permitir el acceso autenticado desde Windows.

El servicio fue verificado mediante `systemctl` y `testparm`.

## 4. Firewall UFW

Se establecieron políticas para denegar conexiones entrantes no autorizadas y permitir las conexiones necesarias de SSH y Samba.

## 5. Administración remota

Se habilitó OpenSSH y se comprobó la conexión desde Windows PowerShell hacia Ubuntu Server mediante la red privada de VirtualBox.

## 6. Respaldos automáticos

Se utilizó `rsync` para respaldar los archivos empresariales y `cron` para programar su ejecución diaria.
