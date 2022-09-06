# Mia-Platform Distribution

This repository contains all the modules, with their flavours, and the add-ons for adding day two operation
capabilities to your Kubernetes clusters.

# Oneliners

## Split multidocument file

```
yq -i '.splitHere = ( .kind + "--" + .metadata.name + ".yaml") ' all.yml
yq -s '.splitHere' all.yml
for file in $(ls directory-with-yamls) ; do yq -i 'del(.splitHere)' $file  ; done
```
## Remove helm labels
```
for file in $(ls crds/* resources/*) ; do yq -i 'del(.metadata.labels."app.kubernetes.io/managed-by")' $file  ; done
for file in $(ls crds/* resources/*) ; do yq -i 'del(.metadata.labels."helm.sh/chart")' $file  ; done
```
