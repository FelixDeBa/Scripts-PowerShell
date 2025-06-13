###CORREGIR MDNS

$mdns= $(Get-ItemProperty('HKLM:SYSTEM\CurrentControlSet\Services\Dnscache\Parameters')).EnableMDNS

if($mdns -eq 0){
	write-host "MDNS ya está deshabilitado"
}else{
	$new_key = $(REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "EnableMDNS" /t REG_DWord /d 0 /f)
	if ($new_key -match "(La operación se completó correctamente|The operation completed successfully)"){
		write-host "Se deshabilitó MDNS"
	}else{
		write-host "No fue posible deshabilitar MDNS"
	}
}