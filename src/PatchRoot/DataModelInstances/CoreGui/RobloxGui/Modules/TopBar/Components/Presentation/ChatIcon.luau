local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_VRService_0 = game:GetService("VRService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v6.Core.Style.withStyle;
local l_Badge_0 = v6.App.Indicator.Badge;
local l_BadgeStates_0 = v6.App.Indicator.Enum.BadgeStates;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v11 = require(l_RobloxGui_0.Modules.ChatSelector);
local v12 = require(l_RobloxGui_0.Modules.TenFootInterface);
local v13 = require(script.Parent.IconButton);
local l_Parent_0 = script.Parent.Parent.Parent;
local v15 = require(l_Parent_0.Analytics);
local v16 = require(l_Parent_0.Flags.GetFFlagEnableChromeBackwardsSignalAPI)();
local v17 = require(l_Parent_0.Flags.GetFFlagEnableTopBarAnalytics)();
local v18 = require(l_Parent_0.Actions.SetKeepOutArea);
local v19 = require(l_Parent_0.Actions.RemoveKeepOutArea);
local v20 = require(l_Parent_0.Constants);
local l_GameSettings_0 = UserSettings().GameSettings;
local function _()
    return game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService;
end;
local v23 = v3.PureComponent:extend("ChatIcon");
v23.validateProps = v5.strictInterface({
    layoutOrder = v5.integer, 
    chatVisible = v5.boolean, 
    unreadMessages = v5.integer, 
    topBarEnabled = v5.boolean, 
    chatEnabled = v5.boolean, 
    setKeepOutArea = v5.callback, 
    removeKeepOutArea = v5.callback
});
v23.init = function(v24)
    v24.buttonRef = v3.createRef();
    v24.chatIconActivated = function()
        v11:ToggleVisibility();
        l_GameSettings_0.ChatVisible = v11:GetVisibility();
        if v17 then
            v15.default:onChatButtonActivated(l_GameSettings_0.ChatVisible);
        end;
    end;
end;
v23.render = function(v25)
    return l_withStyle_0(function(_)
        local v27 = ((v25.props.topBarEnabled and v25.props.chatEnabled) and not v12:IsEnabled()) and not l_VRService_0.VREnabled;
        local v28 = "rbxasset://textures/ui/TopBar/chatOn.png";
        if not v25.props.chatVisible then
            v28 = "rbxasset://textures/ui/TopBar/chatOff.png";
        end;
        local function v30(v29)
            if not v27 or not v29 then
                v25.props.removeKeepOutArea(v20.ChatIconKeepOutAreaId);
                return ;
            else
                v25.props.setKeepOutArea(v20.ChatIconKeepOutAreaId, v29.AbsolutePosition, v29.AbsoluteSize);
                return ;
            end;
        end;
        local function v33(v31)
            if v31 then
                v25.buttonRef.current = v31;
                local l_current_0 = v25.buttonRef.current;
                if not v27 or not l_current_0 then
                    v25.props.removeKeepOutArea(v20.ChatIconKeepOutAreaId);
                else
                    v25.props.setKeepOutArea(v20.ChatIconKeepOutAreaId, l_current_0.AbsolutePosition, l_current_0.AbsoluteSize);
                    return ;
                end;
            end;
        end;
        if not (not v16 or not v25.buttonRef.current) then
            local l_current_1 = v25.buttonRef.current;
            if not v27 or not l_current_1 then
                v25.props.removeKeepOutArea(v20.ChatIconKeepOutAreaId);
            else
                v25.props.setKeepOutArea(v20.ChatIconKeepOutAreaId, l_current_1.AbsolutePosition, l_current_1.AbsoluteSize);
            end;
        end;
        local l_createElement_0 = v3.createElement;
        local v36 = "TextButton";
        local v37 = {
            Text = "", 
            Visible = v27, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 44, 1, 0), 
            LayoutOrder = v25.props.layoutOrder, 
            Selectable = false
        };
        local v38 = {
            Background = v3.createElement(v13, {
                icon = v28, 
                iconSize = 20, 
                onActivated = v25.chatIconActivated, 
                [v3.Change.AbsoluteSize] = if not v16 then nil else v30, 
                [v3.Change.AbsolutePosition] = if not v16 then nil else v30, 
                [v3.Ref] = v33
            })
        };
        local l_createElement_1 = v3.createElement;
        local v40 = "Frame";
        local v41 = {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 2
        };
        local v42 = {};
        local v43 = false;
        if v25.props.unreadMessages > 0 then
            v43 = v3.createElement(l_Badge_0, {
                position = UDim2.fromOffset(18, not (game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService) and 2 or 6), 
                anchorPoint = Vector2.new(0, 0), 
                hasShadow = false, 
                value = not not (game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService) and l_BadgeStates_0.isEmpty or v25.props.unreadMessages
            });
        end;
        v42.Badge = v43;
        v38.BadgeContainer = l_createElement_1(v40, v41, v42);
        return l_createElement_0(v36, v37, v38);
    end);
end;
return v4.UNSTABLE_connect2(function(v44)
    return {
        chatVisible = v44.chat.visible, 
        unreadMessages = v44.chat.unreadMessages, 
        topBarEnabled = v44.displayOptions.topbarEnabled, 
        chatEnabled = v44.coreGuiEnabled[Enum.CoreGuiType.Chat]
    };
end, function(v45)
    return {
        setKeepOutArea = function(v46, v47, v48)
            return v45(v18(v46, v47, v48));
        end, 
        removeKeepOutArea = function(v49)
            return v45(v19(v49));
        end
    };
end)(v23);
