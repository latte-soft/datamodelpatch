local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local l_RobloxLocaleIdKey_0 = require(l_CorePackages_0.Workspace.Packages.Localization).RobloxLocaleIdKey;
local v4 = require(l_CorePackages_0.UIBlox);
local l_StyledTextLabel_0 = v4.App.Text.StyledTextLabel;
local l_VerticalScrollViewWithMargin_0 = v4.App.Container.VerticalScrollViewWithMargin;
local v7 = require(l_Modules_0.LuaApp.Components.Moderation.ModerationContentSection);
local v8 = require(l_Modules_0.LuaApp.Components.Moderation.ModerationBadUtterances);
local v9 = require(l_Modules_0.LuaApp.Components.Moderation.ModerationConsequenceTransparencySection);
local l_isInDSAFeaturesOverrideList_0 = require(l_CorePackages_0.Workspace.Packages.DsaIllegalContentReporting).isInDSAFeaturesOverrideList;
local l_GetFFlagDSAConsequenceTransparency_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagDSAConsequenceTransparency;
return function(v12)
    local l_moderationState_0 = v12.moderationState;
    local l_moderationDetails_0 = v12.moderationDetails;
    local l_localizationTable_0 = v12.localizationTable;
    local l_stylePalette_0 = v12.stylePalette;
    local l_consequenceTransparencyMessage_0 = l_moderationDetails_0.consequenceTransparencyMessage;
    local l_Font_0 = l_stylePalette_0.Font;
    local l_Theme_0 = l_stylePalette_0.Theme;
    local l_beginDate_0 = l_moderationDetails_0.beginDate;
    local v21 = nil;
    if l_beginDate_0 then
        v21 = DateTime.fromIsoDate(l_beginDate_0);
        v21 = not not v21 and v21:FormatLocalTime("LLLL", l_localizationTable_0[l_RobloxLocaleIdKey_0]) or l_moderationDetails_0.beginDate;
    end;
    return v2.createElement(l_VerticalScrollViewWithMargin_0, {
        size = UDim2.fromScale(1, 1), 
        canvasSizeY = UDim.new(1, 0), 
        useAutomaticCanvasSize = true
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 24), 
            PaddingBottom = UDim.new(0, 24), 
            PaddingRight = UDim.new(0, 12)
        }), 
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, 24)
        }), 
        SubTitle = v2.createElement(l_StyledTextLabel_0, {
            text = l_localizationTable_0.SubTitleText, 
            fontStyle = l_Font_0.Body, 
            colorStyle = l_Theme_0.TextDefault, 
            layoutOrder = 1, 
            size = UDim2.fromScale(1, 0), 
            automaticSize = Enum.AutomaticSize.Y
        }), 
        ReviewDateFrame = v2.createElement("Frame", {
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
                Padding = UDim.new(0, 4)
            }), 
            ReviewedText = v21 and v2.createElement(l_StyledTextLabel_0, {
                text = l_localizationTable_0.ReviewedTitle, 
                fontStyle = l_Font_0.Header2, 
                colorStyle = l_Theme_0.TextDefault, 
                layoutOrder = 1, 
                size = UDim2.fromScale(1, 0), 
                automaticSize = Enum.AutomaticSize.Y
            }), 
            ReviewedDateText = not not v21 and v2.createElement(l_StyledTextLabel_0, {
                text = v21, 
                fontStyle = l_Font_0.Header2, 
                colorStyle = l_Theme_0.TextEmphasis, 
                layoutOrder = 2, 
                size = UDim2.fromScale(1, 0), 
                automaticSize = Enum.AutomaticSize.Y
            }) or nil
        }), 
        ModNoteFrame = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, 4)
            }), 
            ModNoteText = v2.createElement(l_StyledTextLabel_0, {
                text = l_localizationTable_0.ModeratorNoteTitle, 
                fontStyle = l_Font_0.Header2, 
                colorStyle = l_Theme_0.TextDefault, 
                layoutOrder = 1, 
                size = UDim2.fromScale(1, 0), 
                automaticSize = Enum.AutomaticSize.Y
            }), 
            ModContentText = v2.createElement(l_StyledTextLabel_0, {
                text = l_moderationDetails_0.messageToUser, 
                fontStyle = l_Font_0.Header2, 
                colorStyle = l_Theme_0.TextEmphasis, 
                layoutOrder = 2, 
                size = UDim2.fromScale(1, 0), 
                automaticSize = Enum.AutomaticSize.Y
            })
        }), 
        ConsequenceTransparencyFrame = (((l_GetFFlagDSAConsequenceTransparency_0() or l_isInDSAFeaturesOverrideList_0(l_moderationDetails_0.punishedUserId)) and l_consequenceTransparencyMessage_0 ~= nil) and l_consequenceTransparencyMessage_0 ~= "") and v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }, {
            CTComponent = v2.createElement(v9, {
                message = l_consequenceTransparencyMessage_0, 
                stylePalette = l_stylePalette_0, 
                localizationTable = l_localizationTable_0
            })
        }) or nil, 
        BadUtterances = v2.createElement(v8, {
            LayoutOrder = 5, 
            localizationTable = l_localizationTable_0, 
            stylePalette = l_stylePalette_0, 
            badUtterances = l_moderationDetails_0.badUtterances
        }), 
        ModerationContent = v2.createElement(v7, {
            moderationState = l_moderationState_0, 
            moderationDetails = l_moderationDetails_0, 
            localizationTable = l_localizationTable_0, 
            stylePalette = l_stylePalette_0, 
            communityGuidelinesActivated = v12.communityGuidelinesActivated, 
            termsActivated = v12.termsActivated, 
            dsaLearnMoreActivated = v12.dsaLearnMoreActivated, 
            reportingAppealsPageActivated = v12.reportingAppealsPageActivated
        })
    });
end;
