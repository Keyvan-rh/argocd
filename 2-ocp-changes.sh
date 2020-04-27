oc patch deployment argocd-dex-server -p '{"spec": {"template": {"spec": {"containers": [{"name": "dex","image": "quay.io/redhat-cop/dex:v2.22.0-openshift"}]}}}}'
oc patch serviceaccount argocd-dex-server --type='json' -p='[{"op": "add", "path": "/metadata/annotations/serviceaccounts.openshift.io/oauth-redirecturi.argocd", "value":"https://argocd-argocd.apps.ocp4.keyvan.home/api/dex/callback"}]'
echo "update argocd-cm and add the groups"
oc adm groups add-users argocdusers keyvan
oc adm groups add-users argocdusers developer
echo "update argocd-rbac-cmi and give users role"
 
