#!/usr/bin/env bash
set -euo pipefail

NAME="${1:-}"
if [ -z "$NAME" ]; then
  echo "Usage: ./down.sh <your-name>   (e.g. ./down.sh kingsly)"
  exit 1
fi

echo ">> Removing any LoadBalancer services (Terraform can't see these)..."
for ns in $(kubectl get ns -o jsonpath='{.items[*].metadata.name}' 2>/dev/null); do
  for svc in $(kubectl get svc -n "$ns" \
        -o jsonpath='{range .items[?(@.spec.type=="LoadBalancer")]}{.metadata.name}{" "}{end}' 2>/dev/null); do
    echo "   deleting service '$svc' in namespace '$ns'"
    kubectl delete svc "$svc" -n "$ns" || true
  done
done
sleep 20

echo ">> Destroying all cluster infrastructure..."
terraform destroy -auto-approve -var="student_name=${NAME}"

echo ">> Done. Everything is gone."
