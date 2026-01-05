# Imagen base con Python 3.12 y uv preinstalado
FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim

# Evita que Python genere archivos .pyc y fuerza salida de logs
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Directorio de trabajo
WORKDIR /app

# Instala dependencias y borra caché de apt
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Instalación de dependencias
COPY pyproject.toml .
RUN uv pip install --system .

# Expone el puerto de Jupyter
EXPOSE 8888

# Comando para iniciar JupyterLab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
