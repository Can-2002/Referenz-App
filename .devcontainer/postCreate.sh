#!/usr/bin/env bash

# Stoppt das Skript sofort, wenn ein Befehl fehlschlägt.
set -e

echo "Starte postCreate.sh für ReferenzApp..."

# pip aktualisieren.
python -m pip install --upgrade pip setuptools wheel

# App-Abhängigkeiten installieren, falls requirements.txt vorhanden ist.
if [ -f "requirements.txt" ]; then
    echo "Installiere App-Abhängigkeiten aus requirements.txt..."
    pip install -r requirements.txt
else
    echo "Keine requirements.txt gefunden."
fi

# Entwickler-Abhängigkeiten installieren, falls requirements-dev.txt vorhanden ist.
if [ -f "requirements-dev.txt" ]; then
    echo "Installiere Entwickler-Abhängigkeiten aus requirements-dev.txt..."
    pip install -r requirements-dev.txt
else
    echo "Keine requirements-dev.txt gefunden."
fi

echo "Codespace wurde erfolgreich vorbereitet."
