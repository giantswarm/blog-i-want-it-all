{{/*
Network policy: kube-dns
*/}}
{{- define "giantswarm-todo.netpol.kube-dns" -}}
- namespaceSelector:
    matchLabels:
      name: kube-system
- podSelector:
    matchExpressions:
      - key: k8s-app
        operator: In
        values: ["kube-dns", "coredns"]
ports:
- protocol: TCP
  port: 53
- protocol: UDP
  port: 53
- protocol: TCP
  port: 1053
- protocol: UDP
  port: 1053
{{- end -}}

{{/*
Network policy: linkerd
*/}}
{{- define "giantswarm-todo.netpol.linkerd" -}}
- namespaceSelector:
    matchLabels:
      linkerd.io/control-plane-ns: {{ .Values.linkerdNamespace }}
{{- end -}}

{{/*
Network policy: tracing
*/}}
{{- define "giantswarm-todo.netpol.tracing" -}}
- namespaceSelector:
    matchLabels:
      name: {{ .Values.tracingNamespace }}
- podSelector:
    matchExpressions:
      - key: app
        operator: In
        values: ["opencensus"]
      - key: component
        operator: In
        values: ["oc-collector"]
{{- end -}}
