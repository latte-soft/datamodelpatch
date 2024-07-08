local l_CoreGui_0 = game:GetService("CoreGui");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v4.App.ImageSet.Images;
local l_IconButton_0 = v4.App.Button.IconButton;
local l_withTooltip_0 = v4.App.Dialog.TooltipV2.withTooltip;
local l_TooltipOrientation_0 = v4.App.Dialog.Enum.TooltipOrientation;
local v9 = require(l_CorePackages_0.Promise);
local v10 = require(l_Modules_0.LuaApp.buildCreatorWebNavUrl);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v12 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useEffectOnce_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useEffectOnce;
local v14 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local v16 = require(l_Modules_0.LuaApp.openExternalBrowser);
return function(v17)
    local v18 = v10({
        utm_content = "side_bar_blue_icon"
    });
    local v19 = v12(l_AppLinking_0);
    local v20 = v12(v14);
    local v21, v22 = v3.useState(false);
    local v23 = v3.useCallback(function()
        v20:setRBXEventStream("StudioCTA", "OpenStudioCreatePage");
        v16(v19, v18);
    end);
    local v24 = l_useLocalization_0({
        TitleText = "CommonUI.Features.StudioCTA.Tooltip.Title", 
        BodyText = "CommonUI.Features.StudioCTA.Tooltip.Body"
    });
    local v25 = v3.useRef(nil);
    l_useEffectOnce_0(function()
        v20:setRBXEventStream("StudioCTA", "MountStudioButton");
    end, {});
    local function _()
        v25.current = v9.delay(0.4):andThenCall(function()
            v25.current = nil;
            v22(true);
        end);
    end;
    local function _()
        if v25.current then
            v25.current:cancel();
            v25.current = nil;
        end;
        if v21 then
            v22(false);
        end;
    end;
    if not v17.hovered or not v17.showTooltip then
        if v25.current then
            v25.current:cancel();
            v25.current = nil;
        end;
        if v21 then
            v22(false);
        end;
    else
        v25.current = v9.delay(0.4):andThenCall(function()
            v25.current = nil;
            v22(true);
        end);
    end;
    return l_withTooltip_0({
        headerText = v24.TitleText, 
        bodyText = v24.BodyText
    }, {
        preferredOrientation = l_TooltipOrientation_0.Top, 
        guiTarget = l_CoreGui_0, 
        active = v21, 
        DisplayOrder = 10
    }, function(v28)
        return v3.createElement("Frame", {
            Size = v17.Size, 
            Position = v17.Position, 
            AnchorPoint = v17.AnchorPoint, 
            BackgroundTransparency = 1, 
            [v3.Tag] = v17.Tag, 
            [v3.Change.AbsoluteSize] = v28, 
            [v3.Change.AbsolutePosition] = v28
        }, {
            StudioIcon = v3.createElement(l_IconButton_0, {
                size = UDim2.fromOffset(44, 44), 
                anchorPoint = Vector2.new(0.5, 0.5), 
                position = UDim2.fromScale(0.5, 0.5), 
                icon = l_Images_0["icons/logo/studiologo"], 
                iconColor3 = Color3.fromRGB(0, 159, 255), 
                onActivated = v23
            })
        });
    end);
end;
