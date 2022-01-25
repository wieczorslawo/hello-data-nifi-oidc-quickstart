#!/bin/sh -e

prop_replace () {
  target_file=${3:-${nifi_cli_props_file}}
  sed -i -e "s|^$1=.*$|$1=$2|"  ${target_file}
}

export nifi_cli_props_file=${NIFI_TOOLKIT_HOME}/conf/cli.properties
nifi_toolkit_path="${NIFI_TOOLKIT_HOME}/bin"

cp ${nifi_cli_props_file}.example ${nifi_cli_props_file}

prop_replace 'baseUrl'            "${NIFI_REGISTRY_BASE_URL}"
prop_replace 'keystore'           "${KEYSTORE_PATH}"
prop_replace 'keystoreType'       "${KEYSTORE_TYPE}"
prop_replace 'keystorePasswd'     "${KEYSTORE_PASSWORD}"
prop_replace 'keyPasswd'          "${KEY_PASSWORD:-$KEYSTORE_PASSWORD}"
prop_replace 'truststore'         "${TRUSTSTORE_PATH}"
prop_replace 'truststoreType'     "${TRUSTSTORE_TYPE}"
prop_replace 'truststorePasswd'   "${TRUSTSTORE_PASSWORD}"
prop_replace 'proxiedEntity'      "${NIFI_REGISTRY_PROXIED_ENTITY}"

exec ${nifi_toolkit_path}/cli.sh "$@" -p ${nifi_cli_props_file}
