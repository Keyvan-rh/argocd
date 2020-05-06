oc patch deployment argocd-dex-server -p '{"spec": {"template": {"spec": {"containers": [{"name": "dex","image": "quay.io/redhat-cop/dex:v2.22.0-openshift"}]}}}}'
oc patch serviceaccount argocd-dex-server --type='json' -p='[{"op": "add", "path": "/metadata/annotations/serviceaccounts.openshift.io~1oauth-redirecturi.argocd", "value":"https://argocd-argocd.apps.ocp4.keyvan.home/api/dex/callback"}]'
echo "update argocd-cm and add the groups"
echo "oc edit cm argocd-cm"
echo " check the sample in arcgocd argocd-cm.yaml for section data and its values"
oc adm groups new argocdusers
oc adm groups new argocdadmins
oc adm groups add-users argocdadmins admin
oc adm groups add-users argocdusers developer
echo "update argocd-rbac-cmi and give users role"
echo "oc edit cm argocd-rbac-cm"
echo "data:
  policy.csv: |
    g, argocdusers, role:readonly
    g, argocdadmins, role:admin"

 
