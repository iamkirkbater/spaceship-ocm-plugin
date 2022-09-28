SPACESHIP_OPENSHIFT_SHOW="${SPACESHIP_OPENSHIFT_SHOW=true}"
SPACESHIP_OPENSHIFT_PREFIX="${SPACESHIP_OPENSHIFT_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_OPENSHIFT_SUFFIX="${SPACESHIP_OPENSHIFT_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_OPENSHIFT_SYMBOL="${SPACESHIP_OPENSHIFT_SYMBOL=" "}"
SPACESHIP_OPENSHIFT_COLOR="${SPACESHIP_OPENSHIFT_COLOR="white"}"


spaceship_openshift() {
  [[ $SPACESHIP_OPENSHIFT_SHOW = false ]] && return

  ocm_config_url=$(ocm config get url)
  if [[ "$ocm_config_url" == *"stage"* ]]; then
    SPACESHIP_OPENSHIFT_ENV="staging"
  elif [[ "$ocm_config_url" == *"integration"* ]]; then
    SPACESHIP_OPENSHIFT_ENV="integration"
  elif [[ "$ocm_config_url" == *"api.openshift.com"* ]]; then
    SPACESHIP_OPENSHIFT_ENV="production"
  fi

  [[ -z $SPACESHIP_OPENSHIFT_ENV ]] && return

  spaceship::section \
    "$SPACESHIP_OPENSHIFT_COLOR"\
    "$SPACESHIP_OPENSHIFT_PREFIX" \
    "$SPACESHIP_OPENSHIFT_SYMBOL" \
    "$SPACESHIP_OPENSHIFT_ENV " \
    "$SPACESHIP_OPENSHIFT_SUFFIX"
}
