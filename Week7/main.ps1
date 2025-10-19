. "c:\Users\champuser\SYS320-01\Week6\Event-Logs.ps1"
. "c:\Users\champuser\SYS320-01\Week7\Email.ps1"
. "c:\Users\champuser\SYS320-01\Week7\Scheduler.ps1"
. "c:\Users\champuser\SYS320-01\Week7\configuration.ps1"

$configuration = readConfiguration

$failed = atRiskUsers $configuration.days

SendAlertEmail ($failed | Format-Table | Out-String)

ChooseTimeToRun $configuration.ExecutionTime
