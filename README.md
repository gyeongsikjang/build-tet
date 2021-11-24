<h1 align="left">
    <img width="380" src="/gitops.png" />
    <br> gitops ArgoCD
</h1>
<p align="left">
  <a href="https://github.com/JangGyeongSik/build-tet">
      <img width="30" src="https://cloud.withgoogle.com/next/assets/img/cloud.93f2707.png" alt="GCP">
      <br> GKE ArgoCD Demo Guide
  </a>
</p>


## 개요

* build-tet Repository에는 argoCD 구성에 필요한 manifest yaml들이 포함되어 있습니다. 
* 필요에 따라 yaml을 custom 하여 쉽게 구성하실수 있습니다.
* dev,prd Directory에는 argo에 Demo로 Deploy할 yaml들이 존재합니다. 
* 의도한 목적은 GKE에서 argoCD를 사용할때 Ingress를 통해 접근할수 있도록 Deploy하고, blue/green Deploy를 이해하기 위함 입니다.  
> GCP(GKE)를 사용한 gitops + argoCD Deploy Repository 입니다.
  

## 목차

* ArgoCD-Deploy

  * Folders
  ```
  argocd_garabage
  ```

  * git pull
  ```
  git pull https://github.com/JangGyeongSik/build-tet.git 
  ```

  * Namespace Create
  ```
  kubectl create ns argocd
  ```

  * Modify YAML - with GCP(GKE)
    * BackendConfig.yaml
    * FrontendConfig.yaml
    * ingress.yaml
    * argocd_server_install.yaml
    * argocd_rollout.yaml

  * Deploy
  ```
  kubectl apply -f argocd_garabage/
  ```
* ArgoCD-Rollout

  * Folders
  ```
  gyeongsik-prd
  ```

  * Namespace create
  ```
  kubectl create ns prd-gyeongsik
  ```

  * Modify helm chart - with GCP(GKE)
    * helm yaml Custom Modify 

  * Deploy
    * ArgoCD
    * git push command로 Auto Sync 설정하게되면 Deploy가 자동으로 이뤄짐

    * Helm
    ```
    helm install [namespace] . 
    ```
  * Rollout
    * Rollout Plugin Install
    ```
    curl -LO https://github.com/argoproj/argo-rollouts/releases/latest/download/kubectl-argo-rollouts-darwin-amd64
    chmod +x ./kubectl-argo-rollouts-linux-amd64
    sudo mv ./kubectl-argo-rollouts-linux-amd64 /usr/local/bin/kubectl-argo-rollouts
    ```
    * Version Check
    ```
    kubectl-argo-rollouts version 
    ```
    * Rollout Command
    ```
    kubectl argo rollouts list  rollout 
    kubectl argo rollouts promote [Rollout_LIST_NAME]
    ```
    * Pod Rollout Check
    ```
    kubectl get po -n [NAMESPACE_NAME]
    ```

## 별첨

* [GKE-gitops](https://cloud.google.com/kubernetes-engine/docs/tutorials/gitops-cloud-build)
* [GKE-Overview](https://cloud.google.com/kubernetes-engine/docs/concepts/kubernetes-engine-overview)
* [GKE-TroubleShooting](https://cloud.google.com/kubernetes-engine/docs/troubleshooting)
* [Argo-Setup](https://argo-cd.readthedocs.io/en/stable/getting_started/) 
