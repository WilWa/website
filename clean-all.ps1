Get-ChildItem .\ -include bin,node_modules,obj -Recurse | foreach ($_) { remove-item $_.fullname -Force -Recurse }