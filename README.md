# Ansible Dev Env
## An attempt at a quick development environment for ansible configuration

## Sample usage:

```
. bin/activate
docker-compose up -d
ansible  all -i inventory/sample -m ping
```

