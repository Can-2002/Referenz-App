# Python-Devcontainer für GitHub Codespaces und VS Code.
# Grundlage: Python 3.12 auf Debian Bookworm.
FROM mcr.microsoft.com/devcontainers/python:1-3.12-bookworm

# Verhindert, dass Python __pycache__-Ordner erzeugt.
ENV PYTHONDONTWRITEBYTECODE=1

# Sorgt dafür, dass Python-Ausgaben direkt im Terminal erscheinen.
ENV PYTHONUNBUFFERED=1

# Setzt Standard-Encoding für saubere Textverarbeitung.
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

# Installiert nur die wichtigsten Systempakete für den Projektstart.
# sqlite3: lokale Datenbank
# libsqlite3-dev: Entwicklungsdateien für SQLite
# build-essential: Werkzeuge zum Kompilieren von Python-Paketen
# git/curl/wget/unzip: nützliche Entwicklungswerkzeuge
# ca-certificates: sichere HTTPS-Verbindungen
RUN apt-get update && apt-get install -y --no-install-recommends \
    sqlite3 \
    libsqlite3-dev \
    build-essential \
    git \
    curl \
    wget \
    unzip \
    ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Aktualisiert Python-Paketwerkzeuge.
# Die eigentlichen Projektpakete kommen später über requirements.txt
# und requirements-dev.txt in postCreate.sh.
RUN python -m pip install --upgrade pip setuptools wheel

# Standard-Arbeitsordner in Codespaces.
WORKDIR /workspaces

# Standardbenutzer des Devcontainer-Images.
USER vscode