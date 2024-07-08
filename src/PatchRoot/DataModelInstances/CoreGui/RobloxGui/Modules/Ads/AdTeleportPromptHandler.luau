local l_CorePackages_0 = game:GetService("CorePackages");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local v6 = require(l_RobloxGui_0.Modules.Ads.AdTeleportPromptUI);
local v7 = require(l_CorePackages_0.Roact);
local v8 = require(l_CorePackages_0.UIBlox);
local v9 = require(l_CorePackages_0.Packages.RoactGamepad);
local v10 = {};
v10.__index = v10;
local v11, v12 = v7.createBinding(1);
v10.new = function(v13, v14)
    assert(v13.Parent ~= nil, "Typechecker assurance, guaranteed by engine");
    local v15 = setmetatable({}, v10);
    v15.window = nil;
    v15.portal = v13;
    v15.hasActiveWindow = false;
    v15.destination = v14;
    v15.fadingIn = true;
    v15.movedAway = false;
    local l_Parent_0 = v13.Parent;
    v15.maxDistance = (l_Parent_0.Size.X / 2 + l_Parent_0.Size.Z) + 2;
    v15.createTime = -1;
    v15.focusController = v9.createFocusController();
    return v15;
end;
v10.acceptPrompt = function(v17)
    v17.portal:TeleportConfirmed(v17.destination, l_Players_0.LocalPlayer);
    v17:closeWindow();
end;
v10.rejectButton = function(v18)
    v18:rejectPrompt(true, false);
end;
v10.rejectPrompt = function(v19, v20, v21)
    v19.portal:TeleportRejected(v20, v21);
    v19:closeWindow();
end;
local function _(v22, v23)
    local v24 = 1 - (1 - v22 / v23) ^ 3;
    if v24 > 1 then
        v24 = 1;
    end;
    return v24;
end;
v10.onHeartbeat = function(v26)
    assert(l_Players_0.LocalPlayer ~= nil, "Typechecker assurance");
    assert(v26.portal.Parent ~= nil, "Typechecker assurance, guaranteed on engine side.");
    if not ((l_Players_0.LocalPlayer.Character ~= nil and l_Players_0.LocalPlayer.Character.PrimaryPart ~= nil) and v26.portal ~= nil) or v26.portal.Parent.CFrame == nil then
        v26:rejectPrompt(false, false);
        return ;
    else
        if v26.fadingIn then
            local v27 = DateTime.now().UnixTimestampMillis - v26.createTime;
            local v28 = v27 > 450;
            local l_v12_0 = v12;
            local v30 = 1 - (1 - (450 - v27) / 450) ^ 3;
            if v30 > 1 then
                v30 = 1;
            end;
            l_v12_0(v30);
            if v28 then
                v26.fadingIn = false;
                v12(0);
            end;
        end;
        assert(l_Players_0.LocalPlayer.Character ~= nil, "Typechecker assurance, guaranteed above.");
        assert(l_Players_0.LocalPlayer.Character.PrimaryPart ~= nil, "Typechecker assurance guaranteed above.");
        if not (not (v26.maxDistance < (l_Players_0.LocalPlayer.Character.PrimaryPart.Position - v26.portal.Parent.Position).Magnitude) or v26.movedAway) then
            v26.createTime = DateTime.now().UnixTimestampMillis;
            v26.movedAway = true;
            v26.fadingIn = false;
        end;
        if v26.movedAway then
            local v31 = DateTime.now().UnixTimestampMillis - v26.createTime;
            local v32 = v31 > 450;
            local l_v12_1 = v12;
            local v34 = 1 - (1 - v31 / 450) ^ 3;
            if v34 > 1 then
                v34 = 1;
            end;
            l_v12_1(v34);
            if v32 then
                v26:rejectPrompt(false, true);
            end;
        end;
        return ;
    end;
end;
local function _(v35)
    return v35.Name:match("^Gamepad*") ~= nil;
end;
v10.focusIfGamepad = function(v37)
    if l_UserInputService_0:GetLastInputType().Name:match("^Gamepad*") ~= nil then
        v37.focusController:captureFocus();
    end;
end;
v10.instantiatePrompt = function(v38, v39, v40)
    local l_AppStyleProvider_0 = v8.App.Style.AppStyleProvider;
    local l_Constants_0 = v8.App.Style.Constants;
    local v43 = {
        Dark = {
            themeName = l_Constants_0.ThemeName.Dark, 
            fontName = l_Constants_0.FontName.Gotham
        }
    };
    local v44, v45 = v7.createBinding(UDim2.fromOffset(0, 0));
    v38.window = v7.mount(v7.createElement("ScreenGui", {
        ResetOnSpawn = false, 
        IgnoreGuiInset = true, 
        DisplayOrder = 1, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        AutoLocalize = false
    }, v7.createElement(l_AppStyleProvider_0, {
        style = v43.Dark
    }, {
        CanvasGroup = v7.createElement(v9.Focusable.CanvasGroup, {
            focusController = v38.focusController, 
            Selectable = false, 
            GroupTransparency = v11, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = v44, 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        }, {
            Prompt = v7.createElement(v6, {
                shouldRenderCancelButton = v40, 
                experienceName = v39, 
                handler = v38, 
                onAbsoluteSizeChanged = function(v46)
                    v45(UDim2.fromOffset(v46.AbsoluteSize.X, v46.AbsoluteSize.Y));
                end
            })
        })
    })), l_CoreGui_0, "AdTeleportPrompt");
    v38.hasActiveWindow = true;
    v38:focusIfGamepad();
end;
local function _(v47)
    return l_MarketplaceService_0:GetProductInfo(v47).Name;
end;
v10.fetchTitle = function(v49)
    local l_Name_0 = l_MarketplaceService_0:GetProductInfo(v49.destination).Name;
    if l_Name_0 == "Grey Adidas Shoes" then
        error("Name not found.");
        return ;
    else
        return l_Name_0;
    end;
end;
v10.closeWindow = function(v51)
    assert(v51.hasActiveWindow == true, "Only way unmounting makes sense is if window is active.");
    v7.unmount(v51.window);
    v51.hasActiveWindow = false;
end;
v10.updateCreateTime = function(v52)
    v52.createTime = DateTime.now().UnixTimestampMillis;
end;
return v10;
