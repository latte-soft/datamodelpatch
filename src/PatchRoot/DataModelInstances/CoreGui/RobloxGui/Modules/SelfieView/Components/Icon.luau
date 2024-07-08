local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Packages_0 = l_CorePackages_0.Packages;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v4 = require(l_Packages_0.React);
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local v6 = require(script.Parent.Parent.Utils.FaceChatUtils);
local v7 = require(script.Parent.Parent.Utils.ModelUtils);
local v8 = require(l_Packages_0.UIBlox);
local l_withTooltip_0 = v8.App.Dialog.TooltipV2.withTooltip;
local l_TooltipOrientation_0 = v8.App.Dialog.Enum.TooltipOrientation;
local l_ICON_SIZE_0 = require(script.Parent.Parent.Parent.Chrome.Unibar.Constants).ICON_SIZE;
local v12 = require(script.Parent.CameraStatusDot);
local v13 = require(script.Parent.FaceClone);
local v14 = require(script.Parent.Parent.Hooks.useCameraOn);
local v15 = require(script.Parent.Parent.Hooks.useLocalPlayer);
local v16 = require(script.Parent.Parent.Hooks.useTooltipDismissal);
local v17 = require(script.Parent.Parent.Parent.SelfieView.Flags.GetFFlagSelfieViewDontWaitForCharacter);
local l_GetFFlagSelfViewVisibilityFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSelfViewVisibilityFix;
local v19 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.SelfView.Analytics).new();
return function(v20)
    local v21 = l_useLocalization_0({
        robloxPermissionErrorHeader = "CoreScripts.TopBar.RobloxPermissionErrorHeader", 
        robloxPermissionErrorBody = "CoreScripts.TopBar.RobloxPermissionErrorBody", 
        dynamicAvatarMissingErrorHeader = "CoreScripts.TopBar.DynamicAvatarMissingErrorHeader", 
        dynamicAvatarMissingErrorBody = "CoreScripts.TopBar.DynamicAvatarMissingErrorBody"
    });
    local v22 = v14();
    local v23 = v15();
    local v24 = v4.useRef(nil);
    v4.useEffect(function()
        if not _G.__TESTEZ_RUNNING_TEST__ then
            local v25 = if not l_GetFFlagSelfViewVisibilityFix_0() then v13(v23, v24.current) else v13(v23, v24.current, v20.outerContainerFrameName);
            return function()
                if v25 then
                    v25();
                end;
            end;
        else
            return ;
        end;
    end, {
        v24
    });
    local v26, v27, v28, v29 = v16(2000);
    v4.useEffect(function()
        local v30 = v20.activatedSignal:connect(function()
            if v6.getPermissions().userCamEligible then
                if v6.getPermissions().userCamEnabled then
                    if not v17() then
                        if not (v7.hasDynamicHead(v23.Character or v23.CharacterAdded:Wait()) or v6.isCameraOn()) then
                            v29(v21.dynamicAvatarMissingErrorHeader, v21.dynamicAvatarMissingErrorBody);
                        end;
                    elseif not ((not v23.Character or v7.hasDynamicHead(v23.Character)) or v6.isCameraOn()) then
                        v29(v21.dynamicAvatarMissingErrorHeader, v21.dynamicAvatarMissingErrorBody);
                    end;
                    v19:setLastCtx("SelfView");
                    v6.toggleVideoAnimation();
                    return ;
                else
                    v29(v21.robloxPermissionErrorHeader, v21.robloxPermissionErrorBody);
                    return ;
                end;
            else
                return ;
            end;
        end);
        return function()
            v30.disconnect();
        end;
    end, {
        v20.activatedSignal
    });
    return l_withTooltip_0({
        headerText = v26, 
        bodyText = v27, 
        textXAlignment = Enum.TextXAlignment.Left
    }, {
        guiTarget = l_CoreGui_0, 
        active = v28, 
        DisplayOrder = 100, 
        preferredOrientation = l_TooltipOrientation_0.Bottom
    }, function(v31)
        return v4.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            [v4.Change.AbsoluteSize] = v31, 
            [v4.Change.AbsolutePosition] = v31
        }, {
            CameraStatusDot = not not v22 and v4.createElement(v12, {
                Position = UDim2.fromScale(0.8, 0.7), 
                ZIndex = 2
            }) or nil, 
            WrapperCanvasGroup = v4.createElement("CanvasGroup", {
                ref = v24, 
                Size = UDim2.fromOffset(l_ICON_SIZE_0, l_ICON_SIZE_0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundColor3 = Color3.fromHex("#DEEBF1")
            }, {
                Corner = v4.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                })
            })
        });
    end);
end;
