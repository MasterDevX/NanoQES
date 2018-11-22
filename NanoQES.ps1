$Preload = {
    Clear-Host
    [Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")
    $Host.UI.RawUI.WindowTitle = "NanoQES"
    $Host.UI.RawUI.BackgroundColor = "Black"
    $Host.UI.RawUI.ForegroundColor = "Blue"
    .$Lang
}
$Lang = {
    Clear-Host
    Write-Host "1 - English"
    Write-Host "2 - Українська"
    [string]$lng = Read-Host "Select language / Виберіть мову"
    if($lng -eq 1){
        [string]$l1 = "Welcome to NanoQES!"
        [string]$l2 = "This tool will help you"
        [string]$l3 = "to solve quadratic equations."
        [string]$l4 = "Version:"
        [string]$l5 = "Developer: MasterDevX"
        [string]$l6 = "Press Enter to begin"
        [string]$l7 = "Type in your ""a"" value"
        [string]$l8 = "Type in your ""b"" value"
        [string]$l9 = "Type in your ""c"" value"
        [string]$l10 = "Your discriminant is"
        [string]$l11 = "The equation has two roots:"
        [string]$l12 = "You have entered invalid value!"
        [string]$l13 = "The equation has only one root:"
        [string]$l14 = "Press Enter to try again"
        [string]$l15 = "The equation has no roots"
        [string]$l16 = "1. Find a discriminant:"
        [string]$l17 = "   Equation has two roots, because discriminant is greater than 0"
        [string]$l18 = "2. Calculate square root of discriminant:"
        [string]$l19 = "3. Find roots of equation (X1 and X2):"
        [string]$l20 = "   Equation has only one root, because discriminant is equal to 0"
        [string]$l21 = "2. Find root of equation:"
        [string]$l22 = "   Equation has no roots, because discriminant is less than 0"
        [string]$l23 = "1 - Show detailed solution of current equation"
        [string]$l24 = "2 - Solve another equation"
        [string]$l25 = "3 - Exit"
        [string]$l26 = "Select next action"
        [string]$l27 = "1 - Solve another equation"
        [string]$l28 = "2 - Exit"
        [string]$l29 = "Error:"
    }
    elseIf($lng -eq 2){
        [string]$l1 = "Вітаємо у NanoQES!"
        [string]$l2 = "Ця програма допоможе вам"
        [string]$l3 = "розв'язати квадратні рівняння."
        [string]$l4 = "Версія:"
        [string]$l5 = "Розробник: MasterDevX"
        [string]$l6 = "Натисніть Enter, щоб розпочати"
        [string]$l7 = "Введіть значення ""a"""
        [string]$l8 = "Введіть значення ""b"""
        [string]$l9 = "Введіть значення ""c"""
        [string]$l10 = "Дискримінант дорівнює"
        [string]$l11 = "Рівняння має два корені:"
        [string]$l12 = "Ви ввели неприпустиме значення!"
        [string]$l13 = "Рівняння має тільки один корінь:"
        [string]$l14 = "Натисніть Enter, щоб спробувати знову"
        [string]$l15 = "Рівняння не має коренів"
        [string]$l16 = "1. Знайдіть дискримінант:"
        [string]$l17 = "   Дискримінант більший, ніж 0, тому рівняння має два корені"
        [string]$l18 = "2. Вирахуйте квадратний корінь з дискримінанту:"
        [string]$l19 = "3. Знайдіть корені рівняння (X1 та X2):"
        [string]$l20 = "   Дискримінант дорівнює 0, тому рівняння має тільки один корінь"
        [string]$l21 = "2. Знайдіть корінь рівняння:"
        [string]$l22 = "   Дискримінант менший, ніж 0, тому рівняння не має коренів"
        [string]$l23 = "1 - Показати детальний розв'язок цього рівняння"
        [string]$l24 = "2 - Розв'язати інше рівняння"
        [string]$l25 = "3 - Вийти"
        [string]$l26 = "Виберіть наступну дію"
        [string]$l27 = "1 - Розв'язати інше рівняння"
        [string]$l28 = "2 - Вийти"
        [string]$l29 = "Помилка:"
    }
    else{.$Lang}
    .$About
}
$About = {
    Clear-Host
    [string]$ver = "v2.0.0"
    Write-Host "$l1"
    Write-Host "$l2"
    Write-Host "$l3"
    Write-Host "`n"
    Write-Host "$l4 $ver"
    Write-Host "$l5"
    Write-Host "`n"
    Read-Host "$l6"
    .$Start
}
$Start = {
    Clear-Host
    Write-Host "ax²+bx+c=0"
    Write-Host "`n"
    try {[decimal]$a = Read-Host "$l7"}
    catch {.$Invvalue}
    if($a -eq 0){.$Invvalue}
    try {[decimal]$b = Read-Host "$l8"}
    catch {.$Invvalue}
    try {[decimal]$c = Read-Host "$l9"}
    catch {.$Invvalue}
    [decimal]$d = ($b*$b)-(4*$a*$c)
    if($d -gt 0){.$GTR}
    if($d -eq 0){.$EQU}
    if($d -lt 0){.$LSS}
}
$GTR = {
    Write-Host "`n"
    [decimal]$dsqrt = [math]::sqrt($d)
    [decimal]$xfirst = (-$b+$dsqrt)/(2*$a)
    [decimal]$xsecond = (-$b-$dsqrt)/(2*$a)
    Write-Host "$l10 $d > 0"
    Write-Host "$l11"
    Write-Host "X1 = $xfirst"
    Write-Host "X2 = $xsecond"
    .$Ask
}
$EQU = {
    Write-Host "`n"
    [decimal]$xfirst = -($b/(2*$a))
    Write-Host "$l10 $d"
    Write-Host "$l13"
    Write-Host "X = $xfirst"
    .$Ask
}
$LSS = {
    Write-Host "`n"
    Write-Host "$l10 $d < 0"
    Write-Host "$l15"
    .$Ask
}
$Advanced = {
    Clear-Host
    [string]$x = "x"
    [string]$xs = "x²"
    [string]$xalias_bx = "+$b$x"
    if($b -lt 0){$xalias_bx = "$b$x"}
    if($b -eq 0){$xalias_bx = ""}
    if($b -eq 1){$xalias_bx = "+$x"}
    if($b -eq -1){$xalias_bx = "-$x"}
    [string]$xalias_c = "+$c"
    if($c -lt 0){$xalias_c = "$c"}
    if($c -eq 0){$xalias_c = ""}
    [string]$xalias_a = "$a"
    if($a -eq 1){$xalias_a = ""}
    if($a -eq -1){$xalias_a = "-"}
    [string]$alias_a = "$a"
    if($a -lt 0){$alias_a = "($a)"}
    [string]$alias_b = "$b"
    if($b -lt 0){$alias_b = "($b)"}
    [string]$alias_c = "$c"
    if($c -lt 0){$alias_c = "($c)"}
    [decimal]$bs = $b*$b
    [decimal]$fxac = 4*$a*$c
    [decimal]$mbpdsqrt = -$b+$dsqrt
    [decimal]$mbmdsqrt = -$b-$dsqrt
    [decimal]$txa = 2*$a
    [string]$alias_txa = "$txa"
    if($txa -lt 0){$alias_txa = "($txa)"}
    [string]$alias_fxac = "$fxac"
    if($fxac -lt 0){$alias_fxac = "($fxac)"}
    Write-Host "$xalias_a$xs$xalias_bx$xalias_c=0"
    Write-Host "`n"
    Write-Host "a = $a"
    Write-Host "b = $b"
    Write-Host "c = $c"
    Write-Host "`n"
    Write-Host "$l16"
    if($d -gt 0){
        Write-Host "`n"
        Write-Host "   D = b²-4ac = $alias_b²-4·$alias_a·$alias_c = $bs-$alias_fxac = $d > 0"
        Write-Host "`n"
        Write-Host "$l17"
        Write-Host "`n"
        Write-Host "$l18"
        Write-Host "`n"
        Write-Host "   √D = √$d = $dsqrt"
        Write-Host "`n"
        Write-Host "$l19"
        Write-Host "`n"
        Write-Host "   X1 = (-b+√D)/2a = (-$alias_b + $dsqrt)/2·$alias_a = $mbpdsqrt/$alias_txa = $xfirst"
        Write-Host "`n"
        Write-Host "   X2 = (-b-√D)/2a = (-$alias_b - $dsqrt)/2·$alias_a = $mbmdsqrt/$alias_txa = $xsecond"
        &$Askadv
    }
    if($d -eq 0){
        Write-Host "`n"
        Write-Host "   D = b²-4ac = $alias_b²-4·$alias_a·$alias_c = $bs-$alias_fxac = $d"
        Write-Host "`n"
        Write-Host "$l20"
        Write-Host "`n"
        Write-Host "$l21"
        Write-Host "`n"
        Write-Host "   X = -(b/(2a)) = -($b/(2·$alias_a)) = -($b/$alias_txa) = $xfirst"
        &$Askadv
    }
    if($d -lt 0){
        Write-Host "`n"
        Write-Host "   D = b²-4ac = $alias_b²-4·$alias_a·$alias_c = $bs-$alias_fxac = $d < 0"
        Write-Host "`n"
        Write-Host "$l22"
        &$Askadv
    }
}
$Ask = {
    Write-Host "`n"
    Write-Host "$l23"
    Write-Host "$l24"
    Write-Host "$l25"
    [string]$action = Read-Host "$l26"
    if($action -eq 1){.$Advanced}
    elseIf($action -eq 2){.$Start}
    elseIf($action -eq 3){exit}
    else{exit}
}
$Askadv = {
    Write-Host "`n"
    Write-Host "$l27"
    Write-Host "$l28"
    [string]$action = Read-Host "$l26"
    if($action -eq 1){.$Start}
    elseIf($action -eq 2){exit}
    else{exit}
}
$Invvalue = {
    Write-Host "`n"
    Write-Host "$l29"
    Write-Host "$l12"
    Write-Host "`n"
    Read-Host "$l14"
    .$Start
}
&$Preload