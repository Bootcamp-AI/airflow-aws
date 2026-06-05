#!/bin/bash
set -e

echo "📦 Instalando Apache Airflow..."

export AIRFLOW_HOME=~/airflow
AIRFLOW_VERSION=2.9.0
PYTHON_VERSION="$(python --version | cut -d ' ' -f 2 | cut -d '.' -f 1-2)"
CONSTRAINT_URL="https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt"

pip install "apache-airflow==${AIRFLOW_VERSION}" --constraint "${CONSTRAINT_URL}" -q

echo "🗄️ Inicializando base de datos..."
airflow db migrate

echo "👤 Creando usuario admin..."
airflow users create \
  --username admin \
  --password admin \
  --firstname Admin \
  --lastname User \
  --role Admin \
  --email admin@example.com

echo "✅ Setup completo. Airflow listo."