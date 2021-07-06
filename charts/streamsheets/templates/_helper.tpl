{{/*
Expand the name of the chart: (dict)
* root - .
* name - the name of the resource
*/}}
{{- define "streamsheets.name" -}}
{{- if .name -}}
{{- printf "%s-%s" (default .root.Chart.Name .root.Values.nameOverride ) .name | trunc 63 | trimSuffix "-" }}
{{- else -}}
{{- default .root.Chart.Name .root.Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end -}}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "streamsheets.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels: (dict)
* root - .
* name - name
*/}}
{{- define "streamsheets.labels" -}}
helm.sh/chart: {{ include "streamsheets.chart" .root }}
{{ include "streamsheets.selectorLabels" . }}
{{- if .root.Chart.AppVersion }}
app.kubernetes.io/version: {{ .root.Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .root.Release.Service }}
{{- with .component -}}app.kubernetes.io/component{{ . }}{{- end -}}
{{- with .root.Values.partOf -}}app.kubernetes.io/part-of{{ . }}{{- end -}}
{{- end }}

{{/*
Selector labels
* root - .
* name - name
*/}}
{{- define "streamsheets.selectorLabels" -}}
app.kubernetes.io/name: {{ include "streamsheets.name" . }}
app.kubernetes.io/instance: {{ .root.Release.Name }}
{{- end }}
