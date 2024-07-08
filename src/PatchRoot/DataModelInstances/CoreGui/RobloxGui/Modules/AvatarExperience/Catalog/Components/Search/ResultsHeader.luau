local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.UIBlox);
local l_FitTextLabel_0 = require(l_CorePackages_0.AvatarExperienceDeps).RoactFitComponents.FitTextLabel;
local l_ShimmerPanel_0 = v4.App.Loading.ShimmerPanel;
local l_withStyle_0 = v4.Style.withStyle;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local _ = require(l_CoreGui_0.RobloxGui.Modules.AvatarExperience.Common.AvatarExperienceState);
local v10 = v2.PureComponent:extend("ResultsHeader");
v10.renderWithStyle = function(v11, v12)
    local l_Font_0 = v12.Font;
    local l_Font_1 = l_Font_0.Body.Font;
    local v15 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local l_Font_2 = l_Font_0.Header2.Font;
    local v17 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
    local l_Theme_0 = v12.Theme;
    local l_Color_0 = l_Theme_0.TextEmphasis.Color;
    local l_Transparency_0 = l_Theme_0.TextEmphasis.Transparency;
    local l_searchInCatalog_0 = v11.props.searchInCatalog;
    if l_searchInCatalog_0 then
        local l_keyword_0 = l_searchInCatalog_0.keyword;
        return l_withLocalization_0({
            showingResultsFor = "Feature.GamePage.LabelShowingResultsFor"
        })(function(v23)
            return v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v15), 
                LayoutOrder = 1
            }, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 2)
                }), 
                ShowingResultsText = v2.createElement(l_FitTextLabel_0, {
                    width = l_FitTextLabel_0.Width.FitToText, 
                    Text = v23.showingResultsFor, 
                    LayoutOrder = 1, 
                    Size = UDim2.new(0, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    TextSize = v15, 
                    TextColor3 = l_Color_0, 
                    TextTransparency = l_Transparency_0, 
                    Font = l_Font_1, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top
                }), 
                Keyword = v2.createElement(l_FitTextLabel_0, {
                    width = l_FitTextLabel_0.Width.FitToText, 
                    Text = l_keyword_0 or "", 
                    LayoutOrder = 2, 
                    Size = UDim2.new(0, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    TextSize = v17, 
                    TextColor3 = l_Color_0, 
                    TextTransparency = l_Transparency_0, 
                    Font = l_Font_2, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top
                })
            });
        end);
    else
        return v2.createElement(l_ShimmerPanel_0, {
            Size = UDim2.new(1, 0, 0, v15)
        });
    end;
end;
v10.render = function(v24)
    return l_withStyle_0(function(v25)
        return v24:renderWithStyle(v25);
    end);
end;
return v3.connect(function(v26, v27)
    return {
        searchInCatalog = v26.Search.SearchesInCatalog[v27.searchUuid]
    };
end, nil)(v10);
