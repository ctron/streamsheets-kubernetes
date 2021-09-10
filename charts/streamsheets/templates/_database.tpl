{{- define "streamsheets.wait-for-database" -}}
- name: wait-for-database
  image: {{ include "streamsheets.image" ( dict "root" . "image" "streamsheets-base" ) }}
  imagePullPolicy: {{ include "streamsheets.image-pull-policy" . }}
  command:
    - bash
    - -ec
    - |
      until nc -z $MONGO_HOST $MONGO_PORT
      do
        echo "Waiting for MongoDB ($MONGO_HOST:$MONGO_PORT) to start..."
        sleep 1
      done
  env:
    - name: MONGO_HOST
      value: {{ include "streamsheets.name" ( dict "root" . "name" "mongodb") }}
    - name: MONGO_PORT
      value: "27017"
{{- end }}
