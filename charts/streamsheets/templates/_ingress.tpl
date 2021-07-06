{{- define "streamsheets.app-host" -}}
streamsheets-{{ .Release.Namespace}}{{ .Values.ingress.domain -}}
{{- end }}

{{- define "streamsheets.app-url" -}}
https://{{ include "streamsheets.app-host" . -}}
{{- end }}
