local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Roact);
local _ = require(l_CorePackages_0.Workspace.Packages.Localization).RobloxLocaleIdKey;
local v5 = require(l_Modules_0.LuaApp.Components.Moderation.ModerationConsequenceTranparencyLearnMoreSection);
local v6 = require(l_Modules_0.LuaApp.Models.UserModerationApi.ModerationDetail);
local v7 = require(l_CorePackages_0.UIBlox);
local l_LinkButton_0 = v7.App.Button.LinkButton;
local l_StyledTextLabel_0 = v7.App.Text.StyledTextLabel;
local l_isInDSAFeaturesOverrideList_0 = require(l_CorePackages_0.Workspace.Packages.DsaIllegalContentReporting).isInDSAFeaturesOverrideList;
local l_GetFFlagDSAConsequenceTransparency_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagDSAConsequenceTransparency;
local v12 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v13 = game:DefineFastFlag("BanScreenConsoleFixEnabled", false);
local _ = v2.strictInterface({
    moderationDetails = v6.validateModel, 
    localizationTable = v2.table, 
    stylePalette = v2.table, 
    showAppealsLink = v2.boolean, 
    showTerminationText = v2.boolean, 
    communityGuidelinesActivated = v2.callback, 
    termsActivated = v2.callback, 
    reportingAppealsPageActivated = v2.callback
});
return function(v15)
    local l_moderationDetails_0 = v15.moderationDetails;
    local l_localizationTable_0 = v15.localizationTable;
    local l_stylePalette_0 = v15.stylePalette;
    local l_showAppealsLink_0 = v15.showAppealsLink;
    local l_showTerminationText_0 = v15.showTerminationText;
    local l_Font_0 = l_stylePalette_0.Font;
    local l_Theme_0 = l_stylePalette_0.Theme;
    local v24 = v12(function(v23)
        return v23.getWebViewSupport();
    end);
    local v25 = false;
    if not (not v13 or v24) then
        v25 = true;
    end;
    return v3.createElement("Frame", {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = 4
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, 24)
        }), 
        VerificationMessage = v3.createElement(l_StyledTextLabel_0, {
            text = l_localizationTable_0.ParentVerificationNotice, 
            fontStyle = l_Font_0.Body, 
            colorStyle = l_Theme_0.TextDefault, 
            layoutOrder = 1, 
            size = UDim2.fromScale(1, 0), 
            automaticSize = Enum.AutomaticSize.Y
        }), 
        WebviewNotSupportedMessage = if not v25 then nil else v3.createElement(l_StyledTextLabel_0, {
            text = l_localizationTable_0.ConsoleDeviceNotice, 
            fontStyle = l_Font_0.Body, 
            colorStyle = l_Theme_0.TextDefault, 
            layoutOrder = 2, 
            size = UDim2.fromScale(1, 0), 
            automaticSize = Enum.AutomaticSize.Y
        }), 
        CommunityGuidelines = v3.createElement(l_StyledTextLabel_0, {
            text = l_localizationTable_0.CommunityGuidelineText, 
            fontStyle = l_Font_0.Body, 
            colorStyle = l_Theme_0.TextDefault, 
            layoutOrder = 3, 
            size = UDim2.fromScale(1, 0), 
            automaticSize = Enum.AutomaticSize.Y
        }), 
        ReactivateText = v3.createElement(l_StyledTextLabel_0, {
            text = l_localizationTable_0.ParentReactivationNotice, 
            fontStyle = l_Font_0.Body, 
            colorStyle = l_Theme_0.TextDefault, 
            layoutOrder = 4, 
            size = UDim2.fromScale(1, 0), 
            automaticSize = Enum.AutomaticSize.Y
        }), 
        TerminatedText = not not l_showTerminationText_0 and v3.createElement(l_StyledTextLabel_0, {
            text = l_localizationTable_0.AccountTerminatedText, 
            fontStyle = l_Font_0.Body, 
            colorStyle = l_Theme_0.TextDefault, 
            layoutOrder = 5, 
            size = UDim2.fromScale(1, 0), 
            automaticSize = Enum.AutomaticSize.Y
        }) or nil, 
        AppealHelpPageFrame = ((l_GetFFlagDSAConsequenceTransparency_0() or l_isInDSAFeaturesOverrideList_0(l_moderationDetails_0.punishedUserId)) and l_moderationDetails_0.showAppealsProcessLink) and v3.createElement(v5, {
            layoutOrder = 6, 
            localizationTable = l_localizationTable_0, 
            stylePalette = l_stylePalette_0, 
            dsaLearnMoreActivated = v15.dsaLearnMoreActivated
        }), 
        AppealText = not not l_showAppealsLink_0 and v3.createElement(l_StyledTextLabel_0, {
            text = l_localizationTable_0.AppealV2Text, 
            fontStyle = l_Font_0.Body, 
            colorStyle = l_Theme_0.TextDefault, 
            layoutOrder = 7, 
            size = UDim2.fromScale(1, 0), 
            automaticSize = Enum.AutomaticSize.Y
        }) or nil, 
        LinkFrame = v3.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = 8
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, 12)
            }), 
            CommunityGuidelinesLink = v3.createElement(l_LinkButton_0, {
                text = l_localizationTable_0.CommunityGuidelinesLinkText, 
                onActivated = v15.communityGuidelinesActivated, 
                layoutOrder = 1
            }), 
            TermsOfUseLink = v3.createElement(l_LinkButton_0, {
                text = l_localizationTable_0.TermsOfUseLinkText, 
                onActivated = v15.termsActivated, 
                layoutOrder = 2
            }), 
            ReportAppealsLink = not not l_showAppealsLink_0 and v3.createElement(l_LinkButton_0, {
                text = l_localizationTable_0.ReportingAppealsLinkText, 
                onActivated = v15.reportingAppealsPageActivated, 
                layoutOrder = 3
            }) or nil
        })
    });
end;
