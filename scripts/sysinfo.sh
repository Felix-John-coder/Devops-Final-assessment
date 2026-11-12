
#!/bin/sh

echo "System Information"

echo "Current User: $(id -un)"
echo "Effective UID: $(id -u)"

echo "Hostname: $(hostname)"
echo "Kernel: $(uname -r)"

echo "Date: $(date '+%Y-%m-%dT%H:%M:%S%z')"

echo "Disk Usage:"
df -h

echo "Memory Usage:"
if command -v free >/dev/null 2>&1; then
    free -h
else
    grep -E '^(MemTotal|MemAvailable|MemFree|SwapTotal|SwapFree):' /proc/meminfo
fi

echo "Docker Status:"
if ! command -v docker >/dev/null 2>&1; then
    echo "Docker is not installed"
elif docker info >/dev/null 2>&1; then
    echo "Docker daemon is running"
else
    echo "Docker daemon is not running or accessible"
fi