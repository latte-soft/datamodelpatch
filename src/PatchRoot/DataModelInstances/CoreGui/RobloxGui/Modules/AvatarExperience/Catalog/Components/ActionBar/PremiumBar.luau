local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.UIBlox);
local l_FitTextLabel_0 = require(l_CorePackages_0.AvatarExperienceDeps).RoactFitComponents.FitTextLabel;
local l_withStyle_0 = v4.Style.withStyle;
local v7 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_ActionBarPremiumHeight_0 = v7.ActionBar.ActionBarPremiumHeight;
local l_ActionBarPremiumOnlyHeight_0 = v7.ActionBar.ActionBarPremiumOnlyHeight;
local v11 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXImproveTryOnManagerUI);
local v12 = utf8.char(57346);
local v13 = v2.PureComponent:extend("PremiumBar");
v13.validateProps = v3.strictInterface({
    LayoutOrder = v3.optional(v3.number), 
    headerPadding = v3.number, 
    isPlayerPremium = v3.boolean, 
    isPremiumExclusive = v3.boolean, 
    premiumPrice = v3.optional(v3.number), 
    discountPercent = v3.optional(v3.number), 
    onPremiumActivated = v3.optional(v3.callback), 
    paddingLeft = v3.optional(v3.number), 
    paddingTop = v3.optional(v3.number), 
    smallerTextSize = if not v11() then nil else v3.optional(v3.boolean)
});
v13.defaultProps = {
    paddingLeft = 24, 
    paddingTop = 6
};
v13.getPremiumBarHeight = function(_, v15, v16)
    return not (not v15 or v16) and l_ActionBarPremiumOnlyHeight_0 or l_ActionBarPremiumHeight_0;
end;
v13.renderPremiumExclusivePremiumPlayer_deprecated = function(_, v18, v19)
    local l_Theme_0 = v18.Theme;
    local l_Font_0 = v18.Font;
    return {
        v2.createElement(l_FitTextLabel_0, {
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Font = l_Font_0.SubHeader1.Font, 
            Position = UDim2.new(0, 24, 0, 6), 
            Size = UDim2.new(1, 0, 0, 0), 
            Text = v19.availableToPremiumMembers, 
            TextSize = l_Font_0.BaseSize * l_Font_0.SubHeader1.RelativeSize, 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            TextTransparency = l_Theme_0.TextDefault.TextTransparency, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            width = l_FitTextLabel_0.Width.FitToText
        })
    };
end;
v13.renderPremiumExclusivePremiumPlayer = function(v22, v23, v24)
    local l_Theme_1 = v23.Theme;
    local l_Font_1 = v23.Font;
    return {
        PremiumBarText = v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, v22.props.paddingLeft, 0, v22.props.paddingTop), 
            Font = l_Font_1.SubHeader1.Font, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Text = v24.availableToPremiumMembers, 
            TextSize = l_Font_1.BaseSize * l_Font_1.SubHeader1.RelativeSize, 
            TextWrapped = true, 
            TextColor3 = l_Theme_1.TextDefault.Color, 
            TextTransparency = l_Theme_1.TextDefault.TextTransparency, 
            TextXAlignment = Enum.TextXAlignment.Left
        })
    };
end;
v13.renderPremiumExclusiveNonPremiumPlayer = function(v27, v28, v29)
    local l_Theme_2 = v28.Theme;
    local l_Font_2 = v28.Font;
    return {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, 6)
        }), 
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v27.props.paddingLeft), 
            PaddingTop = UDim.new(0, v27.props.paddingTop)
        }), 
        PremiumBarTextTop = v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Font = l_Font_2.SubHeader1.Font, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Text = v29.premiumOnly, 
            TextSize = l_Font_2.BaseSize * l_Font_2.SubHeader1.RelativeSize, 
            TextWrapped = true, 
            TextColor3 = l_Theme_2.TextDefault.Color, 
            TextTransparency = l_Theme_2.TextDefault.TextTransparency, 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        PremiumBarTextBottom = v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Font = l_Font_2.SubHeader1.Font, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Text = v29.prePremiumPrice .. v12 .. v27.props.premiumPrice .. ")", 
            TextSize = l_Font_2.BaseSize * l_Font_2.SubHeader1.RelativeSize, 
            TextWrapped = true, 
            TextColor3 = l_Theme_2.TextDefault.Color, 
            TextTransparency = l_Theme_2.TextDefault.TextTransparency, 
            TextXAlignment = Enum.TextXAlignment.Left
        })
    };
end;
v13.renderPremiumDiscountPremiumPlayer = function(v32, v33, v34)
    local l_Theme_3 = v33.Theme;
    local l_Font_3 = v33.Font;
    local v37 = l_Font_3.BaseSize * l_Font_3.SubHeader1.RelativeSize;
    if not (not v11() or not v32.props.smallerTextSize) then
        v37 = l_Font_3.BaseSize * l_Font_3.CaptionSubHeader.RelativeSize;
    end;
    return {
        PremiumBarText = v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, v32.props.paddingLeft, 0, v32.props.paddingTop), 
            Font = l_Font_3.SubHeader1.Font, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Text = v34.premiumDiscount, 
            TextSize = v37, 
            TextWrapped = true, 
            TextColor3 = l_Theme_3.TextDefault.Color, 
            TextTransparency = l_Theme_3.TextDefault.TextTransparency, 
            TextXAlignment = Enum.TextXAlignment.Left
        })
    };
end;
v13.renderPremiumDiscountNonPremiumPlayer = function(v38, v39, v40)
    local l_Theme_4 = v39.Theme;
    local l_Font_4 = v39.Font;
    return {
        PremiumBarText = v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Position = UDim2.fromOffset(v38.props.paddingLeft, v38.props.paddingTop), 
            Font = l_Font_4.SubHeader1.Font, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Text = v40.getPremiumAndPrice .. v12 .. v38.props.premiumPrice, 
            TextSize = l_Font_4.BaseSize * l_Font_4.SubHeader1.RelativeSize, 
            TextWrapped = true, 
            TextColor3 = l_Theme_4.TextDefault.Color, 
            TextTransparency = l_Theme_4.TextDefault.TextTransparency, 
            TextXAlignment = Enum.TextXAlignment.Left
        })
    };
end;
v13.renderWithStyle = function(v43, v44, v45)
    local l_LayoutOrder_0 = v43.props.LayoutOrder;
    local l_isPlayerPremium_0 = v43.props.isPlayerPremium;
    local l_isPremiumExclusive_0 = v43.props.isPremiumExclusive;
    local l_onPremiumActivated_0 = v43.props.onPremiumActivated;
    local _ = nil;
    return v2.createElement("ImageButton", {
        LayoutOrder = l_LayoutOrder_0, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutoButtonColor = false, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        [v2.Event.Activated] = function()
            if l_onPremiumActivated_0 then
                l_onPremiumActivated_0();
            end;
        end
    }, if not l_isPremiumExclusive_0 then if l_isPlayerPremium_0 then v43:renderPremiumDiscountPremiumPlayer(v44, v45) else v43:renderPremiumDiscountNonPremiumPlayer(v44, v45) else if l_isPlayerPremium_0 then v43:renderPremiumExclusivePremiumPlayer(v44, v45) else v43:renderPremiumExclusiveNonPremiumPlayer(v44, v45));
end;
v13.render = function(v51)
    return l_withLocalization_0({
        availableToPremiumMembers = "Feature.Catalog.Label.AvailableToPremiumMembers", 
        premiumOnly = "Feature.Catalog.Label.PremiumOnly", 
        prePremiumPrice = "Feature.Catalog.Label.PrePremiumPrice", 
        premiumDiscount = {
            "Feature.Catalog.Label.PremiumDiscount"; 
            percent = v51.props.discountPercent or 0
        }, 
        getPremiumAndPrice = "Feature.Catalog.Label.GetPremiumAndPrice"
    })(function(v52)
        return l_withStyle_0(function(v53)
            return v51:renderWithStyle(v53, v52);
        end);
    end);
end;
return v13;
