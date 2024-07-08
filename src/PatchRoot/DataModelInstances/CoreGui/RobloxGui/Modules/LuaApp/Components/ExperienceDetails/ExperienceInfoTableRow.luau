local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(l_CorePackages_0.Packages.t);
local l_GameDetailsSubpage_0 = require(l_Modules_0.LuaApp.Analytics.Events.Games.GameDetailsEvents).GameDetailsSubpage;
local v6 = require(l_Modules_0.LuaApp.AppPage);
local l_withStyle_0 = v3.Core.Style.withStyle;
local l_Cell_0 = v3.App.Table.Cell;
local l_CellHeadDetail_0 = v3.App.Table.CellHeadDetail;
local l_CellTailDescription_0 = v3.App.Table.CellTailDescription;
local v11 = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local l_GuildedLogoWhiteAsset_0 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks).Constants.GuildedLogoWhiteAsset;
local l_GetFFlagUseVoiceExitBetaLanguage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUseVoiceExitBetaLanguage;
local v14 = require(script.Parent.Flags.FFlagExperienceDetailsTextUseTokens);
local l_GetFFlagEnableDetailsPageCommunityLinks_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableDetailsPageCommunityLinks;
local l_GetFFlagEnableCommunityLinksClickLogging_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableCommunityLinksClickLogging;
local v17 = game:DefineFastFlag("LuaAppToggleEITSelectable", false);
local v18 = v2.PureComponent:extend("ExperienceInfoTableRow");
v18.validateProps = v4.strictInterface({
    infoName = v4.string, 
    infoData = v4.string, 
    infoIcon = v4.optional(v4.string), 
    renderTextOverride = v4.optional(v4.callback), 
    linkProps = v4.optional(v4.strictInterface({
        linkPage = v4.optional(v4.string), 
        analyticsSubPage = v4.string, 
        rootPlaceId = v4.string, 
        eventIngest = v4.table, 
        navigate = v4.callback, 
        navigateProps = v4.optional(v4.any)
    })), 
    externalLinkProps = v4.optional(v4.strictInterface({
        linkUrl = v4.string, 
        openLeaveRobloxAlert = v4.callback, 
        closeAlert = v4.callback, 
        linking = v4.table, 
        clickCallback = if not l_GetFFlagEnableCommunityLinksClickLogging_0() then nil else v4.optional(v4.callback)
    }))
});
v18.init = function(v19)
    v19.onActivated = function()
        local l_externalLinkProps_0 = v19.props.externalLinkProps;
        if not l_externalLinkProps_0 then
            local l_linkProps_0 = v19.props.linkProps;
            if l_linkProps_0 then
                local l_infoName_0 = v19.props.infoName;
                local l_linkPage_0 = l_linkProps_0.linkPage;
                local l_rootPlaceId_0 = l_linkProps_0.rootPlaceId;
                local l_analyticsSubPage_0 = l_linkProps_0.analyticsSubPage;
                local l_eventIngest_0 = l_linkProps_0.eventIngest;
                local l_navigate_0 = l_linkProps_0.navigate;
                local v28 = if not l_linkProps_0.navigateProps then {
                    name = v6.GenericWebPage, 
                    detail = l_linkPage_0, 
                    extraProps = {
                        title = l_infoName_0, 
                        transitionAnimation = v11.SlideInFromRight
                    }
                } else l_linkProps_0.navigateProps;
                l_GameDetailsSubpage_0(l_eventIngest_0, "GameInfoRow", l_rootPlaceId_0, l_analyticsSubPage_0);
                l_navigate_0(v28);
                return ;
            else
                return ;
            end;
        else
            l_externalLinkProps_0.openLeaveRobloxAlert(function()
                l_externalLinkProps_0.linking:openURL(l_externalLinkProps_0.linkUrl);
                l_externalLinkProps_0.closeAlert();
                if l_GetFFlagEnableCommunityLinksClickLogging_0() then
                    local l_clickCallback_0 = l_externalLinkProps_0.clickCallback;
                    if l_clickCallback_0 then
                        l_clickCallback_0();
                    end;
                end;
            end);
            return ;
        end;
    end;
end;
v18.render = function(v30)
    local l_infoName_1 = v30.props.infoName;
    local l_infoData_0 = v30.props.infoData;
    local v33 = nil;
    if not l_GetFFlagUseVoiceExitBetaLanguage_0() then
        if l_GetFFlagEnableDetailsPageCommunityLinks_0() and v30.props.infoIcon == l_GuildedLogoWhiteAsset_0 then
            v33 = v30.props.infoIcon;
        end;
    else
        v33 = v30.props.infoIcon;
    end;
    local v34 = (v30.props.linkProps or v30.props.externalLinkProps) and true or false;
    local l_renderTextOverride_0 = v30.props.renderTextOverride;
    return l_withStyle_0(function(v36)
        return v2.createElement(l_Cell_0, {
            size = UDim2.new(1, 0, 0, 56), 
            selectable = if not v17 then nil else v34, 
            userInteractionEnabled = v34, 
            onActivated = not not v34 and v30.onActivated or nil, 
            head = v2.createElement(l_CellHeadDetail_0, {
                labelText = l_infoName_1, 
                labelTextColor = v36.Theme.TextDefault, 
                labelTextFont = if not v14 then v36.Font.Body else v36.Tokens.Semantic.Typography.Body
            }), 
            tail = v2.createElement(l_CellTailDescription_0, {
                text = l_infoData_0, 
                textColor = v36.Theme.TextEmphasis, 
                textFont = if not v14 then v36.Font.Body else v36.Tokens.Semantic.Typography.Subheader, 
                renderTextOverride = l_renderTextOverride_0, 
                showArrow = v34, 
                infoIcon = v33
            })
        });
    end);
end;
return v18;
