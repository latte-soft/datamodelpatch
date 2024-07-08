local l_Lighting_0 = game:GetService("Lighting");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_AdService_0 = game:GetService("AdService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v6 = nil;
local v7 = 0;
local v8 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.RobloxTranslator);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_ScreenGui_0 = Instance.new("ScreenGui");
l_ScreenGui_0.Name = "TeleportEffectGui";
l_ScreenGui_0.IgnoreGuiInset = true;
l_ScreenGui_0.Enabled = false;
l_ScreenGui_0.DisplayOrder = 7;
l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
l_ScreenGui_0.Parent = l_CoreGui_0;
local l_Frame_0 = Instance.new("Frame");
l_Frame_0.Name = "TopFrame";
l_Frame_0.BackgroundColor3 = Color3.fromRGB(40, 40, 40);
l_Frame_0.BorderSizePixel = 0;
l_Frame_0.AnchorPoint = Vector2.new(0.5, 1);
l_Frame_0.Position = UDim2.new(0.5, 0, 0, 0);
l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
l_Frame_0.ZIndex = 1;
l_Frame_0.Parent = l_ScreenGui_0;
local v12 = l_Frame_0:Clone();
v12.AnchorPoint = Vector2.new(0.5, 0);
v12.Position = UDim2.new(0.5, 0, 1, 0);
v12.Parent = l_ScreenGui_0;
local l_Frame_1 = Instance.new("Frame");
l_Frame_1.Name = "SpinnerContainer";
l_Frame_1.ZIndex = 2;
l_Frame_1.BackgroundTransparency = 1;
l_Frame_1.AnchorPoint = Vector2.new(1, 1);
l_Frame_1.Size = UDim2.new(0.125, 0, 0.125, 0);
l_Frame_1.Position = UDim2.new(1, 0, 1, 0);
l_Frame_1.Parent = l_ScreenGui_0;
local l_UIAspectRatioConstraint_0 = Instance.new("UIAspectRatioConstraint");
l_UIAspectRatioConstraint_0.AspectRatio = 1;
l_UIAspectRatioConstraint_0.Parent = l_Frame_1;
local l_ImageLabel_0 = Instance.new("ImageLabel");
l_ImageLabel_0.Name = "SpinnerRobloxTilt";
l_ImageLabel_0.BackgroundTransparency = 1;
l_ImageLabel_0.ImageTransparency = 1;
l_ImageLabel_0.Image = "rbxasset://textures/loading/robloxTilt.png";
l_ImageLabel_0.ZIndex = 2;
l_ImageLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
l_ImageLabel_0.Size = UDim2.new(1, 0, 1, 0);
l_ImageLabel_0.Position = UDim2.new(0, 0, 0, 0);
l_ImageLabel_0.Parent = l_Frame_1;
local l_UIAspectRatioConstraint_1 = Instance.new("UIAspectRatioConstraint");
l_UIAspectRatioConstraint_1.AspectRatio = 1;
l_UIAspectRatioConstraint_1.Parent = l_ImageLabel_0;
local l_TextLabel_0 = Instance.new("TextLabel");
l_TextLabel_0.Text = v8:FormatByKey("CoreScripts.Ads.Label.Teleporting");
l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
l_TextLabel_0.TextTransparency = 1;
l_TextLabel_0.BackgroundTransparency = 1;
l_TextLabel_0.ZIndex = 2;
l_TextLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
l_TextLabel_0.Size = UDim2.new(0.6, 0, 0, 48);
l_TextLabel_0.Position = UDim2.new(0.5, 0, 0.5, 0);
l_TextLabel_0.Font = l_AppFonts_0.default:getDefault();
l_TextLabel_0.TextScaled = true;
l_TextLabel_0.Parent = l_ScreenGui_0;
local v18 = false;
spinSpinner = function()
    if not v18 then
        v18 = true;
        local v19 = os.clock();
        l_RunService_0:BindToRenderStep("PortalLoadingSpinner", Enum.RenderPriority.Last.Value, function()
            if not l_ImageLabel_0 or not l_ImageLabel_0.Parent then
                stopSpinner();
                return ;
            else
                local v20 = ((os.clock() - v19) / 4) % 1;
                local v21 = 0;
                local v22 = 0;
                if v20 <= 0.75 then
                    v22 = math.cos(3.141592653589793 * (v20 / 0.75)) * -0.5 + 0.5;
                    v21 = 2.25;
                else
                    v22 = math.cos(3.141592653589793 + 3.141592653589793 * ((v20 - 0.75) / 0.25)) * -0.5 + 0.5;
                    v21 = 0.25;
                end;
                local v23 = 1 + v22 * 0.25;
                l_ImageLabel_0.Size = UDim2.new(v23, 0, v23, 0);
                l_ImageLabel_0.Rotation = (360 * v22) * v21;
                return ;
            end;
        end);
    end;
end;
stopSpinner = function()
    l_RunService_0:UnbindFromRenderStep("PortalLoadingSpinner");
    v18 = false;
end;
cover = function()
    v7 = v7 + 1;
    local l_v7_0 = v7;
    if v6 then
        if v6.Parent then
            v6:Destroy();
        end;
        v6 = nil;
    end;
    v6 = Instance.new("ColorCorrectionEffect");
    v6.Name = "TeleportColorCorrectionEffect";
    v6.Parent = l_Lighting_0;
    l_TweenService_0:Create(v6, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        Brightness = 1
    }):Play();
    task.delay(0.25, function()
        if l_v7_0 ~= v7 then
            return ;
        else
            if not (not l_ScreenGui_0 or not l_ScreenGui_0.Parent) then
                l_ScreenGui_0.Enabled = true;
            end;
            if not (((not l_Frame_0 or not l_Frame_0.Parent) or not v12) or not v12.Parent) then
                l_TweenService_0:Create(l_Frame_0, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                    Position = UDim2.new(0.5, 0, 0.5, 0)
                }):Play();
                l_TweenService_0:Create(v12, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                    Position = UDim2.new(0.5, 0, 0.5, 0)
                }):Play();
            end;
            return ;
        end;
    end);
    task.delay(1.25, function()
        if l_v7_0 ~= v7 then
            return ;
        else
            if not (not l_ImageLabel_0 or not l_ImageLabel_0.Parent) then
                l_TweenService_0:Create(l_ImageLabel_0, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                    ImageTransparency = 0
                }):Play();
                spinSpinner();
            end;
            if not (not l_TextLabel_0 or not l_TextLabel_0.Parent) then
                l_TweenService_0:Create(l_TextLabel_0, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                    TextTransparency = 0
                }):Play();
            end;
            return ;
        end;
    end);
end;
uncover = function()
    v7 = v7 + 1;
    local l_v7_1 = v7;
    if not (not l_ImageLabel_0 or not l_ImageLabel_0.Parent) then
        l_TweenService_0:Create(l_ImageLabel_0, TweenInfo.new(0.6000000000000001, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            ImageTransparency = 1
        }):Play();
    end;
    if not (not l_TextLabel_0 or not l_TextLabel_0.Parent) then
        l_TweenService_0:Create(l_TextLabel_0, TweenInfo.new(0.6000000000000001, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            TextTransparency = 1
        }):Play();
    end;
    if not (not v6 or not v6.Parent) then
        l_TweenService_0:Create(v6, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Brightness = 0
        }):Play();
    end;
    if not (((not l_Frame_0 or not l_Frame_0.Parent) or not v12) or not v12.Parent) then
        l_TweenService_0:Create(l_Frame_0, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Position = UDim2.new(0.5, 0, 0, 0)
        }):Play();
        l_TweenService_0:Create(v12, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Position = UDim2.new(0.5, 0, 1, 0)
        }):Play();
    end;
    task.delay(3, function()
        if l_v7_1 ~= v7 then
            return ;
        else
            if v6 then
                if v6.Parent then
                    v6:Destroy();
                end;
                v6 = nil;
            end;
            if not (not l_ScreenGui_0 or not l_ScreenGui_0.Parent) then
                l_ScreenGui_0.Enabled = false;
            end;
            stopSpinner();
            return ;
        end;
    end);
end;
l_AdService_0.AdTeleportInitiated:Connect(cover);
l_AdService_0.AdTeleportEnded:Connect(uncover);
