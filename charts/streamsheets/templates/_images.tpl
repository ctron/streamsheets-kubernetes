{{- define "streamsheets.image" -}}
{{- .root.Values.images.repository | default "cedalo" }}/{{- .image -}}:{{- include "streamsheets.image-tag" .root -}}
{{- end -}}

{{- define "streamsheets.image-tag" -}}
{{- .Values.images.tag | default .Chart.AppVersion -}}
{{- end -}}

{{- define "streamsheets.image-pull-policy" -}}
{{- with .Values.images.pullPolicy }}{{ . }}
{{- else }}
{{- if (eq (include "streamsheets.image-tag" .) "latest") }}Always{{ else }}IfNotPresent{{ end }}
{{- end }}
{{- end }}
