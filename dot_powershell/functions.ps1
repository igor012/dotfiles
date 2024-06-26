function genk8sconf {
    $Env:KUBECONFIG=($(Get-ChildItem -Path $HOME\.kube\ -Filter config-*).FullName -join ';')
    kubectl.exe config view --merge --flatten > $HOME\.kube\config
    $Contexts=@(kubectl config get-contexts -o name)
    $Env:KUBECONFIG=""
    if (! $null -eq $Contexts) {
        Write-Host "Found the following contexts:"
        Write-Host "$Contexts" -ForegroundColor DarkGreen
        $Context=$Contexts[$(Get-Random -Maximum $Contexts.Count)]
        Write-Host "Picking one: $Context"
        kubectx $Context
    }
    else {
        Write-Host "No context found..." -ForegroundColor Red
    }
}

function ls {
    ls.exe -lF --color=auto $args
  }
function l {
    ls.exe -lF --color=auto $args
}
function ll {
    ls.exe -lF --color=auto $args
}
function la {
    ls.exe -laF --color=auto
}

function lad {
    ls.exe -ladF --color=auto .??*
}

function reload_giacei {
	Remove-Module giacei -ErrorAction SilentlyContinue
	Import-module ".\giacei.psd1"
	Write-Host "Module reloaded!"
}

function auth {
	$username = "$USERNAME"
	$secret = gopass show -c $username
	$password = ConvertTo-SecureString -String $secret -AsPlainText -Force
	$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $username, $password
	$global:cred = Get-Credential -Credential $Credential
	return $cred
}
