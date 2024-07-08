local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.UIBlox);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v6 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local l_Images_0 = v4.App.ImageSet.Images;
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local l_ShimmerPanel_0 = v4.App.Loading.ShimmerPanel;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_withStyle_0 = v4.Style.withStyle;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local v13 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagCollectiblesCatalogFollowUpForSaleLocation);
local v14 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagSupportLooksTileFooter);
local v15 = l_Images_0["icons/common/robux"];
local v16 = v3.PureComponent:extend("ItemCardFooter");
v16.render = function(v17)
    local l_localization_0 = v17.props.localization;
    local l_price_0 = v17.props.price;
    local l_isPriceLoaded_0 = v17.props.isPriceLoaded;
    local l_isSellableInShop_0 = v17.props.isSellableInShop;
    local l_fitContentHeight_0 = v17.props.fitContentHeight;
    return l_withStyle_0(function(v23)
        return l_withLocalization_0({
            freeText = "Feature.Catalog.LabelFree", 
            offSaleText = "Feature.Catalog.LabelOffSale", 
            noResellerText = "Feature.Catalog.LabelNoResellers"
        })(function(v24)
            local l_Font_0 = v23.Font.SubHeader1.Font;
            local v26 = v23.Font.BaseSize * v23.Font.SubHeader1.RelativeSize;
            local l_Theme_0 = v23.Theme;
            local v28 = nil;
            local v29 = nil;
            local v30 = Vector2.new(v26, v26);
            if not v13() or l_isSellableInShop_0 then
                if l_price_0 == 0 then
                    v29 = v24.freeText;
                elseif not l_price_0 then
                    if l_isPriceLoaded_0 then
                        v29 = v24.offSaleText;
                    end;
                else
                    v28 = v15;
                    v29 = l_NumberLocalization_0.localize(string.format("%.0f", l_price_0), l_localization_0:GetLocale());
                end;
            else
                v29 = v24.noResellerText;
            end;
            local v31 = 0;
            if v28 then
                v31 = v30.X + 4;
            end;
            return v3.createElement("Frame", {
                Size = if not not v14() and l_fitContentHeight_0 then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                AutomaticSize = if not not v14() and l_fitContentHeight_0 then Enum.AutomaticSize.Y else nil, 
                AnchorPoint = if not not v14() and l_fitContentHeight_0 then Vector2.new(0, 0.5) else nil, 
                Position = if not not v14() and l_fitContentHeight_0 then UDim2.new(0, 0, 0.5, 0) else nil
            }, {
                Shimmer = not l_isPriceLoaded_0 and v3.createElement(l_ShimmerPanel_0, {
                    Size = UDim2.new(0.8, 0, 0, v26)
                }), 
                Icon = v28 and v3.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Image = v28, 
                    ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                    ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                    Size = UDim2.new(0, v30.X, 0, v30.Y)
                }), 
                TextLabel = v29 and v3.createElement("TextLabel", {
                    AnchorPoint = Vector2.new(1, 0), 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(1, 0, 0, 0), 
                    Size = UDim2.new(1, -v31, 1, 0), 
                    Font = l_Font_0, 
                    TextColor3 = l_Theme_0.SecondaryContent.Color, 
                    TextTransparency = l_Theme_0.SecondaryContent.Transparency, 
                    TextSize = v26, 
                    Text = v29, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top
                })
            });
        end);
    end);
end;
return (l_RoactServices_0.connect({
    localization = v6
})(v16));
