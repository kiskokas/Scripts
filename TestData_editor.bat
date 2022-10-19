@echo off &setlocal
cd M:\vCheck\Log\TestData
findstr /v "PPEN #1 AenderungsKommentar KundenStamm " TestData.txt > temp.txt
findstr /v "^$" temp.txt > PreviousTestData.txt
set "txt=PreviousTestData.txt"

setlocal EnableDelayedExpansion
<"!txt!" >"!txt!.~tmp" (
  for /f %%i in ('type "!txt!"^|find /c /v ""') do for /l %%j in (1 1 %%i) do (
    set "ln=" &set /p "ln="
    if not defined ln (
      echo(
    ) else (
      echo(!ln:~35!
    )
  )
)

move /y "!txt!.~tmp" "!txt!"
endlocal
del temp.txt