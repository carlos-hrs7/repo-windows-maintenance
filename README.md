# repo-windows-maintenance
Script para automatizar manutenção e otimização do Windows 

Este script em .bat automatiza diversas tarefas essenciais, como:

✅ Redefinição de configurações de rede 
✅ Limpeza de arquivos temporários (%TEMP%) 
✅ Verificação e reparo da imagem do Windows (DISM)
✅ Limpeza avançada de componentes do sistema (WinSXS com DISM) 
✅ Verificação de integridade de arquivos (SFC)
✅ Limpeza de disco (Cleanmgr, configurável para incluir arquivos do sistema) ✅ Verificação básica de malware (MRT)

Ideal para quem busca manter o PC rápido e saudável com um clique. Ele exige execução como Administrador.

Observação sobre a Limpeza de Disco: Para que a limpeza de disco inclua arquivos do sistema automaticamente via cleanmgr /sagerun:1, você deve executá-lo manualmente uma única vez (como Administrador) via cleanmgr /sageset:1 e marcar as opções desejadas na interface.

