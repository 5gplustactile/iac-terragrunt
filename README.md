# iac-terragrunt

Este repositorio está diseñado para gestionar la infraestructura como código (IaC) utilizando **Terragrunt**.

## Descripción de carpetas principales

- **`config`**: Contiene archivos de configuración global.
- **`eu-west-3/iac`**: Agrupa configuraciones específicas por proyectos, divididas en subcarpetas como:
  - **`demo`**: Configuraciones para una demostración.
  - **`opentwins`**: Configuraciones para proyectos de OpenTwins.
  - **`telefonica`**: Configuraciones específicas para proyectos internos, organizados por componente.
  - **`uma`**: Configuraciones para proyectos relacionados con UMA.

## Uso del repositorio

Sigue estos pasos para trabajar con los archivos de configuración:

1. Dirígete a la carpeta que contiene el archivo `terragrunt.hcl` que deseas utilizar. Por ejemplo:
   ```bash
   $ cd eu-west-3/iac/telefonica/cluster-mgmt
   ```
2. Inicializa el entorno de Terragrunt:
   ```bash
   $ terragrunt init
   ```
3. Verifica los cambios que se aplicarán a la infraestructura:
   ```bash
   $ terragrunt plan
   ```
4. Aplica los cambios:
   ```bash
   $ terragrunt apply
   ```

## Licencia

Este projecto es licenciado bajo [Apache](LICENSE)