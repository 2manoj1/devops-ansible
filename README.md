# GitHub Actions and Ansible Setup

This repository demonstrates how to use **GitHub Actions** and **Ansible** to automate the setup process for a remote server.

## GitHub Actions

The workflow in `.github/workflows/run_setup.yml` triggers the `setup.sh` script located in the `scripts/` directory when code is pushed to the `main` branch. This script can be executed on a remote server through SSH.

### Setting Up GitHub Secrets

For security purposes, the following sensitive information is stored as **GitHub Secrets**:

- **`SSH_PRIVATE_KEY`**: The SSH private key for authenticating with your server.
- **`SSH_USER`**: The SSH username (e.g., `ubuntu` or `ec2-user`).
- **`SSH_HOST`**: The SSH hostname (e.g., `ec2-35-173-181-253.compute-1.amazonaws.com`).

To add these secrets to your repository:
1. Go to **Settings** > **Secrets and Variables** > **Actions** in your GitHub repository.
2. Add the following secrets:
   - `SSH_PRIVATE_KEY`: Paste the content of your SSH private key.
   - `SSH_USER`: Set this to your SSH username (e.g., `ubuntu` or `ec2-user`).
   - `SSH_HOST`: Set this to your SSH hostname or IP address.

### How It Works

1. **GitHub Actions**: 
   - The GitHub Actions workflow is triggered when changes are pushed to the `main` branch. It sets up SSH authentication using the secrets stored in GitHub and then runs the `setup.sh` script on a remote server.
   
2. **Ansible Playbook**:
   - The Ansible playbook in `ansible/playbook.yml` copies the `setup.sh` script from the repository to the remote server and executes it.
   - Ansible uses the SSH credentials (user, hostname, and private key) from the environment variables set by GitHub Actions.

## Repository Structure

<img width="726" alt="Screenshot 2025-03-14 at 4 27 20 PM" src="https://github.com/user-attachments/assets/2dd67f9e-b0c3-4523-99fa-3afd34b5af03" />

## Running the Setup

### GitHub Actions

The GitHub Actions workflow will automatically trigger when you push to the `main` branch. It will:
- Set up SSH authentication using the private key, username, and hostname stored in GitHub Secrets.
- Copy the `setup.sh` script from the `scripts/` directory to the remote server.
- Execute the `setup.sh` script on the remote server.

### Ansible (Manual Execution)

If you prefer to run the setup manually with Ansible, you can follow these steps:

Run the following command to execute the Ansible playbook:

```bash
ansible-playbook -i your_ssh_host_name, ansible/playbook.yml --private-key /path/to/private_key.pem --user your_ssh_user
```
This will trigger the setup process on your remote server using the setup.sh script

