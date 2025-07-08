from flask import Flask, Response
from prometheus_client import Counter, Histogram, Gauge, generate_latest, CONTENT_TYPE_LATEST
import time
import random
import psutil

app = Flask(__name__)

# Métricas HTTP
REQUEST_COUNT = Counter('http_requests_total', 'Total HTTP Requests', ['method', 'endpoint', 'http_status'])
REQUEST_LATENCY = Histogram('http_request_duration_seconds', 'HTTP Request latency', ['endpoint'])

# Métricas de Saturação do Sistema
CPU_USAGE = Gauge('system_cpu_usage_percent', 'Uso de CPU (%)')
MEM_USAGE = Gauge('system_memory_usage_percent', 'Uso de Memória (%)')
DISK_USAGE = Gauge('system_disk_usage_percent', 'Uso de Disco (%)')

@app.route('/')
def index():
    start = time.time()
    time.sleep(random.uniform(0.05, 0.3))  # Simula carga

    REQUEST_COUNT.labels(method='GET', endpoint='/', http_status='200').inc()
    REQUEST_LATENCY.labels(endpoint='/').observe(time.time() - start)

    return "Olá! Aplicação rodando na porta 80."

@app.route('/metrics')
def metrics():
    # Atualiza métricas de saturação a cada chamada do /metrics
    CPU_USAGE.set(psutil.cpu_percent())
    mem = psutil.virtual_memory()
    MEM_USAGE.set(100 - mem.available * 100 / mem.total)
    disk = psutil.disk_usage('/')
    DISK_USAGE.set(disk.percent)

    return Response(generate_latest(), mimetype=CONTENT_TYPE_LATEST)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)