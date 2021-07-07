# Eclipse Streamsheets deployment for Kubernetes

This repository contains a set of scripts that will allow you to deploy Eclipse Streamsheets on Kubernetes.

Eclipse Streamsheets:

> With Eclipse Streamsheets™ the everyday technical or business end user can create stream processing applications just by using their existing spreadsheet knowledge …

## Rationale

Eclipse Streamsheets is an awesome tool. However, the only container image provided is a single, all-in-one image,
which actually installs this on your local machine. This model doesn't work at all for Kubernetes.

Also people found it hard to understand what exactly needs to be deployed and how it needs to be wired up: https://github.com/eclipse/streamsheets/issues/43

This repository provides:

* Scripts to build proper containers, containing the different services independently.
* A Helm chart, which deploys Streamsheets and its dependencies (MongoDB, Redis, …) and allows to configure those
  deployments. Re-using existing Helm charts in the process.
* Modifications to the Streamsheets code, to iron out a few glitches.

  The goal is to bring those changes back upstream into Streamsheets. As long as these changes are missing, you can
  see the branch of changes here: https://github.com/ctron/streamsheets/tree/release/2.3

## Requirements

You will need a Kubernetes cluster with support for [Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/).
Minikube with the `ingress` addon will work, as will OpenShift using Routes for Ingress.

When deploying, you need to specify the base application domain, which will be used to construct the final hostname.
This can be done using the parameter `ingress.domain`.

## Deploying

You can deploy this to Kubernetes like this:

    helm install streamsheets --repo https://ctron.github.io/helm-charts streamsheets --set ingress.domain=.apps.my.cluster

For OpenShift, there is an out-of-the-box profile to use:

    helm install streamsheets --repo https://ctron.github.io/helm-charts streamsheets -f charts/streamsheets/profiles/openshift.yaml --set ingress.domain=.apps.my.cluster

