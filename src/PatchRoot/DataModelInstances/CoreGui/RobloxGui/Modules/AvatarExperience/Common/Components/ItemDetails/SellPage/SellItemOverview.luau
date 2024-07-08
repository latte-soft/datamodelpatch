local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.UIBlox);
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v8 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v10 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local l_IconButton_0 = v4.App.Button.IconButton;
local l_IconSize_0 = v4.App.ImageSet.Enum.IconSize;
local l_Images_0 = v4.App.ImageSet.Images;
local l_ControlState_0 = v4.Core.Control.Enum.ControlState;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = v4.Core.Style.useStyle;
local v17 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableBankersRoundingOnResale);
local v18 = l_Images_0["icons/common/robux"];
local v19 = l_Images_0["icons/actions/info_small"];
local function v26(v20, v21)
    if not v20 or v20 <= 0 then
        return 0, 0;
    else
        local l_taxRate_0 = v21.taxRate;
        local l_minimumFee_0 = v21.minimumFee;
        if not v17() then
            return math.max(v8.Round(l_taxRate_0 * v20), l_minimumFee_0), 0;
        else
            local v24 = v8.bankersRounding(v20 * (1 - l_taxRate_0));
            local v25 = v20 - v24;
            if v25 < l_minimumFee_0 then
                return l_minimumFee_0, v20 - l_minimumFee_0;
            else
                return v25, v24;
            end;
        end;
    end;
end;
return function(v27)
    local v28 = v10({
        overviewLabel = "Feature.Catalog.Heading.Overview", 
        robloxFeeText = "Feature.Catalog.Label.Fee", 
        sellCutText = "Feature.Catalog.Label.SellCut"
    });
    local v29 = l_useStyle_0();
    local l_Theme_0 = v29.Theme;
    local l_Font_0 = v29.Font;
    local l_SubHeader1_0 = l_Font_0.SubHeader1;
    local l_Body_0 = l_Font_0.Body;
    local l_RelativeSize_0 = l_SubHeader1_0.RelativeSize;
    local l_RelativeSize_1 = l_Body_0.RelativeSize;
    local l_BaseSize_0 = l_Font_0.BaseSize;
    local v37 = l_RelativeSize_0 * l_BaseSize_0;
    local v38 = l_RelativeSize_1 * l_BaseSize_0;
    local v39 = v27.marketplaceFee.taxRate * 100;
    local v40 = v28.robloxFeeText:gsub("({feePercentage})", v39);
    local v41 = tonumber((not v27.priceInRobux or v27.priceInRobux == "") and 0 or v27.priceInRobux);
    local v42 = nil;
    local v43 = nil;
    if not v17() then
        v42 = v26(v41, v27.marketplaceFee);
        v43 = v8.Round(v41 - v42);
    else
        local v44, v45 = v26(v41, v27.marketplaceFee);
        v42 = v44;
        v43 = v45;
    end;
    local v46 = l_NumberLocalization_0.localize(v42, l_LocalizationService_0.RobloxLocaleId);
    local v47 = l_NumberLocalization_0.localize(string.format("%.0f", v43), l_LocalizationService_0.RobloxLocaleId);
    local v48 = l_useNavigation_0();
    return v3.createElement("Frame", {
        LayoutOrder = v27.layoutOrder, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 10)
        }), 
        OverviewFrameContainer = v3.createElement("Frame", {
            LayoutOrder = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 4)
            }), 
            OverviewSubHeader = v3.createElement("TextLabel", {
                LayoutOrder = 1, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Text = v28.overviewLabel, 
                Font = l_SubHeader1_0.Font, 
                TextSize = v37, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                TextWrapped = true, 
                BackgroundTransparency = 1
            }), 
            OverviewInfoButton = v3.createElement(l_IconButton_0, {
                layoutOrder = 2, 
                icon = v19, 
                iconSize = l_IconSize_0.Small, 
                onStateChanged = function(_, v50)
                    if not (v50 ~= l_ControlState_0.Pressed) or v50 == l_ControlState_0.SelectedPressed then
                        v48.navigate(v9.ResaleFeePolicyPrompt, {
                            yourSharePercent = 100 - v39, 
                            robloxFeePercent = v39
                        });
                    end;
                end, 
                iconColor3 = l_Theme_0.IconEmphasis.Color, 
                iconTransparency = l_Theme_0.IconEmphasis.Transparency, 
                backgroundTransparency = 1
            })
        }), 
        CommissionContainer = v3.createElement("Frame", {
            LayoutOrder = 2, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1
        }, {
            CommissionLabel = v3.createElement("TextLabel", {
                LayoutOrder = 1, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Text = v40, 
                Font = l_Body_0.Font, 
                TextSize = v38, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                TextWrapped = true, 
                BackgroundTransparency = 1
            }), 
            CommissionAmountContainer = v3.createElement("Frame", {
                LayoutOrder = 2, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                AnchorPoint = Vector2.new(1, 0), 
                Position = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1
            }, {
                UIListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 4)
                }), 
                CommissionMinusText = v3.createElement("TextLabel", {
                    LayoutOrder = 1, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Text = "-", 
                    Font = l_Body_0.Font, 
                    TextSize = v38, 
                    TextXAlignment = Enum.TextXAlignment.Right, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextTransparency = l_Theme_0.TextDefault.Transparency, 
                    TextWrapped = true, 
                    BackgroundTransparency = 1
                }), 
                CommissionRobuxImage = v3.createElement(l_ImageSetLabel_0, {
                    LayoutOrder = 2, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Image = v18, 
                    Size = UDim2.fromOffset(v38, v38), 
                    ImageColor3 = l_Theme_0.TextDefault.Color, 
                    ImageTransparency = l_Theme_0.TextDefault.Transparency, 
                    BackgroundTransparency = 1
                }), 
                CommissionAmountText = v3.createElement("TextLabel", {
                    LayoutOrder = 3, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Text = v46, 
                    Font = l_Body_0.Font, 
                    TextSize = v38, 
                    TextXAlignment = Enum.TextXAlignment.Right, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextTransparency = l_Theme_0.TextDefault.Transparency, 
                    TextWrapped = true, 
                    BackgroundTransparency = 1
                })
            })
        }), 
        YouEarnContainer = v3.createElement("Frame", {
            LayoutOrder = 3, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1
        }, {
            YouEarnLabel = v3.createElement("TextLabel", {
                LayoutOrder = 1, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Text = v28.sellCutText, 
                Font = l_Body_0.Font, 
                TextSize = v38, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                TextWrapped = true, 
                BackgroundTransparency = 1
            }), 
            YouEarnAmountRobuxContainer = v3.createElement("Frame", {
                LayoutOrder = 2, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                AnchorPoint = Vector2.new(1, 0), 
                Position = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1
            }, {
                UIListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 4)
                }), 
                YouEarnRobuxImage = v3.createElement(l_ImageSetLabel_0, {
                    LayoutOrder = 1, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Image = v18, 
                    Size = UDim2.fromOffset(v38, v38), 
                    ImageColor3 = l_Theme_0.TextDefault.Color, 
                    ImageTransparency = l_Theme_0.TextDefault.Transparency, 
                    BackgroundTransparency = 1
                }), 
                YouEarnAmountText = v3.createElement("TextLabel", {
                    LayoutOrder = 2, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Text = v47, 
                    Font = l_Body_0.Font, 
                    TextSize = v38, 
                    TextXAlignment = Enum.TextXAlignment.Right, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextTransparency = l_Theme_0.TextDefault.Transparency, 
                    TextWrapped = true, 
                    BackgroundTransparency = 1
                })
            })
        })
    });
end;
