local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local l_ShareGame_0 = l_RobloxGui_0.Modules.Settings.Pages.ShareGame;
local l_ReducerDependencies_0 = require(l_CorePackages_0.Workspace.Packages.NotificationsCommon).ReducerDependencies;
local v8 = require(l_ShareGame_0.Constants);
local v9 = require(l_ShareGame_0.Components.ShareButton);
local v10 = require(l_ShareGame_0.getTranslator)();
local v11 = require(l_ShareGame_0.Components.ShareInviteLinkMapDispatchToProps);
local v12 = require(l_ShareGame_0.Components.ShareInviteLinkMapStateToProps);
local l_RoduxShareLinks_0 = l_ReducerDependencies_0.RoduxShareLinks;
local l_NetworkStatus_0 = l_ReducerDependencies_0.RoduxNetworking.Enum.NetworkStatus;
local v15 = require(l_RobloxGui_0.Modules.Settings.Theme);
local v16 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableNewInviteMenu);
local v17 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagInviteFriendsDesignUpdates);
local v18 = v4.PureComponent:extend("ShareInviteLink");
local v19 = 12;
local v20 = 8;
local v21 = 69;
if not (not v17() or not v16()) then
    v19 = 16;
    v20 = 12;
    v21 = 66;
end;
local v22 = Color3.fromRGB(79, 84, 95);
local v23 = v10:FormatByKey("Feature.SocialShare.Action.Share");
local v24 = v10:FormatByKey("Feature.SocialShare.Label.Copied");
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local v26 = {
    externalContentSharingProtocol = l_default_0
};
local v27 = true;
if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows then
    v27 = true;
    if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.OSX then
        v27 = l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP;
    end;
end;
v26.isDesktopClient = v27;
v18.defaultProps = v26;
v18.init = function(v28)
    v28.state = {
        showCopiedText = false
    };
    v28.displayShareSheet = function(v29)
        local l_props_0 = v28.props;
        if l_props_0.externalContentSharingProtocol then
            l_props_0.externalContentSharingProtocol:shareUrl({
                url = v29.shortUrl, 
                context = "V1Menu"
            });
            if l_props_0.isDesktopClient then
                v28:setState({
                    showCopiedText = true
                });
                task.delay(1, function()
                    v28:setState({
                        showCopiedText = false
                    });
                end);
            end;
        end;
    end;
end;
v18.didUpdate = function(v31, v32)
    local l_props_1 = v31.props;
    if v32.shareInviteLink == nil and v31.props.shareInviteLink ~= nil then
        v31.props.analytics:linkGenerated({
            linkType = l_RoduxShareLinks_0.Enums.LinkType.ExperienceInvite.rawValue(), 
            linkId = v31.props.shareInviteLink.linkId
        });
        v31.displayShareSheet(l_props_1.shareInviteLink);
    end;
end;
v18.render = function(v34)
    local l_size_0 = v34.props.size;
    local l_layoutOrder_0 = v34.props.layoutOrder;
    local l_deviceLayout_0 = v34.props.deviceLayout;
    local l_zIndex_0 = v34.props.zIndex;
    local v39 = v8.LayoutSpecific[l_deviceLayout_0];
    local function v41()
        local l_props_2 = v34.props;
        v34.props.analytics:onShareButtonClick();
        if v34.props.shareInviteLink == nil then
            v34.props.fetchShareInviteLink();
            return ;
        else
            v34.displayShareSheet(l_props_2.shareInviteLink);
            return ;
        end;
    end;
    local l_createElement_0 = v4.createElement;
    local v43 = "Frame";
    local v44 = {
        Size = l_size_0, 
        Position = v34.props.position, 
        LayoutOrder = l_layoutOrder_0, 
        BackgroundColor3 = v15.color("PlayerRowFrame", v22), 
        BackgroundTransparency = v15.transparency("PlayerRowFrame", 0), 
        ZIndex = l_zIndex_0, 
        BorderSizePixel = 0
    };
    local v45 = {
        Corner = v4.createElement("UICorner", {
            CornerRadius = if not v15.UIBloxThemeEnabled then UDim.new(0, 4) else v15.MenuContainerCornerRadius
        }), 
        UIPadding = v4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v19), 
            PaddingRight = UDim.new(0, v19), 
            PaddingTop = UDim.new(0, v20), 
            PaddingBottom = UDim.new(0, v20)
        }), 
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Title = v4.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = 0, 
            Text = v10:FormatByKey("Feature.SocialShare.Label.ShareServerLink"), 
            Size = UDim2.new(1, -v21, 1, 0), 
            TextSize = v15.textSize(v39.PAGE_TITLE_TEXT_SIZE, "ShareLinkTitle"), 
            TextColor3 = v8.Color.WHITE, 
            Font = v15.font(Enum.Font.SourceSansSemibold, "Semibold")
        })
    };
    local l_createElement_1 = v4.createElement;
    local l_v9_0 = v9;
    local v48 = {
        size = UDim2.new(0, v21, 1, 0), 
        layoutOrder = 1, 
        onShare = v41, 
        text = if not v34.state.showCopiedText then v23 else v24
    };
    local v49 = false;
    if v34.props.fetchShareInviteLinkNetworkStatus ~= l_NetworkStatus_0.Fetching then
        v49 = not v34.state.showCopiedText;
    end;
    v48.isEnabled = v49;
    v45.ShareButton = l_createElement_1(l_v9_0, v48);
    return l_createElement_0(v43, v44, v45);
end;
return (v5.connect(v12, v11)(v18));
