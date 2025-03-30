# Infra

Infrastructure orchestration.

Deployed on k3s.

Make sure you disable Traefik _while_ installing, we'll use Nginx instead.

Install Nginx.

Install Cert Manager if not present.

Install Tailscale's [Kubernetes Operator](https://tailscale.com/kb/1236/kubernetes-operator).

To set up, run:

```sh
make bootstrap
```

Deploy everything else by running:

```sh
make deploy
```

Patch to apply some miscellaneous fixes post hoc:

```sh
make patch
```
