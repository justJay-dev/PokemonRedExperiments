while ($true) {
    # latest file with .zip extension
    $latest_file = Get-ChildItem -Path "runs" -Filter "*.zip" | Sort-Object LastWriteTime -Descending | Select-Object -First 1
    if ($latest_file) {
        $latest_file = $latest_file.FullName
        Write-Host "starting with checkpoint: $latest_file"
        Write-Host $latest_file | python baseline_fast_v2.py
    } else {
        Write-Host "No .zip files found."
    }
}

