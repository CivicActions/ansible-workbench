# Ansible Dev Env
## An attempt at a quick development environment for ansible configuration

## Sample usage:

```
. bin/activate
workbench-compose up -d
ansible  all -i inventory/sample -m ping
```

**Scale up select nodes, and auto-generate inventory file:**
```
workbench-compose scale debian=5
workbench-inventory > inventory/dev
ansible  all -i inventory/sample -m ping
```

