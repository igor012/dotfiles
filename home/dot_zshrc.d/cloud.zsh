
### GCP ###

# The next line updates PATH for the Google Cloud SDK.
if [ -f '${HOME}/Documents/google-cloud-sdk/path.zsh.inc' ]; then source '${HOME}/Documents/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '${HOME}/Documents/google-cloud-sdk/completion.zsh.inc' ]; then source '${HOME}/Documents/google-cloud-sdk/completion.zsh.inc'; fi

if test ${GCP}; then

    function fzf-gproject {
        gcp_project=$(gcloud projects list --format json | jq -r '.[] | .projectId' | fzf)
        gcloud config set project $gcp_project
        echo "Active GCP Project : $gcp_project"
    }

    function gproject {
        select gcp_project in $(
            gcloud projects list --format json | \
                jq -r '.[] | select (.projectId | contains("sys-") | not).projectId'
            ); do
            gcloud config set project $gcp_project
            echo "Active GCP Project : $gcp_project"
        break
        done
    }

    function glogin {
        CRED_PATH="${HOME}/.config/gcloud/creds/sa/"
        select creds in $(gfind ${CRED_PATH} -type f ); do
            export GOOGLE_APPLICATION_CREDENTIALS=$CRED_PATH/$creds
            export GOOGLE_CREDENTIALS=$CRED_PATH/$creds
            echo "Active GCP Creds : $creds"
        break
        done
    }

fi

