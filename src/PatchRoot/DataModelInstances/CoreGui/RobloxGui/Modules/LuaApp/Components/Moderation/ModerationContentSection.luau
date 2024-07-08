local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local l_RobloxLocaleIdKey_0 = require(l_CorePackages_0.Workspace.Packages.Localization).RobloxLocaleIdKey;
local v4 = require(l_CorePackages_0.UIBlox);
local l_LinkButton_0 = v4.App.Button.LinkButton;
local l_StyledTextLabel_0 = v4.App.Text.StyledTextLabel;
local v7 = require(l_Modules_0.LuaApp.Components.Moderation.ModerationState);
local v8 = require(l_Modules_0.LuaApp.Components.Moderation.ModerationConsequenceTranparencyLearnMoreSection);
local _ = require(l_CorePackages_0.Workspace.Packages.DsaIllegalContentReporting).isShowEUDSAIllegalContentReportingLink;
local l_isInDSAFeaturesOverrideList_0 = require(l_CorePackages_0.Workspace.Packages.DsaIllegalContentReporting).isInDSAFeaturesOverrideList;
local l_GetFFlagDSAConsequenceTransparency_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagDSAConsequenceTransparency;
return function(v12)
    local l_moderationState_0 = v12.moderationState;
    local l_moderationDetails_0 = v12.moderationDetails;
    local l_localizationTable_0 = v12.localizationTable;
    local l_stylePalette_0 = v12.stylePalette;
    local l_Font_0 = l_stylePalette_0.Font;
    local l_Theme_0 = l_stylePalette_0.Theme;
    local v19 = false;
    local v20 = false;
    local v21 = false;
    local v22 = false;
    if not (l_moderationState_0 ~= v7.Warning) or l_moderationState_0 == v7.WasBanned then
        v20 = true;
    elseif l_moderationState_0 == v7.Banned then
        v19 = true;
        v21 = true;
    elseif l_moderationState_0 == v7.Deleted then
        v19 = true;
        v22 = true;
    end;
    local l_endDate_0 = l_moderationDetails_0.endDate;
    local v24 = nil;
    if l_endDate_0 then
        v24 = DateTime.fromIsoDate(l_endDate_0);
        v24 = not not v24 and v24:FormatLocalTime("LLLL", l_localizationTable_0[l_RobloxLocaleIdKey_0]) or l_moderationDetails_0.endDate;
    end;
    return v2.createElement("Frame", {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = 6
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, 24)
        }), 
        CommunityGuidelines = v2.createElement(l_StyledTextLabel_0, {
            text = l_localizationTable_0.CommunityGuidelineText, 
            fontStyle = l_Font_0.Body, 
            colorStyle = l_Theme_0.TextDefault, 
            layoutOrder = 1, 
            size = UDim2.fromScale(1, 0), 
            automaticSize = Enum.AutomaticSize.Y
        }), 
        EndDateFrame = not not v21 and v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, 12)
            }), 
            DisabledUntilText = v21 and v2.createElement(l_StyledTextLabel_0, {
                text = l_localizationTable_0.AccountDisabledUntilText, 
                fontStyle = l_Font_0.Header2, 
                colorStyle = l_Theme_0.TextDefault, 
                layoutOrder = 1, 
                size = UDim2.fromScale(1, 0), 
                automaticSize = Enum.AutomaticSize.Y
            }), 
            EndDateText = not not v21 and v2.createElement(l_StyledTextLabel_0, {
                text = v24, 
                fontStyle = l_Font_0.Header2, 
                colorStyle = l_Theme_0.TextEmphasis, 
                layoutOrder = 2, 
                size = UDim2.fromScale(1, 0), 
                automaticSize = Enum.AutomaticSize.Y
            }) or nil
        }) or nil, 
        TerminatedText = not not v22 and v2.createElement(l_StyledTextLabel_0, {
            text = l_localizationTable_0.AccountTerminatedText, 
            fontStyle = l_Font_0.Body, 
            colorStyle = l_Theme_0.TextDefault, 
            layoutOrder = 3, 
            size = UDim2.fromScale(1, 0), 
            automaticSize = Enum.AutomaticSize.Y
        }) or nil, 
        AppealHelpPageFrame = ((l_GetFFlagDSAConsequenceTransparency_0() or l_isInDSAFeaturesOverrideList_0(l_moderationDetails_0.punishedUserId)) and l_moderationDetails_0.showAppealsProcessLink) and v2.createElement(v8, {
            layoutOrder = 4, 
            localizationTable = l_localizationTable_0, 
            stylePalette = l_stylePalette_0, 
            dsaLearnMoreActivated = v12.dsaLearnMoreActivated
        }), 
        ReactivateText = not not v20 and v2.createElement(l_StyledTextLabel_0, {
            text = l_localizationTable_0.ReactivateAgreementText, 
            fontStyle = l_Font_0.Body, 
            colorStyle = l_Theme_0.TextDefault, 
            layoutOrder = 5, 
            size = UDim2.fromScale(1, 0), 
            automaticSize = Enum.AutomaticSize.Y
        }) or nil, 
        AppealText = not not v19 and v2.createElement(l_StyledTextLabel_0, {
            text = l_localizationTable_0.AppealV2Text, 
            fontStyle = l_Font_0.Body, 
            colorStyle = l_Theme_0.TextDefault, 
            layoutOrder = 8, 
            size = UDim2.fromScale(1, 0), 
            automaticSize = Enum.AutomaticSize.Y
        }) or nil, 
        LinkFrame = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = 9
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, 12)
            }), 
            CommunityGuidelinesLink = v2.createElement(l_LinkButton_0, {
                text = l_localizationTable_0.CommunityGuidelinesLinkText, 
                onActivated = v12.communityGuidelinesActivated, 
                layoutOrder = 1
            }), 
            TermsOfUseLink = v2.createElement(l_LinkButton_0, {
                text = l_localizationTable_0.TermsOfUseLinkText, 
                onActivated = v12.termsActivated, 
                layoutOrder = 2
            }), 
            ReportAppealsLink = not not v19 and v2.createElement(l_LinkButton_0, {
                text = l_localizationTable_0.ReportingAppealsLinkText, 
                onActivated = v12.reportingAppealsPageActivated, 
                layoutOrder = 3
            }) or nil
        })
    });
end;
