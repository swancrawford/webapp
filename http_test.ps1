add-type @"
    using System.Net;
    using System.Security.Cryptography.X509Certificates;
    public class TrustAllCertsPolicy : ICertificatePolicy {
        public bool CheckValidationResult(
            ServicePoint srvPoint, X509Certificate certificate,
            WebRequest request, int certificateProblem) {
            return true;
        }
    }
"@
[System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy

$URL = "https://webapp-dev.westeurope.cloudapp.azure.com/"

$Request = Invoke-WebRequest $URL

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