### Local Containers

A bunch of docker container config and helm charts for k8s. Could be useful when doing local development.

#### How to start with Docker
Install Docker, Start It and then do the following to run all tools.
```shell
cd docker
docker-compose --profile all up -d
```

### How to Install K8s
I have switched from minikube to microk8s and now to colima.
Here is how you can start with K8s

```shell
brew install colima
brew install kubectl

colima start --runtime containerd --with-kubernetes \
--network-address --cpu 2 --memory 8 --disk 20 \
--kubernetes-disable=coredns --edit


```

I update the NodePort range to 5000-32767 so most of the services can run in their default ports.

The relevant section of the config file that is presented in edit mode when running colima with --edit option

```yaml
kubernetes:
   # Enable kubernetes.
   # Default: false
   enabled: true

   # Kubernetes version to use.
   # This needs to exactly match a k3s version https://github.com/k3s-io/k3s/releases
   # Default: latest stable release
   version: v1.29.0+k3s1

   # Additional args to pass to k3s https://docs.k3s.io/cli/server
   # Default: traefik is disabled
   k3sArgs:
     - --disable=traefik
     - --service-node-port-range=5000-32767
 ```
Full file is included as [conf/k3s-config.yaml](./conf/k3s-config.yaml)

This should allow you to edit k3s config before starting it. K3s should start and your kube config file should be configured
automatically so you can verify with some kubectl command next.

You can also manually copy the kube config file.

```
scp colima:/etc/rancher/k3s/k3s.yaml ~/.kube/config
```

```
kubectl get pods --all-namespaces
```

#### How to start with K8s
With the running Kubernetes, have it running and then run

```
./install.k8s.sh
```

In doing so, a cassandra, kafka, postgres and airflow instance should be created.
They are all deployed using LoadBalancer service type so you should be able to access the services on ports
9042, 9092, 5432 and 8280 respectively. 

To check the host IP, you can run ```colima status``` or ```colima list```

Go ahead and update your /etc/hosts file with something like this to access via DNS when doing local development.
Mine is 192.168.106.2 and I updated my hosts file with the below
```
192.168.106.2   airflow.dev.local kafka.dev.local cassandra.dev.local postgres.dev.local
```

### Uninstall
Remove all charts, stop colima and delete profile.
```
./uninstall.k8s.sh
colima stop
colima delete
```
