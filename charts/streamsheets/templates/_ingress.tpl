{{- define "streamsheets.app-host" -}}
    {{- with .Values.ingress.host -}}
        {{- . -}}
    {{- else -}}
        streamsheets-{{ .Release.Namespace}}{{ .Values.ingress.domain -}}
    {{- end }}
{{- end }}

{{- define "streamsheets.app-url" -}}
{{- .Values.ingress.protocol -}}://{{ include "streamsheets.app-host" . -}}
{{- end }}
