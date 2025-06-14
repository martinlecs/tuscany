# Tuscany
A hands-on guide to setting up a local, operations-ready Kubernetes cluster for new devs.

<img src="assets/logo.png" width="100">

----

## Principles
- Teach the fundamentals, not the frameworks.
- Focus on high-level thinking, not muscle memory.
- Apply theory by exploring real-world scenarios.

## Lab goals

- Start cluster
- Open dashboard
- Explain what is going on (ingress/gateway, TLS, reverse-proxy)
- Inspect these elements and review in details.
- Scenarios: opentelemetry example.
- multi-tenancy
- Common routines: go through each and explain how it works.

- Create a single node `kind` cluster
- Setup basic monitoring with helm charts
- Intro to Grafana + Prometheus
- Intro to API testing with Postman + Newman
- Deploy [Kubernetes Dashboard](https://github.com/kubernetes/dashboard) and view it through your browser
- Deploy a simple uptime dashboard

https://kubernetes.io/docs/concepts/security/multi-tenancy/#virtual-control-plane-per-tenant

----

## Please check that you have

- A working [Docker environment](https://docs.docker.com/engine/).
- [DevPod CLI](https://devpod.sh/docs/getting-started/install#install-devpod-cli) is installed.

To setup and check that your environment is ready for this lab:
```
make setup
```

## To start your local cluster

```
make start
```

## To start your local cluster

```
    docker cp tuscany-caddy-reverse-proxy-1:/data/caddy/pki/authorities/local/root.crt root.crt; certutil -addstore -f "ROOT" root.crt ; rm root.crt

    docker compose exec -w /etc/caddy caddy-reverse-proxy caddy reload
```