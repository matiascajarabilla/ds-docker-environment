# ds-docker-environment
## **Entorno de desarrollo para ciencias de datos**

Este repositorio contiene la configuración para un entorno de desarrollo de ciencia de datos basado en Docker, utilizando JupyterLab y `uv` para la gestión de dependencias de Python.

## Requisitos

1. **Servidor Debian**
   
2. **Docker**
   
   ```bash
    sudo apt update
    sudo apt install -y ca-certificates curl gnupg

    # Añadir la llave GPG oficial de Docker
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg

    # Añadir el repositorio a las fuentes de Apt
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Instalar Docker y Docker Compose
    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    ```
    **Configuración de permisos**

    ```bash
    sudo usermod -aG docker $USER
    ```
    Reinicia la sesión (sal y vuelve a entrar por SSH) para que esto surta efecto.

3. **Git**
   ```bash
   sudo apt install git
   ```

4. **`uv`**
    ```bash
    curl -LsSf https://astral.sh/uv/install.sh | sh
    # Recarga el shell para empezar a usarlo
    source $HOME/.cargo/env
    ```


## Configuración

1. Clonar el repositorio
    ```bash
    git clone https://github.com/matiascajarabilla/ds-docker-environment.git
    ```

2. **Crear archivo `.env`:**

    ```bash
    touch .env
    ```

    Con el siguiente contenido:

    ```
    JUPYTER_TOKEN=tu_token_secreto
    ```

    Reemplazar `tu_token_secreto` con una contraseña segura de tu elección. Este token se utilizará para acceder a tu instancia de JupyterLab.

## Composición del contenedor

1.  **Construir la Imagen de Docker:**
    Abrir una terminal en el directorio del proyecto y ejecutar el siguiente comando para construir la imagen de Docker:

    ```bash
    docker-compose build
    ```
    Este comando descargará las imágenes base necesarias e instalará las dependencias de Python definidas en `pyproject.toml`.

2.  **Iniciar el Contenedor de Desarrollo:**
    Una vez que la imagen se haya construido, iniciar el contenedor con el siguiente comando:

    ```bash
    docker-compose up
    ```
    Esto iniciará el servicio de JupyterLab. Verás un mensaje en la terminal con la URL para acceder a JupyterLab en tu navegador (usualmente `http://127.0.0.1:8888/?token=tu_token_secreto`).

    Para detener el contenedor, presionar `Ctrl+C` en la terminal donde `docker-compose up` se está ejecutando. Para detenerlo y eliminar los contenedores (pero no las imágenes), usar:

    ```bash
    docker-compose down
    ```
## Ejecuc ~~ión~~

## Modificación de dependencias

Para añadir, actualizar o eliminar dependencias de Python en tu entorno:

1.  Editra el archivo `pyproject.toml` en la sección `[project.dependencies]`.
2.  Después de modificar `pyproject.toml`, reconstruir la imagen de Docker para que los cambios surtan efecto:

    ```bash
    docker-compose build
    ```
3.  Iniciar el contenedor:

    ```bash
    docker-compose up
    ```
