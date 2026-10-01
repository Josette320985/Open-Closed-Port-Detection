# Practice: Open/Closed Port Detection

This practice contains two equivalent implementations of a script that

takes a port as an argument and checks whether it is open or closed:

1. **PracticaDockerLinux** → Bash script executed inside an Ubuntu container (Docker)

2. **PracticaPowerShell** → PowerShell script executed directly on Windows

## Folder structure

C:\Users\naher\Documents\

├── PracticaDockerLinux\

│   └── check_[port.sh](http://port.sh)          # Linux script

└── PracticaPowerShell\

    └── Check-Port.ps1         # PowerShell script

## Prerequisites

### For PracticaDockerLinux

- Docker Desktop installed and running on Windows

- Internet connection (to download the Ubuntu image and netcat)

### For PracticaPowerShell

- Windows 10 or 11

- PowerShell (preinstalled)

## Part 1: PracticaDockerLinux

### Step 1: Open PowerShell and navigate to the folder

```powershell

cd C:\Users\naher\Documents\PracticaDockerLinux

```

### Step 2: Launch the Ubuntu container with a shared volume

```powershell

docker run -it -v ${PWD}:/work ubuntu /bin/bash

```

This mounts the current Windows folder inside the container at `/work`,

so the script is saved directly on Windows.

### Step 3: Install netcat inside the container

```bash

apt update && apt install -y netcat-openbsd

```

### Step 4: Go to the shared folder

```bash

cd /work

```

### Step 5: Grant execution permissions to the script

```bash

chmod +x check_[port.sh](http://port.sh)

```

### Step 6: Run the script

**Syntax:**

```bash

./check_[port.sh](http://port.sh) <port> [host]

```

- `port` (required) → port number to check

- `host` (optional) → defaults to `localhost`

**Examples:**

```bash

# Closed local port

./check_[port.sh](http://port.sh) 9999

# Open remote port (Google HTTPS)

./check_[port.sh](http://port.sh) 443 [google.com](http://google.com)

```

**Expected output:**

```

The port 9999 on [localhost](http://localhost) is CLOSED

The port 443 on [google.com](http://google.com) is OPEN

```

### Step 7: Exit the container

```bash

exit

```

---

## Part 2: PracticaPowerShell

### Step 1: Open PowerShell as administrator

Press `Win + X` and select **"Windows PowerShell (Admin)"** or **"Terminal (Admin)"**.

### Step 2: Check the execution policy

```powershell

Get-ExecutionPolicy

```

If the result is `Restricted`, change it with:

```powershell

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

```

Answer `Y` when prompted.

### Step 3: Navigate to the script's folder

```powershell

cd C:\Users\naher\Documents\PracticaPowerShell

```

### Step 4: Run the script

**Syntax:**

```powershell

.\Check-Port.ps1 -Port <port> [-ComputerName <host>]

```

- `-Port` (required) → port number to check

- `-ComputerName` (optional) → defaults to `localhost`

**Examples:**

```powershell

# Local port probably open

.\Check-Port.ps1 -Port 445

# Local port probably closed

.\Check-Port.ps1 -Port 9999

# Open remote port (Google HTTPS)

.\Check-Port.ps1 -Port 443 -ComputerName "[google.com](http://google.com)"

```

**Expected output:**

```

The port 445 on [localhost](http://localhost) is OPEN

The port 9999 on [localhost](http://localhost) is CLOSED

The port 443 on [google.com](http://google.com) is OPEN

```
