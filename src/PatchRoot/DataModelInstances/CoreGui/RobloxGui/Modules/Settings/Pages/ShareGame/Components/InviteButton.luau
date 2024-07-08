local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_CorePackages_0.Roact);
local l_ShareGame_0 = l_RobloxGui_0.Modules.Settings.Pages.ShareGame;
local l_Immutable_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Immutable;
local v5 = require(l_ShareGame_0.Constants);
local v6 = require(l_ShareGame_0.Components.RectangleButton);
local v7 = require(l_RobloxGui_0.Modules.Settings.Theme);
local v8 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagInviteFriendsDesignUpdates);
local v9 = v7.font(Enum.Font.SourceSansSemibold, "Semibold");
local v10 = v7.textSize(19);
local l_InviteStatus_0 = v5.InviteStatus;
local v12 = {
    [l_InviteStatus_0.Success] = "Feature.SettingsHub.Label.Invited", 
    [l_InviteStatus_0.Moderated] = "Feature.SettingsHub.Label.Moderated", 
    [l_InviteStatus_0.Pending] = "Feature.SettingsHub.Label.Sending"
};
local v13 = require(l_ShareGame_0.getTranslator)();
local v14 = v2.PureComponent:extend("InviteButton");
v14.render = function(v15)
    local l_anchorPoint_0 = v15.props.anchorPoint;
    local l_position_0 = v15.props.position;
    local l_size_0 = v15.props.size;
    local l_layoutOrder_0 = v15.props.layoutOrder;
    local l_zIndex_0 = v15.props.zIndex;
    local l_onInvite_0 = v15.props.onInvite;
    local l_inviteStatus_0 = v15.props.inviteStatus;
    if not l_inviteStatus_0 or l_inviteStatus_0 == l_InviteStatus_0.Failed then
        return v2.createElement(v6, l_Immutable_0.Set(v15.props, "onClick", function()
            l_onInvite_0();
        end), {
            InviteText = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Font = v9, 
                Text = v13:FormatByKey("Feature.SettingsHub.Action.InviteFriend"), 
                TextSize = v10, 
                TextColor3 = v5.Color.WHITE, 
                ZIndex = l_zIndex_0
            })
        });
    else
        return v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            AnchorPoint = l_anchorPoint_0, 
            Position = l_position_0, 
            Size = l_size_0, 
            Font = v9, 
            Text = v13:FormatByKey(v12[l_inviteStatus_0] or "Feature.SettingsHub.Label.Moderated"), 
            TextSize = v10, 
            TextColor3 = v5.Color.WHITE, 
            TextXAlignment = if not v8() then Enum.TextXAlignment.Right else Enum.TextXAlignment.Center, 
            LayoutOrder = l_layoutOrder_0, 
            ZIndex = l_zIndex_0
        });
    end;
end;
return v14;
