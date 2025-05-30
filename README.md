# Ubuntu Packer Template for vSphere

This repository contains Packer templates to create a pre-configured Ubuntu VM image for vSphere, using the `vsphere-iso` builder.

## 💡 Features
- Automated Ubuntu Server installation via cloud-init
- SSH access enabled
- Nginx pre-installed
- Firewall configured (22, 80, 443)
- Converts VM to a template on completion

## 🛠 Requirements

- [Packer](https://developer.hashicorp.com/packer)
- Access to a vSphere environment and vcenter
- Ubuntu ISO accessible to the hypervisor

## 🚀 Usage

### 1. Clone the repo

```bash
git clone https://github.com/ahmadpiran/packer-vsphere-ubuntu2404
cd packer-vsphere-ubuntu2404
````

### 2. Customize variables

Edit `variables.pkr.hcl` or override via environment variables.

### 3. Run Packer

```bash
packer init .
packer validate .
packer build .
```

## 📂 File Structure

* `ubuntu-template.pkr.hcl` — Main Packer build config
* `variables.pkr.hcl` — Variable definitions
* `http/user-data` — Cloud-init file

## 📝 Notes

* Ensure the `http` directory is served correctly by Packer.
* Make sure the ISO path and network names match those in your vSphere setup.
* You may want to encrypt sensitive variables using a secrets manager or environment overrides.

## 📄 License

MIT