brew tap argoproj/tap
brew install argoproj/tap/argocd
oc create namespace argocd
oc project argocd
oc apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
echo "user: admin, Password:"
oc get pods -n argocd -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2
oc create route passthrough argocd --service=argocd-server --port=https --insecure-policy=Redirect
