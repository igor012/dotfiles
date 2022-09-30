auth_gcp() {
    echo "🔐 Authenticate to Google"
    gcloud auth login
    gcloud auth application-default login
}

auth_artifact_reg() {
    echo "🛠️ Log into registries"
    local token=$(gcloud auth print-access-token)
    local username="oauth2accesstoken"

for type in helm container podman; do
    echo ${token} | ${type} login \
        --username ${username} \
        --password-stdin \
        europe-west1-docker.pkg.dev
    echo ${token} | ${type} login \
        --username ${username} \
        --password-stdin \
        europe-docker.pkg.dev
done

#     echo ${token} | helm registry login \
#         --username ${username} \
#         --password-stdin \
#         europe-west1-docker.pkg.dev

#     echo ${token} | helm registry login \
#         --username ${username} \
#         --password-stdin \
#         europe-docker.pkg.dev

#     echo ${token} | container registry login \
#         --username ${username} \
#         --password-stdin \
#         europe-west1-docker.pkg.dev

#     echo ${token} | container registry login \
#         --username ${username} \
#         --password-stdin \
#         europe-docker.pkg.dev

#     echo ${token} | podman login \
#         --username ${username} \
#         --password-stdin \
#         europe-west1-docker.pkg.dev

#     echo ${token} | podman login \
#         --username ${username} \
#         --password-stdin \
#         europe-docker.pkg.dev
}

open_apps() {
    echo "✨ Opening some apps..."
        open -a "Google Chrome.app"
        open -a "Slack"
        open -a "Visual Studio Code"
}

morning-routine() {
    auth_gcp
    auth_artifact_reg
    open_apps
}
