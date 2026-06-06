# Restart-Explorer.ps1
# 支持 Windows 10 / 11 / 12 | 无需管理员权限（通常）

$ErrorActionPreference = "Stop"

Write-Host "[+] 正在重启 Windows 资源管理器..." -ForegroundColor Cyan

try {
    # 结束所有 explorer.exe 进程（强制）
    $explorerProcesses = Get-Process -Name "explorer" -ErrorAction SilentlyContinue
    if ($explorerProcesses) {
        Write-Host "  → 结束现有资源管理器进程..." -ForegroundColor Gray
        $explorerProcesses | Stop-Process -Force
    }

    # 等待 1 秒确保释放资源
    Start-Sleep -Seconds 3

    # 启动新实例
    Write-Host "  → 启动新资源管理器..." -ForegroundColor Gray
    Start-Process "explorer.exe"

    Write-Host "[✓] 资源管理器已成功重启！" -ForegroundColor Green
} catch {
    Write-Host "[✗] 错误：$($_.Exception.Message)" -ForegroundColor Red
    pause
}