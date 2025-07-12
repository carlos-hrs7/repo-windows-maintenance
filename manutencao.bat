@echo off 

rem Este script executa uma série de tarefas de manutenção e otimização do Windows. 
rem Ele foi ajustado para ser executado uma única vez e exige privilegios de Administrador. 

color 0B 
echo ========================================================== 
echo           INICIANDO MANUTENCAO DO SISTEMA WINDOWS
echo ========================================================== 
echo.
echo ESTE SCRIPT DEVE SER EXECUTADO COMO ADMINISTRADOR!
echo Feche outros programas antes de continuar para evitar interrupcoes. 
echo.
pause
echo. 


color 0F
echo Fechando processos comuns que podem interferir (opcional - remova se nao usar): 
rem Você pode adicionar ou remover programas aqui conforme suas necessidades. 
taskill /im utorrent.exe /f>nul 2>&1
taskill /im firefox.exe /f>nul 2>&1
taskill /im chrome.exe /f>nul 2>&1
echo Tentativa de finalização de programas comuns concluida. 
echo. 





color 0E
echo ==========================================================
echo           RESET DE CONFIGURACOES DE REDE
echo ==========================================================
echo Redefinindo configuracoes de rede (Winsock e IP)...
netsh winsock reset 
netsh int ip reset 
echo. 
echo Solicitando novo endereço IP...
ipconfig /release 
ipconfig /renew
echo Configuracoes de rede redefinidas com sucesso! 
echo. 





color 0A
echo ========================================================== 
echo           LIMPEZA DE ARQUIVOS TEMPORARIOS
echo ==========================================================
echo Apagando arquivos temporarios da pasta TEMP...
del /F /Q%Temp%\* >nul 2>&1 
echo Arquivos TEMP apagados. 
rem A pasta PREFETCH nao sera limpa, pois nao traz beneficios significatiovs.
echo. 





color 09
echo ========================================================== 
echo      VERIFICACAO E REPARO DA IMAGEM DO WINDOWS (DISM)
echo ==========================================================
echo Verificando a saude da imagem do Windows(CheckHealth)...
DISM /Online /Cleanup-Image /CheckHealth
echo. 
echo Escaneando a saude imagem do Windows(ScanHealth) - pode demorar...
DISM /Online /Cleanup-Image /ScanHealth
echo. 
echo Restaurando a saude da imagem do Windows(RestoreHealth) - pode demorar e requer conexão com a internet...
DISM /Online /Cleanup-Image /RestoreHealth 
echo Verificacao e reparo da imagem do Windows Concluidos. 
echo. 





color 0C
echo ==========================================================
echo      LIMPEZA AVANCADA DE COMPONENTES DO SISTEMA (DISM) 
echo ========================================================== 
echo Executando limpeza avancada de componentes do sistema - pode levar muito tempo! 
rem Remove todas as versoes anteriores de cada componente que o armazem de componentes 
rem do WinSXS nao necessita mais. Isso pode liberar gigabytes de espaco. 
DISM.exe /Online /Cleanup-Image /StartComponentCleanup /ResetBase
echo Limpeza avancada de componentes do sistema concluida. 
echo. 





color 06
echo ==========================================================
echo       VERIFICACAO DE INTEGRIDADE DE ARQUIVOS (SFC)
echo ==========================================================
echo Verificando a integridade dos arquivos do sistema com SFC - pode demorar...
sfc /scannow 
echo Verificacao de arquivos do sistema concluida. 
echo. 





color 04
echo ========================================================== 
echo           VERIFICACAO DE MALWARE (MRT)
echo ==========================================================
echo Executando a Ferramenta de Remocao de Software Mal-Intencionando (MRT) - pode demorar...
mrt /F:Y
echo Verificacao MRT Concluida com sucesso! 
echo. 





color 0B
echo ==========================================================
echo         TODAS AS TAREFAS DE MANUTENCAO CONCLUIDAS! 
echo ==========================================================
echo O computador pode precisar ser reiniciado para que algumas alteracoes facam efeito. 
echo. 
pause
exit 