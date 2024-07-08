local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.t);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v4 = require(l_CorePackages_0.Roact);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v6 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v7 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v7.Style.withStyle;
local l_StyledTextLabel_0 = v7.App.Text.StyledTextLabel;
local v10 = require(l_Modules_0.LuaApp.Models.ExperienceGuidelinesApi.AgeRecommendationDetails);
local v11 = v4.PureComponent:extend("ExperienceGuidelinesList");
v11.validateProps = v2.strictInterface({
    ageRecommendations = v10.validateModel, 
    localization = v2.table, 
    layoutOrder = v2.optional(v2.number)
});
v11.init = function(v12)
    v12.createDescriptorLabels = function(v13, v14)
        local v15 = {};
        for v16, v17 in ipairs(v14) do
            v15["Descriptor" .. v16] = v4.createElement(l_StyledTextLabel_0, {
                layoutOrder = v16 + 1, 
                fontStyle = v13.Font.Body, 
                colorStyle = v13.Theme.TextDefault, 
                size = UDim2.new(1, 0, 0, 0), 
                fluidSizing = false, 
                textXAlignment = Enum.TextXAlignment.Left, 
                textYAlignment = Enum.TextYAlignment.Center, 
                automaticSize = Enum.AutomaticSize.Y, 
                text = v17.displayName
            });
        end;
        return v15;
    end;
    v12.createContentList = function(v18, v19)
        local v20 = {
            Layout = v4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Padding = UDim.new(0, 8)
            })
        };
        for v21, v22 in pairs((v12.createDescriptorLabels(v18, v19))) do
            v20[v21] = v22;
        end;
        return v20;
    end;
    v12.createDescriptors = l_memoize_0(function(v23)
        local v24 = {};
        local l_descriptorUsages_0 = v23.descriptorUsages;
        if l_descriptorUsages_0 ~= nil then
            for v26, v27 in ipairs(l_descriptorUsages_0) do
                local l_descriptor_0 = v27.descriptor;
                if l_descriptor_0 then
                    v24[v26] = {
                        displayName = l_descriptor_0.displayName
                    };
                end;
            end;
        end;
        return v24;
    end);
end;
v11.render = function(v29)
    local l_localization_0 = v29.props.localization;
    local l_ageRecommendations_0 = v29.props.ageRecommendations;
    local v32 = nil;
    local v33 = nil;
    if not l_ageRecommendations_0 then
        v32 = {};
        v33 = l_localization_0:Format("Feature.GameDetails.Label.Unavailable");
    else
        v32 = v29.createDescriptors(l_ageRecommendations_0);
        local l_ageRecommendation_0 = l_ageRecommendations_0.summary.ageRecommendation;
        v33 = if not l_ageRecommendation_0 then l_localization_0:Format("Feature.GameDetails.Label.Unavailable") else l_ageRecommendation_0.displayName;
    end;
    return l_withStyle_0(function(v35)
        return v4.createElement("Frame", {
            LayoutOrder = v29.props.layoutOrder, 
            BackgroundColor3 = v35.Theme.BackgroundDefault.Color, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            MainLayout = v4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Padding = UDim.new(0, 24)
            }), 
            SummaryLabel = v4.createElement(l_StyledTextLabel_0, {
                layoutOrder = 1, 
                fontStyle = v35.Font.Title, 
                colorStyle = v35.Theme.TextEmphasis, 
                size = UDim2.new(1, 0, 0, 0), 
                fluidSizing = false, 
                textXAlignment = Enum.TextXAlignment.Center, 
                textYAlignment = Enum.TextYAlignment.Center, 
                automaticSize = Enum.AutomaticSize.Y, 
                text = v33
            }), 
            ListFrame = v4.createElement("Frame", {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 0), 
                BorderSizePixel = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Position = UDim2.fromOffset(0, 0), 
                BackgroundTransparency = 1
            }, (v29.createContentList(v35, v32)))
        });
    end);
end;
return (l_RoactServices_0.connect({
    localization = v6
})(v11));
