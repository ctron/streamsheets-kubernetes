# Eclipse Streamsheets™ Chart

[Eclipse Streamsheets](https://eclipse.org/streamsheets) is:

> With Eclipse Streamsheets™ the everyday technical or business end user can create stream processing applications just by using their existing spreadsheet knowledge …

## Quick start

    helm install streamsheets --repo https://ctron.github.io/helm-charts streamsheets --set ingress.domain=.apps.my.cluster

## Pre-requisites

* Kubernetes 1.19+
* Helm 3+
* Persistent volumes

## Installing

You can deploy this to Kubernetes like this:

    helm install streamsheets --repo https://ctron.github.io/helm-charts streamsheets --set ingress.domain=.apps.my.cluster

For OpenShift, there is an out-of-the-box profile to use:

    helm install streamsheets --repo https://ctron.github.io/helm-charts streamsheets -f https://raw.githubusercontent.com/ctron/streamsheets-kubernetes/main/charts/streamsheets/profiles/openshift.yaml --set ingress.domain=.apps.my.cluster

## Uninstalling

    helm uninstall my-streamsheets

NOTE: Helm will not uninstall the persistent volume claims. You need to remove them manually.

