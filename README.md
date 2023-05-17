# Docs

¡Hola! Este repositorio almacena mi configuración de Nvim en Windows10, aquí hay algunos vídeos que me sirvieron mucho cuando empezé con NeoVim:

[Instalación y configuracion en Windows](https://www.youtube.com/watch?v=XBlKG2LW6p4&t=396s)

[Guía para configurar NeoVim desde cero - Temas, plugins y autocompletado](https://www.youtube.com/watch?v=2dG_Nl_r6s0)

[Cómo configurar Vim como VS Code](https://www.youtube.com/watch?v=XgQFzi3VkC8)

## Prerequisitos

Antes de comenzar con la instalación, asegúrate de tener instalado el administrador de paquetes Chocolatey en tu computadora con Windows 10. Si no lo tienes instalado, ¡no te preocupes! Puedes seguir las instrucciones en el sitio web de [Chocolatey](https://chocolatey.org/install) para instalarlo.

1. Escribe el siguiente comando en tu símbolo del sistema para instalar NeoVim a través de Chocolatey:

```powershell
choco install neovim
```

2. Una vez que la instalación esté completa, es hora de verificar que NeoVim esté instalado. Para hacer esto, escribe el siguiente comando en tu símbolo del sistema:

```powershell
nvim --version
```

## Ubicando init.vim
Para configurar NeoVim necesitamos crear una carpeta llamada nvim en la siguiente dirección:
```bash
mkdir C:\Users\Alex\AppData\Local\nvim
```
Ahora en nvim necesitamos copiar los archivos init.vim y coc-settings.json ubicados en este repositorio.

## Vanilla Neovim

Iniciamos la configuración en init.vim modificando los valores predeterminados de NeoVim:

```jsx
set number
set mouse=a
syntax enable
set numberwidth=1
set showcmd
set ruler
set encoding=utf-8
set sw=2
set relativenumber
set laststatus=2
set noshowmode
set splitright

let mapleader=" "
```

## Plugins

- Instalar vim-plug usando su [documentación](https://github.com/junegunn/vim-plug#neovim) para poder descargar los plugins de NeoVim.
- Escribimos `:PlugInstall` en NeoVim para instalar todos los plugins del archivo init.vim.
- Listo! Ahora puedes disfrutar de una mejor experiencia visual en NeoVim.

## CocConfig

Para instalar correctamente el texto predictivo (parecido a Github Copilot) debemos especificar los lenguajes que queremos escribiendo `:CocInstall <lenguaje>` , los que uso yo son:

- coc-tsserver
- coc-html
- coc-css

- coc-go
- coc-json
- coc-markdownlint

## Conclusión

¡Woohoo! ¡Lo lograste! Has instalado correctamente NeoVim en tu computadora con Windows 10 utilizando el administrador de paquetes Chocolatey. Ahora puedes comenzar a usar NeoVim para todas tus necesidades de edición de texto y programación.
