local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local v3 = require(l_CorePackages_0.Promise);
local v4 = require(l_CorePackages_0.Packages.React);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v6 = require(l_Modules_0.LuaApp.Constants);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v8 = require(l_Modules_0.LuaApp.Components.GameDetails.GameDetailNotificationsButtonHint);
local v9 = require(l_CorePackages_0.UIBlox);
local l_Images_0 = v9.App.ImageSet.Images;
local l_IconButton_0 = v9.App.Button.IconButton;
local l_IconSize_0 = v9.App.ImageSet.Enum.IconSize;
local l_TooltipOrientation_0 = v9.App.Dialog.Enum.TooltipOrientation;
local v14 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppEnableNotificationsEDPTooltip);
local v15 = require(l_Modules_0.LuaApp.Flags.GetFIntNotificationsEDPTooltipTimeLimit);
local v16 = l_Images_0["icons/common/notificationOn"];
local v17 = l_Images_0["icons/common/notificationOff"];
return function(v18)
    local v19 = nil;
    local v20 = nil;
    local v21 = nil;
    local v22 = nil;
    if v14() then
        local function _()
            local l_status_0, l_result_0 = pcall(function()
                return l_AppStorageService_0:GetItem("ShowNotificationsOptInTooltip");
            end);
            if not l_status_0 then
                return false;
            else
                return l_result_0 == "true";
            end;
        end;
        local l_useRef_0 = v4.useRef;
        local l_status_1, l_result_1 = pcall(function()
            return l_AppStorageService_0:GetItem("ShowNotificationsOptInTooltip");
        end);
        l_useRef_0 = l_useRef_0(not not l_status_1 and l_result_1 == "true");
        local v29;
        v29, l_status_1 = v4.useState(l_useRef_0.current);
        v19 = v29;
        v20 = l_status_1;
        v29, l_status_1 = v4.useState(false);
        l_result_1 = function()
            v20(false);
            l_status_1(true);
        end;
        v4.useEffect(function()
            if l_useRef_0.current then
                l_AppStorageService_0:SetItem("ShowNotificationsOptInTooltip", "false");
                l_AppStorageService_0:Flush();
            end;
            v3.delay(v15()):andThen(function()
                v20(false);
                l_status_1(true);
            end);
        end, {});
        local v31 = l_useSelector_0(function(v30)
            return v30.TopBar.statusBarHeight;
        end);
        v22 = v4.useCallback(function(v32)
            if not (not (v32 ~= nil) or not l_useRef_0.current) then
                if v32.AbsolutePosition.Y < v31 + v6.NAV_BAR_SIZE then
                    v20(false);
                    return ;
                elseif not v29 then
                    v20(true);
                end;
            end;
        end, {
            v29
        });
        v21 = v4.useCallback(function()
            v20(false);
            l_status_1(true);
            if v18.toggleFollowExperience then
                v18.toggleFollowExperience();
            end;
        end, {});
    end;
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = v18.layoutOrder, 
        AutomaticSize = if not v14() then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY, 
        Size = UDim2.new(1, 0, 0, 0), 
        Position = v18.position
    }, {
        IconButton = v4.createElement(l_IconButton_0, {
            icon = if not (v18.gameFollowings and v18.gameFollowings.isFollowed) then v17 else v16, 
            iconSize = l_IconSize_0.Medium, 
            onActivated = if not v14() then v18.toggleFollowExperience else v21
        }, {
            Tooltip = if not v14() then nil else v4.createElement(v8, {
                onPositionChanged = v22, 
                isActive = v19, 
                preferredOrientation = l_TooltipOrientation_0.Top
            })
        })
    });
end;
