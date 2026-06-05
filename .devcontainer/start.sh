#!/bin/bash
sleep 5
export AIRFLOW_HOME=~/airflow
mkdir -p ~/airflow/dags
cp -r ./dags/. ~/airflow/dags/ 2>/dev/null || true

echo "🚀 Iniciando Airflow..."
airflow standalone >> ~/airflow/airflow.log 2>&1