local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")
local errorMessages = {
    {title = "FATAL ERROR", msg = "Your computer has performed an illegal operation and will be shut down."},
    {title = "Warning", msg = "A problem has been detected. Windows has been shut down to prevent damage to your computer."},
    {title = "Critical Error", msg = "A critical system process has failed. Windows cannot continue running."},
    {title = "System Alert", msg = "Windows has encountered a critical error and needs to restart. Save your work now."},
    {title = "Disk Error", msg = "Windows detected a hard disk problem. Back up your files immediately to prevent data loss."},
    {title = "Network Error", msg = "The network connection has been lost unexpectedly. Error code: 0x800704CF."},
    {title = "Security Alert", msg = "A serious security vulnerability has been detected. Your system may be compromised."},
    {title = "Warning", msg = "Low virtual memory. Windows is increasing the size of your virtual memory paging file."},
    {title = "Application Error", msg = "The application was unable to start correctly (0xc0000005). Click OK to close."},
    {title = "Memory Error", msg = "Your system is low on memory. Save your files and close programs before data is lost."},
    {title = "Driver Error", msg = "A driver has caused an inconsistency in the kernel address space. System must restart."},
    {title = "Registry Error", msg = "Windows registry is corrupted. The system has attempted to recover the registry."},
    {title = "Critical Error", msg = "Windows cannot access the system registry. Error code: 0x80070002."},
    {title = "Disk Error", msg = "One or more sectors on the disk could not be read. Disk integrity check recommended."},
    {title = "System Warning", msg = "CPU temperature critical. Thermal shutdown will occur in 60 seconds if unresolved."},
    {title = "Application Crash", msg = "explorer.exe has stopped working. Windows is checking for a solution to the problem."},
    {title = "BSOD Imminent", msg = "IRQL_NOT_LESS_OR_EQUAL. A process attempted to access memory at an illegal address."},
    {title = "BSOD Imminent", msg = "PAGE_FAULT_IN_NONPAGED_AREA. Required data was not found in memory. Error code: 0x00000050."},
    {title = "Security Alert", msg = "Unauthorized access attempt detected. Windows Firewall has blocked an incoming connection."},
}

local function makeErrorWindow()
    local msg = errorMessages[math.random(1, #errorMessages)] 
    warn("[SYSTEM ERROR] " .. msg.title .. " - " .. msg.msg)

    local Sound = Instance.new("Sound", game.Workspace)
    Sound.SoundId = "rbxassetid://130840811"
    Sound.Volume = 10
    Sound.Looped = false
    Sound:Play()

    local screenGui = Instance.new("ScreenGui")
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui:SetAttribute("IsErrorWindow", true)
    screenGui.Parent = playerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 140)
    frame.Position = UDim2.new(
        math.random(0, 70) / 100, 0,
        math.random(0, 70) / 100, 0
    )
    frame.BackgroundColor3 = Color3.fromRGB(195, 195, 195)
    frame.BorderSizePixel = 2
    frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    frame.Parent = screenGui
    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0, 24)
    titleBar.BackgroundColor3 = Color3.fromRGB(0, 0, 128)
    titleBar.BorderSizePixel = 0
    titleBar.Parent = frame
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -30, 1, 0)
    titleLabel.Position = UDim2.new(0, 6, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = msg.title
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 13
    titleLabel.Parent = titleBar
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 22, 0, 18)
    closeBtn.Position = UDim2.new(1, -24, 0, 3)
    closeBtn.BackgroundColor3 = Color3.fromRGB(195, 195, 195)
    closeBtn.BorderSizePixel = 1
    closeBtn.Text = "X"
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 12
    closeBtn.Parent = titleBar
    closeBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)

    local icon = Instance.new("TextLabel")
    icon.Size = UDim2.new(0, 40, 0, 40)
    icon.Position = UDim2.new(0, 10, 0, 32)
    icon.BackgroundTransparency = 1
    icon.Text = "⚠️"
    icon.TextSize = 28
    icon.Parent = frame

    local bodyText = Instance.new("TextLabel")
    bodyText.Size = UDim2.new(1, -60, 0, 60)
    bodyText.Position = UDim2.new(0, 52, 0, 28)
    bodyText.BackgroundTransparency = 1
    bodyText.Text = msg.msg  
    bodyText.TextColor3 = Color3.fromRGB(0, 0, 0)
    bodyText.Font = Enum.Font.Gotham
    bodyText.TextSize = 12
    bodyText.TextWrapped = true
    bodyText.TextXAlignment = Enum.TextXAlignment.Left
    bodyText.Parent = frame

    local okBtn = Instance.new("TextButton")
    okBtn.Size = UDim2.new(0, 75, 0, 23)
    okBtn.Position = UDim2.new(0.5, -37, 1, -30)
    okBtn.BackgroundColor3 = Color3.fromRGB(195, 195, 195)
    okBtn.BorderSizePixel = 2
    okBtn.Text = "OK"
    okBtn.Font = Enum.Font.Gotham
    okBtn.TextSize = 13
    okBtn.Parent = frame
    okBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)
end

for i = 1, 260 do
    task.wait(0.00001)
    makeErrorWindow()
end

local function makeKernelPanic()
    warn("[KERNEL PANIC] Fatal exception - system halted.")

    local screenGui = Instance.new("ScreenGui")
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui:SetAttribute("IsErrorWindow", true)
    screenGui.Parent = playerGui
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 600, 0, 380)
    frame.Position = UDim2.new(0.5, -300, 0.5, -190)
    frame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    frame.BorderSizePixel = 0
    frame.Parent = screenGui
    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0, 30)
    titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    titleBar.BorderSizePixel = 0
    titleBar.Parent = frame
    local function makeTitleBtn(offsetX, color, symbol)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0, 45, 1, 0)
        btn.Position = UDim2.new(1, offsetX, 0, 0)
        btn.BackgroundColor3 = color
        btn.BorderSizePixel = 0
        btn.Text = symbol
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Font = Enum.Font.Code
        btn.TextSize = 13
        btn.Parent = titleBar
        return btn
    end

    local closeBtn = makeTitleBtn(-45, Color3.fromRGB(196, 43, 28), "✕")
    makeTitleBtn(-90, Color3.fromRGB(50, 50, 50), "□")
    makeTitleBtn(-135, Color3.fromRGB(50, 50, 50), "—")

    closeBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -135, 1, 0)
    titleLabel.Position = UDim2.new(0, 10, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = "C:\\Windows\\system32\\cmd.exe"
    titleLabel.TextColor3 = Color3.fromRGB(204, 204, 204)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Font = Enum.Font.Code
    titleLabel.TextSize = 13
    titleLabel.Parent = titleBar
    local textArea = Instance.new("ScrollingFrame")
    textArea.Size = UDim2.new(1, -16, 1, -42)
    textArea.Position = UDim2.new(0, 8, 0, 38)
    textArea.BackgroundTransparency = 1
    textArea.ScrollBarThickness = 4
    textArea.CanvasSize = UDim2.new(0, 0, 0, 0)
    textArea.AutomaticCanvasSize = Enum.AutomaticSize.Y
    textArea.Parent = frame

    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 2)
    layout.Parent = textArea

local lines = {
    "Microsoft Windows [Version 10.0.19045.3693]",
    "(c) Microsoft Corporation. All rights reserved.",
    "",
    "C:\\Users\\USER> netstat -an",
    "Active Connections",
    "  TCP    192.168.1.4:80      203.0.113.42:54891   SYN_RECEIVED",
    "  TCP    192.168.1.4:80      198.51.100.7:61234   SYN_RECEIVED",
    "  TCP    192.168.1.4:80      192.0.2.88:49302     SYN_RECEIVED",
    "  TCP    192.168.1.4:80      203.0.113.42:54892   SYN_RECEIVED",
    "  TCP    192.168.1.4:80      198.51.100.7:61235   SYN_RECEIVED",
    "  TCP    192.168.1.4:80      192.0.2.88:49303     SYN_RECEIVED",
    "  [WARNING] 4,291 connections pending... truncated",
    "",
    "C:\\Users\\USER> ping 192.168.1.1",
    "Pinging 192.168.1.1... Request timed out.",
    "Pinging 192.168.1.1... Request timed out.",
    "Pinging 192.168.1.1... Request timed out.",
    "Network unreachable. Packet loss: 100%",
    "",
    "C:\\Users\\USER> tasklist",
    "WARNING: CPU usage at 100% - 4291 zombie processes detected",
    "WARNING: Available memory critically low - 14MB remaining",
    "WARNING: Network interface flooded - 98Gbps inbound traffic",
    "WARNING: SYN flood detected from 14,823 unique IP addresses",
    "WARNING: Firewall rules overwhelmed - dropping all packets",
    "",
    "C:\\Users\\USER> Fatal Server DOS Attack... Kernel Panic",
    "",
    "[ 0.000000] Initializing kernel...",
    "[ 0.000412] ACPI: RSDP 0x00000000000F05B0 000024 (v02 BOCHS )",
    "[ 0.001203] PCI: Fatal bus error on device 0000:00:1f.2",
    "[ 0.002944] SCSI subsystem initialized - FAILED",
    "[ 0.004821] ata1: SATA link down (SStatus 0 SControl 300)",
    "[ 0.005630] EXT4-fs error (device sda1): corrupt journal",
    "[ 0.006511] EXT4-fs (sda1): delayed block allocation failed",
    "[ 0.007302] Buffer I/O error on dev sda1, logical block 0",
    "[ 0.008194] lost page write due to I/O error on sda1",
    "[ 0.009003] APIC error on CPU0: 00(40)",
    "[ 0.009501] Network stack overflow - buffer exhausted",
    "[ 0.009721] TCP/IP: connection table full - 65535/65535 slots used",
    "[ 0.009871] Kernel panic - not syncing: Fatal exception in interrupt",
    "[ 0.010422] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G D 5.15.0-91-generic",
    "[ 0.011100] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)",
    "[ 0.011843] RIP: 0010:native_halt+0x2/0x10",
    "[ 0.012204] RSP: 0000:ffffb5c740003e98 EFLAGS: 00000046",
    "[ 0.012899] Call Trace:",
    "[ 0.013201]   do_idle+0x1a3/0x280",
    "[ 0.013598]   cpu_startup_entry+0x19/0x20",
    "[ 0.014002]   start_kernel+0x54e/0x590",
    "[ 0.014800] ---[ end Kernel panic - not syncing: Fatal exception ]---",
    "",
    "System halted.",
}

    local function addLine(text, color)
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 0, 18)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = color or Color3.fromRGB(204, 204, 204)
        label.Font = Enum.Font.Code
        label.TextSize = 13
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.TextTruncate = Enum.TextTruncate.None
        label.Parent = textArea
        RunService.RenderStepped:Wait()
        textArea.CanvasPosition = Vector2.new(0, math.huge)
    end

    task.spawn(function()
        for i, line in ipairs(lines) do
            local color = Color3.fromRGB(204, 204, 204)
            if line:find("panic") or line:find("error") or line:find("Error") or line:find("APIC") then
                color = Color3.fromRGB(255, 80, 80) 
            elseif line:find("halted") or line:find("end Kernel") then
                color = Color3.fromRGB(255, 180, 0) 
            end
            addLine(line, color)
            task.wait(0.01)
        end
    end)
end

makeKernelPanic()
