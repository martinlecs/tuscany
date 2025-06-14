$TempFile = New-TemporaryFile
docker cp reverse-proxy:/data/caddy/pki/authorities/local/root.crt $TempFile;
certutil -addstore -f "ROOT" $TempFile;
rm $TempFile
Write-Host 'Added Caddy root cert to Windows cert store!'

## For debugging
# Read-Host -Prompt "Press Enter to exit"