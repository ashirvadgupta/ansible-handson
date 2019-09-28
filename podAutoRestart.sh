#!/bin/bash
oc login $1 -u $2 -p $3
oc project $4

TARGET_PODS=$(oc get events -o json | jq -r '.items[] | select(.message|test("java.lang.OutOfMemoryError.")) | .metadata.name' | cut -d '.' -f 1)
PODS=$(oc get pods  | awk '{print $1}')
for pod in $TARGET_PODS
do
    for p in $PODS
    do
      if [ $p == $pod ]; then
      echo $pod
          oc delete pod $pod
        fi
    done;
done;