# HCI workstand management routine

## Demostands management routine
```bash
# Inject SSH access keys:
$ ssh-copy-id -i ~/.ssh/workstand.pub root@<ip-address>

# To do plain setup of the workstand:
$ ansible-playbook -i ~/hosts workstand.setup.yaml

# To update existing workstand:
$ ansible-playbook -i ~/hosts workstand.update.yaml
```

## Hacking
```bash
# To verify changes with linter:
$ ansible-lint workstand.update.yaml
```
