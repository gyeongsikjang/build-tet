#!/bin/bash
new_date=`date "+%Y-%m-%d %I:%M:%S %p"`
old_date=`cat ./values.yaml |grep echo | cut -d \" -f2`
old_image_tags=`cat ./values.yaml |grep tag: | cut -d \" -f2`
new_image_tags="green"
#old_image=`cat ./values.yaml |grep repository: | cut -d \" -f2`
#new_image="kqkdn1/argo-rollout-demo"
#curl v2.wttr.in/Seoul
sed -i "s/$old_date/$new_date/g" ./values.yaml
sed -i "s/$old_image_tags/$new_image_tags/g" ./values.yaml 
<<<<<<< HEAD
=======
cd ~/build-tet/argocd_garabage/;kubectl apply -f argocd_notifications_configmap_install.yaml -n argocd; kubectl apply -f argocd_notifications_controller_install.yaml -n argocd;
>>>>>>> 611ec016654ce5de51d63abe9952e0349fb24ea2
