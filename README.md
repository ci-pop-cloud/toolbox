# toolbox

## TL;DR

```bash
docker run --rm -d --name controller \
  -v $(pwd)/ansible/playbooks:/ansible/playbooks \
  ghcr.io/pop-cloud/ansible-controller \
  tail -f /dev/null
  
docker exec -it controller sh
cd /ansible/playbooks/
ansible -i inventory.txt -m ping target*

alias docker-container='docker ps --format "table {{.ID}}  {{.Names}}\t{{.Image}}\t{{.Command}}\t{{.Ports}}\t{{.Networks}}"'
alias docker-container-all='docker ps -a --format "table {{.ID}}  {{.Names}}\t{{.Image}}\t{{.Networks}}\t{{.Status}}"'

```

## SSH enabled Host

```bash
docker build \
  -f sshd-host/sshd-alpine.dockerfile \
  -t ghcr.io/pop-cloud/sshd-host-alpine \
  ./sshd-host/

docker push ghcr.io/pop-cloud/sshd-host-alpine

docker run --rm -d --name host-1 ghcr.io/pop-cloud/sshd-host-alpine
docker run --rm -d --name host-1 ghcr.io/pop-cloud/sshd-host-alpine

docker inspect alpine-host-1|grep -i \"ipaddress\":
# "IPAddress": "172.17.0.3",
```

## Network Tool

docker run -d --name network-tool praqma/network-multitool:alpine-extra
docker exec -it network-tool  bash 
ssh 172.17.0.3

## Ansible

```bash
docker \
  build -f ./ansible/controller.dockerfile \
  --build-arg ANSIBLE_VERSION=2.9.4 \
  -t          ghcr.io/pop-cloud/ansible-controller \
  ./ansible

docker push ghcr.io/pop-cloud/ansible-controller

docker run --rm -d --name controller \
  -v $(pwd)/ansible/playbooks:/ansible/playbooks \
  ghcr.io/pop-cloud/ansible-controller \
  tail -f /dev/null

docker exec -it controller sh
cd /ansible/playbooks/
ansible -i inventory.txt -m ping target*
```
