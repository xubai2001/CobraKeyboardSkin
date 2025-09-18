
# 定义要执行的 jsonnet 命令模板
$commands = @(
    "jsonnet .\jsonnet_config\pinyin_26_portrait.jsonnet -o .\{theme}\pinyin_26_portrait.yaml -J .\lib\ --ext-str theme='{theme}' --ext-str orientation='portrait'",
    "jsonnet .\jsonnet_config\pinyin_26_portrait.jsonnet -o .\{theme}\pinyin_26_landscape.yaml -J .\lib\ --ext-str theme='{theme}' --ext-str orientation='landscape'" ,

    "jsonnet .\jsonnet_config\alphabetic_26_portrait.jsonnet -o .\{theme}\alphabetic_26_portrait.yaml -J .\lib\ --ext-str theme='{theme}' --ext-str orientation='portrait'",
    "jsonnet .\jsonnet_config\alphabetic_26_portrait.jsonnet -o .\{theme}\alphabetic_26_landscape.yaml -J .\lib\ --ext-str theme='{theme}' --ext-str orientation='landscape'",

    "jsonnet .\jsonnet_config\numeric_9_portrait.jsonnet -o .\{theme}\numeric_9_portrait.yaml -J .\lib\ --ext-str theme='{theme}'",
    "jsonnet .\jsonnet_config\numeric_9_landscape.jsonnet -o .\{theme}\numeric_9_landscape.yaml -J .\lib\ --ext-str theme='{theme}'",

    "jsonnet .\jsonnet_config\symbolic_portrait.jsonnet -o .\{theme}\symbolic_portrait.yaml -J .\lib\ --ext-str theme='{theme}'",

    "jsonnet .\jsonnet_config\emoji_portrait.jsonnet -o .\{theme}\emoji_portrait.yaml -J .\lib\ --ext-str theme='{theme}'",
    "jsonnet .\jsonnet_config\emoji_portrait.jsonnet -o .\{theme}\emoji_landscape.yaml -J .\lib\ --ext-str theme='{theme}'",

    "jsonnet .\jsonnet_config\panel.jsonnet -o .\{theme}\panel_portrait.yaml -J .\lib\ --ext-str theme='{theme}' --ext-str orientation='portrait'",
    "jsonnet .\jsonnet_config\panel.jsonnet -o .\{theme}\panel_landscape.yaml -J .\lib\ --ext-str theme='{theme}' --ext-str orientation='landscape'"
)

# 定义要处理的目录 (现在只作为 theme)
$directories = @("light", "dark")

# 获取当前目录
$currentDirectory = Get-Location

# 遍历每个目录
foreach ($dir in $directories) {
    # 构建目录路径
    $dirPath = Join-Path -Path $currentDirectory -ChildPath $dir

    # 检查目录是否存在，如果不存在则创建
    if (-not (Test-Path -Path $dirPath)) {
        Write-Host "创建目录: $dirPath" -ForegroundColor Yellow
        New-Item -ItemType Directory -Path $dirPath | Out-Null
    }

    Write-Host "正在处理目录: $dirPath (Theme: $dir)" -ForegroundColor Cyan

    # 遍历并执行每个命令
    foreach ($cmd in $commands) {
        # 根据当前目录替换 {theme} 的值
        $finalCmd = $cmd -replace "{theme}", $dir
        # # 替换 {colorMode} 的值为传入的外部参数 $ColorMode
        # $finalCmd = $finalCmd -replace "{colorMode}", $ColorMode
        Write-Host "正在执行命令: $finalCmd"
        Invoke-Expression $finalCmd
        if ($LASTEXITCODE -ne 0) {
            Write-Host "命令执行失败: $finalCmd" -ForegroundColor Red
            exit $LASTEXITCODE
        }
        Write-Host "命令执行成功: $finalCmd" -ForegroundColor Green
    }
}

Write-Host "所有命令已成功执行" -ForegroundColor Green