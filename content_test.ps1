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

$Content = "Hello Flask! Running In A Docker Container on Azure Kubernetes"

if (!($Request)) {

Write-Host "**** The remote name could not be resolved: $URL  ****"

exit 1

}else {

$Request

if ($Request.Content -eq $Content){

Write-Host "**** Request Content OK  ****"

exit 0

}else {

Write-Host "**** Request Content BAD  ****"

exit 1

}

}