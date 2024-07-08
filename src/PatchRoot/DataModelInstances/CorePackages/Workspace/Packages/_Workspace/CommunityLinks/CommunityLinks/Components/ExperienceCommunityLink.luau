local l_Parent_0 = script:FindFirstAncestor("CommunityLinks").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(script.Parent.CommunityLinkBanner);
local _ = require(script.Parent.Parent.Models.CommunityInfo);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_StyledTextLabel_0 = v2.App.Text.StyledTextLabel;
local l_GetFFlagEnableCommunityLinksClickLogging_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableCommunityLinksClickLogging;
return function(v9)
    local v10 = l_useStyle_0();
    return v1.createElement("Frame", {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 8)
        }), 
        Title = v1.createElement(l_StyledTextLabel_0, {
            text = l_useLocalization_0({
                CommunityTitle = "Feature.CommunityLinks.Heading.CommunityTitle"
            }).CommunityTitle, 
            size = UDim2.fromScale(1, 0), 
            fontStyle = v10.Font.Header1, 
            colorStyle = v10.Theme.TextEmphasis, 
            automaticSize = Enum.AutomaticSize.Y, 
            richText = false, 
            fluidSizing = false, 
            layoutOrder = 1
        }), 
        Banner = v1.createElement(v3, {
            size = UDim2.fromScale(1, 0), 
            layoutOrder = 2, 
            communityInfo = v9.communityInfo, 
            linkedEntityName = v9.experienceName, 
            universeId = if not l_GetFFlagEnableCommunityLinksClickLogging_0() then nil else v9.universeId
        })
    });
end;
