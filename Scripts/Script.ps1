function fonction_Service{
    param ()

    Write-Output 'Que voulez vous faire ? :
    0 - chercher un service ?
    1 - lister le nombre de service en marche/stoppé/total ?
    2 - ' 
    switch ($x) {
        0 {  }
        1 {  
            $count_services = Get-Service | measure
            $count_run = Get-Service | Where-Object {$_.status -eq "running"} | measure
            $count_stopped = 
            $count_stopped.Count
            
            Write-Output 'nombre de services en cours $count_stopped.Count'
            Write-Output 'nombre de services stoppés $count_stopped.Count'
            Write-Output 'nombre de services stoppés $services.Count'
        }
        2 {  }
        3 {  }
        Default {}
    } 
}

function total_services_stop {
    param ()
    return (Get-Service | Where-Object {$_.status -eq "stopped"} | Measure-Object).Count  
}

function liste_services_stop {
    param ()
    return (Get-Service | Where-Object {$_.status -eq "stopped"}) 
}

function total_services_run {
    return (Get-Service | Where-Object {$_.status -eq "running"} | Measure-Object).Count  
}
function liste_services_run {
    param ()
    return (Get-Service | Where-Object {$_.status -eq "running"}) 
}

function total_services{
    param ()
    return (Get-Service | Measure-Object).Count  
}
function liste_total_services{
    param ()
    return Get-Service  
}

function cherche_service {
    param (
        [string]$nom_service
    )
    return (Get-Service | Where-Object {$_.Name -like "*$nom_service*"})
}

function charge_cpu {
    return (Get-WmiObject Win32_Processor | Measure-Object -Property LoadPercentage -Average | Select Average)
}

function vitesse_cpu{
    return (Get-WmiObject win32_processor | select -First 1 -Property name, currentclockspeed, maxclockspeed | Format-List)
}

