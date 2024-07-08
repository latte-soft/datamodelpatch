local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInvite");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.RoactUtils);
local l_Throttle_0 = require(l_Parent_0.NotificationsCommon).Throttle;
local l_ReducerDependencies_0 = require(l_Parent_0.NotificationsCommon).ReducerDependencies;
local l_default_0 = require(l_Parent_0.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local l_LocalizationHelper_0 = require(l_Parent_0.NotificationsCommon).LocalizationHelper;
local v9 = require(l_script_FirstAncestor_0.analytics.GameInviteAnalyticsManager);
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_NetworkingShareLinks_0 = l_ReducerDependencies_0.NetworkingShareLinks;
local l_RoduxShareLinks_0 = l_ReducerDependencies_0.RoduxShareLinks;
local l_NetworkStatus_0 = l_ReducerDependencies_0.RoduxNetworking.Enum.NetworkStatus;
local l_getLocalizedStrings_0 = l_LocalizationHelper_0.getLocalizedStrings;
local l_LinkButton_0 = v3.App.Button.LinkButton;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_ImageSetButton_0 = v3.Core.ImageSet.ImageSetButton;
local l_Images_0 = v3.App.ImageSet.Images;
game:DefineFastFlag("generateGameInviteShareLinkOnClick", false);
local v20 = l_Images_0["icons/actions/share"];
local v21 = l_Images_0["icons/menu/link"];
local v22 = {
    copied = "Feature.SocialShare.Label.Copied", 
    copyLink = "Feature.SocialShare.Action.CopyLink"
};
return function(v23)
    local v24, v25 = v2.useState(false);
    local v27 = l_useSelector_0(function(v26)
        return v26;
    end);
    local v28 = l_useStyle_0();
    local v29 = l_useDispatch_0();
    local v30 = l_getLocalizedStrings_0(v22);
    local l_ShareInviteLink_0 = v27.ShareLinks.Invites.ShareInviteLink;
    local function v33()
        v29(l_NetworkingShareLinks_0.GenerateLink.API({
            linkType = l_RoduxShareLinks_0.Enums.LinkType.ExperienceInvite.rawValue()
        })):andThen(function(v32)
            v9:linkGenerated({
                linkType = l_RoduxShareLinks_0.Enums.LinkType.ExperienceInvite.rawValue(), 
                linkId = v32.responseBody.linkId
            });
            if not ((((not game:GetFastFlag("generateGameInviteShareLinkOnClick") or not v32) or not v32.responseBody) or not v32.responseBody.shortUrl) or not l_default_0) then
                l_default_0:shareUrl({
                    url = v32.responseBody.shortUrl, 
                    context = "V1Menu"
                });
            end;
        end);
    end;
    v2.useEffect(function()
        if not (game:GetFastFlag("generateGameInviteShareLinkOnClick") or l_ShareInviteLink_0) then
            v33();
        end;
    end, {});
    local v34 = l_NetworkingShareLinks_0.GenerateLink.getStatus(v27, l_RoduxShareLinks_0.Enums.LinkType.ExperienceInvite.rawValue());
    local v35 = l_Throttle_0(function()
        v9:onShareButtonClick(if not l_ShareInviteLink_0 then nil else l_ShareInviteLink_0.linkId);
        if not l_ShareInviteLink_0 then
            v33();
        elseif l_default_0 then
            l_default_0:shareUrl({
                url = l_ShareInviteLink_0.shortUrl, 
                context = "V1Menu"
            });
        end;
        if v23.isDesktop then
            v25(true);
            task.delay(1, function()
                v25(false);
            end);
        end;
    end);
    if not v23.isDesktop then
        return v2.createElement(l_ImageSetButton_0, {
            LayoutOrder = v23.layoutOrder, 
            BackgroundTransparency = 1, 
            Size = v23.size, 
            [v2.Event.Activated] = v35, 
            Image = v20, 
            ImageColor3 = v28.Theme.IconEmphasis.Color, 
            ImageTransparency = v28.Theme.IconEmphasis.Transparency, 
            BorderSizePixel = 0
        });
    elseif not v23.isFullSize then
        return v2.createElement(l_ImageSetButton_0, {
            LayoutOrder = v23.layoutOrder, 
            BackgroundTransparency = 1, 
            Size = v23.size, 
            [v2.Event.Activated] = v35, 
            Image = v21, 
            ImageColor3 = v28.Theme.IconEmphasis.Color, 
            ImageTransparency = v28.Theme.IconEmphasis.Transparency, 
            BorderSizePixel = 0
        });
    else
        local l_createElement_0 = v2.createElement;
        local v37 = "Frame";
        local v38 = {
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Size = v23.size, 
            LayoutOrder = v23.layoutOrder
        };
        local v39 = {};
        local l_createElement_1 = v2.createElement;
        local l_l_LinkButton_0_0 = l_LinkButton_0;
        local v42 = {};
        local v43 = true;
        if v34 ~= l_NetworkStatus_0.Fetching then
            v43 = v24;
        end;
        v42.isDisabled = v43;
        v42.isLoading = false;
        v42.onActivated = v35;
        v42.size = v23.size;
        v42.text = not not v24 and v30.copied or v30.copyLink;
        v39.LinkButton = l_createElement_1(l_l_LinkButton_0_0, v42);
        return l_createElement_0(v37, v38, v39);
    end;
end;
