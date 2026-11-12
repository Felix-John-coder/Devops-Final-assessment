
## System Scripts

### System Information

Run:

```bash
./scripts/sysinfo.sh
```

Displays:
- Current user and effective UID
- Hostname and kernel release
- System date
- Disk usage
- Memory usage
- Docker daemon status

### Application Healthcheck

Run with the default URL:

```bash
./scripts/healthcheck.sh
```

Or provide a custom URL:

```bash
./scripts/healthcheck.sh http://localhost:8080/healthz
```

Successful output:

```text
Checking application: http://localhost:8080
Healthcheck passed: HTTP 200
```

Failed output:

```text
Checking application: http://localhost:8080
Healthcheck failed: Unable to reach http://localhost:8080
```
