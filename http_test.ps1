$URL = "https://webapp-dev.westeurope.cloudapp.azure.com/"

$Request = Invoke-WebRequest $URL -SkipCertificateCheck


if (!($Request)) {

Write-Host "**** The remote name could not be resolved: $URL  ****"

exit 1

}else {

$Request


if (($Request.StatusCode -eq "200") -and ($Request.StatusDescription -eq "OK")) {

Write-Host "**** $($Request.StatusCode) OK  ****"

exit 0

}else {

Write-Host "**** $($Request.StatusCode) BAD  ****"

exit 1

}

}
