# ds-docker-environment
Entorno de desarrollo para ciencias de datos

Este repositorio contiene la configuración para un entorno de desarrollo de ciencia de datos basado en Docker, utilizando JupyterLab y `uv` para la gestión de dependencias de Python.

## Configuración Inicial

1.  **Crear archivo `.env`:**
    Crea un archivo llamado `.env` en la raíz de este proyecto con el siguiente contenido:

    ```
    JUPYTER_TOKEN=tu_token_secreto
    ```
    Reemplaza `tu_token_secreto` con una contraseña segura de tu elección. Este token se utilizará para acceder a tu instancia de JupyterLab.

## Uso

1.  **Construir la Imagen de Docker:**
    Abre una terminal en el directorio raíz de este proyecto y ejecuta el siguiente comando para construir la imagen de Docker:

    ```bash
    docker-compose build
    ```
    Este comando descargará las imágenes base necesarias e instalará las dependencias de Python definidas en `pyproject.toml`.

2.  **Iniciar el Contenedor de Desarrollo:**
    Una vez que la imagen se haya construido, puedes iniciar el contenedor con el siguiente comando:

    ```bash
    docker-compose up
    ```
    Esto iniciará el servicio de JupyterLab. Verás un mensaje en la terminal con la URL para acceder a JupyterLab en tu navegador (usualmente `http://127.0.0.1:8888/?token=...`).

    Para detener el contenedor, presiona `Ctrl+C` en la terminal donde `docker-compose up` se está ejecutando. Para detenerlo y eliminar los contenedores (pero no las imágenes), usa:

    ```bash
    docker-compose down
    ```

## Modificar Dependencias

Para añadir, actualizar o eliminar dependencias de Python en tu entorno:

1.  Edita el archivo `pyproject.toml` en la sección `[project.dependencies]`.
2.  Después de modificar `pyproject.toml`, reconstruye la imagen de Docker para que los cambios surtan efecto:

    ```bash
    docker-compose build
    ```
3.  Vuelve a iniciar tu contenedor de desarrollo:

    ```bash
    docker-compose up
    ```
