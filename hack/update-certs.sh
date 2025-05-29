# https://caddyserver.com/docs/running#local-https-with-docker
case "$(uname -s)" in
Linux)
    docker compose cp \
        caddy:/data/caddy/pki/authorities/local/root.crt \
        /usr/local/share/ca-certificates/root.crt &&
        sudo update-ca-certificates
    ;;
Darwin)
    docker compose cp \
        caddy:/data/caddy/pki/authorities/local/root.crt \
        /tmp/root.crt &&
        sudo security add-trusted-cert -d -r trustRoot \
            -k /Library/Keychains/System.keychain /tmp/root.crt
    ;;
*)
    echo "Environment not supported."
    exit 1
    ;;
esac
