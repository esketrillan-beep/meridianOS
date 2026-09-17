# Meridian OS — estructura del repositorio

Crea un repo nuevo (`meridian-os`) con esta estructura. Cranberry OS queda
intacto en su propio repo.

```
meridian-os/
│
├── .github/
│   └── workflows/
│       └── build-meridian.yml          ← workflow principal
│
├── files/
│   │
│   ├── etc/
│   │   ├── os-release                  ← identidad del sistema
│   │   ├── lsb-release                 ← identidad (formato LSB)
│   │   ├── issue                       ← texto del login en consola
│   │   │
│   │   └── calamares/
│   │       └── branding/
│   │           └── meridian/
│   │               ├── branding.desc   ← marca del instalador
│   │               ├── show.qml        ← diapositivas durante instalación
│   │               ├── logo.png        ← 180x180 px  (TÚ lo pones)
│   │               └── welcome.png     ← 360x200 px  (TÚ lo pones)
│   │
│   ├── usr/
│   │   ├── local/
│   │   │   └── bin/
│   │   │       └── meridian-welcome    ← app de bienvenida (GTK)
│   │   │
│   │   └── share/
│   │       ├── backgrounds/
│   │       │   └── meridian-wallpaper.jpg   ← 1920x1080 (TÚ lo pones)
│   │       │
│   │       └── applications/
│   │           ├── meridian-install.desktop
│   │           └── meridian-welcome.desktop
│
└── README.md
```

## Archivos que tienes que crear tú

| Archivo | Tamaño sugerido | Para qué |
|---|---|---|
| `logo.png` | 180×180 px, fondo transparente | Icono del instalador |
| `welcome.png` | 360×200 px | Cabecera del instalador |
| `meridian-wallpaper.jpg` | 1920×1080 px | Fondo del escritorio |

---

## Los dos `.desktop`

**`files/usr/share/applications/meridian-install.desktop`**

```ini
[Desktop Entry]
Type=Application
Name=Instalar Meridian OS
Name[en]=Install Meridian OS
Comment=Copia Meridian OS a tu disco duro
Exec=pkexec calamares
Icon=/etc/calamares/branding/meridian/logo.png
Terminal=false
Categories=System;
Keywords=instalar;install;calamares;
```

**`files/usr/share/applications/meridian-welcome.desktop`**

```ini
[Desktop Entry]
Type=Application
Name=Bienvenido a Meridian OS
Name[en]=Welcome to Meridian OS
Comment=Primeros pasos con Meridian OS
Exec=/usr/local/bin/meridian-welcome
Icon=/etc/calamares/branding/meridian/logo.png
Terminal=false
Categories=System;
X-GNOME-Autostart-enabled=true
```

---

## `files/etc/lsb-release`

```
DISTRIB_ID=Meridian
DISTRIB_RELEASE=1.0
DISTRIB_CODENAME=vanguard
DISTRIB_DESCRIPTION="Meridian OS 1.0 Vanguard"
```

---

## `files/etc/issue`

```
Meridian OS 1.0 Vanguard \n \l

```

---

## Qué cambia respecto a Cranberry OS

| | Cranberry OS | Meridian OS |
|---|---|---|
| Entorno de construcción | Runner Ubuntu (live-build 3.0~a57, de 2012) | Contenedor Debian bookworm (live-build moderno) |
| Parches manuales | 3 hacks (gfxboot, isolinux.bin, módulos .c32) | Ninguno — funciona de fábrica |
| Arranque | Solo BIOS | BIOS + UEFI (`iso-hybrid`) |
| Inicio de sesión | Consola + `startx` manual | LightDM gráfico automático |
| Escritorio | IceWM / shell HTML | XFCE completo |
| Instalador | whiptail en terminal | Calamares gráfico |
| Aplicaciones | Firefox, PCManFM | + LibreOffice, Thunderbird, GIMP, KeePassXC, Remmina, impresión |
| Tamaño ISO estimado | ~310 MB | ~2.5–3 GB |

El cambio más importante es el primero: construir dentro de un contenedor
Debian elimina de raíz todos los parches que tuvimos que inventar en
Cranberry, porque el live-build de Debian sí trae los binarios de arranque
y el soporte UEFI que el fork antiguo de Ubuntu no tenía.

## Ojo con esto

- El primer build va a tardar bastante más (~15–25 min) y la ISO pesa
  varios GB por LibreOffice y Thunderbird. Si prefieres algo más liviano,
  quita `libreoffice` y `gimp` de `20-apps.list.chroot`.
- Prueba la VM con **4 GB de RAM mínimo** y arranque **EFI activado**
  (Configuración → Sistema → Habilitar EFI) para verificar ese camino.
- Contraseña de root en la sesión live: `meridian`.
- Calamares se lanza con `pkexec` (pide permiso gráficamente); si diera
  problemas de permisos en la sesión live, se resuelve con una regla de
  polkit — avísame y te la paso.
