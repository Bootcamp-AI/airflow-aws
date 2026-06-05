#!/bin/bash

export AIRFLOW_HOME=~/airflow

# Copiar DAGs del repo al home de airflow
mkdir -p ~/airflow/dags
cp -r ./dags/. ~/airflow/dags/ 2>/dev/null || true

echo "🚀 Iniciando Airflow standalone..."
airflow standalone