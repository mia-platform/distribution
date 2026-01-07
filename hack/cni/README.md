# Cilium update

To update the cilium module some manual actions are required, we take the main configuration and setup
of the deployments/daemonsets from their official helm charts with some pre configured values.

You can run the `script.sh` file inside this folder for generating the files with all the resources
running the script first without parameters, and then with the new version as parameter; for example:

```sh
hack/cni/script.sh
hack/cni/script.sh <new-version>
```

After this you can compare the various files with their previous versions and get what is changed.  
At the end when you push your changes remember to update the default version inside the script with
the new ones you have used in the second command.
