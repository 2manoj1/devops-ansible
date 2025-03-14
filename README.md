
├── .github/
│   └── workflows/
│       └── run_setup.yml              # GitHub Actions workflow file
│
├── ansible/
│   ├── playbook.yml                   # Ansible playbook to run setup.sh
│   ├── inventory.ini                  # Ansible inventory file
│
├── scripts/
│   └── setup.sh                       # The setup script to run on the local or remote server
└── README.md                          # Documentation for your repository

# My GitHub Actions and Ansible Setup

This repository demonstrates how to use GitHub Actions and Ansible to automate the setup process.

## GitHub Actions

The workflow in `.github/workflows/run_setup.yml` triggers the `setup.sh` script located in the `scripts/` directory when code is pushed to the `main` branch. This script can be executed on a remote server through SSH.

### Setting Up GitHub Secrets

For security purposes, the following sensitive information is stored as **GitHub Secrets**:

- **`SSH_PRIVATE_KEY`**: The SSH private key for authenticating with your server.
- **`SSH_USER`**: The SSH username (e.g., `opc`).
- **`SSH_HOST`**: The SSH hostname (e.g., `instance-20250314-0947`).

To add these secrets to your repository:
1. Go to **Settings** > **Secrets and Variables** > **Actions** in your GitHub repository.
2. Add the following secrets:
   - `SSH_PRIVATE_KEY`: Paste the content of your SSH private key.
   - `SSH_USER`: Set this to your SSH username (e.g., `opc`).
   - `SSH_HOST`: Set this to your SSH hostname or IP address.

### How It Works

1. **GitHub Actions**: 
   - The GitHub Actions workflow is triggered when changes are pushed to the `main` branch. It sets up SSH authentication using the secrets and runs the `setup.sh` script on a remote server.
   
2. **Ansible Playbook**:
   - The Ansible playbook in `ansible/playbook.yml` copies the `setup.sh` script to the remote server and executes it.
   - Ansible uses the SSH credentials (user, hostname, and private key) from the environment variables set by GitHub Actions.

## Running the Setup

### GitHub Actions

The GitHub Actions workflow will automatically trigger when you push to the `main` branch. It will:
- Set up SSH authentication using the private key, username, and hostname stored in GitHub Secrets.
- Execute the `setup.sh` script on the remote server.

### Ansible (Manual Execution)

If you prefer to run the setup manually with Ansible:

1. Make sure the private key, username, and hostname are correctly set up as GitHub secrets (as described above).
2. Run the following command to execute the Ansible playbook:

   ```bash
   ansible-playbook -i ansible/inventory.ini ansible/playbook.yml

