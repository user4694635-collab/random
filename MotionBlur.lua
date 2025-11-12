repeat task.wait() until workspace.CurrentCamera
local camera = workspace.CurrentCamera
local BLUR_NAME = "MotionBlur"
for _, obj in ipairs(workspace:GetDescendants()) do
    if obj:IsA("BlurEffect") and obj.Name == BLUR_NAME then obj:Destroy() end
end
local blurAmount = 60
local sensitivity = - math.huge
local lastVector = camera.CFrame.LookVector
local motionBlur = Instance.new("BlurEffect")
motionBlur.Name = BLUR_NAME
motionBlur.Parent = camera

workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
    task.wait(); camera = workspace.CurrentCamera; motionBlur.Parent = camera
end)

game:GetService("RunService").Heartbeat:Connect(function()
    if not motionBlur or not motionBlur.Parent then
        motionBlur = Instance.new("BlurEffect")
        motionBlur.Name = BLUR_NAME
        motionBlur.Parent = workspace.CurrentCamera
    end
    local currentVector = camera.CFrame.LookVector
    local magnitude = (currentVector - lastVector).magnitude
    if magnitude > sensitivity then
        motionBlur.Size = math.clamp(magnitude * blurAmount, 0, 56)
    else
        motionBlur.Size = 0
    end
    lastVector = currentVector
end)
