local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local v4 = require(l_CorePackages_0.UIBlox);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Components.IconTextBox);
local v7 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v8 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagL2ControllerSupport);
local v9 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXResalePriceFloor);
local l_Focusable_0 = v3.Focusable;
local l_Images_0 = v4.App.ImageSet.Images;
local l_useStyle_0 = v4.Core.Style.useStyle;
local v13 = l_Images_0["icons/common/robux"];
local function _(v14, v15)
    if not v14 then
        return true;
    else
        local v16 = tonumber(v14);
        if not v9() then
            return not v16 or v16 <= 0;
        else
            return not v16 or v16 <= (v15 or 0);
        end;
    end;
end;
return (v2.forwardRef(function(v18, v19)
    local v20 = v7({
        setPriceLabel = "Feature.Catalog.Heading.SetPrice", 
        pricePlaceholderText = "Feature.Catalog.Label.Price", 
        minAmountText = "Feature.Catalog.Label.MinimumAmount", 
        minAmountTextWithPrice = if not v9() then nil else "Feature.Catalog.Label.MinimumAmountCustom"
    });
    local v21 = l_useStyle_0();
    local l_Theme_0 = v21.Theme;
    local l_Font_0 = v21.Font;
    local l_SubHeader1_0 = l_Font_0.SubHeader1;
    local l_CaptionBody_0 = l_Font_0.CaptionBody;
    local l_RelativeSize_0 = l_SubHeader1_0.RelativeSize;
    local l_RelativeSize_1 = l_CaptionBody_0.RelativeSize;
    local l_BaseSize_0 = l_Font_0.BaseSize;
    local v29 = l_RelativeSize_0 * l_BaseSize_0;
    local v30 = l_RelativeSize_1 * l_BaseSize_0;
    local l_minAmountText_0 = v20.minAmountText;
    if not (not v9() or not v18.priceFloor) and v18.priceFloor > 0 then
        l_minAmountText_0 = v20.minAmountTextWithPrice:gsub("{minimumAmount}", (tostring(v18.priceFloor)));
    end;
    local l_createElement_0 = v2.createElement;
    local v33 = "Frame";
    local v34 = {
        LayoutOrder = v18.layoutOrder, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1
    };
    local v37 = {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 10)
        }), 
        SetPriceSubHeader = v2.createElement("TextLabel", {
            LayoutOrder = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Text = v20.setPriceLabel, 
            Font = l_SubHeader1_0.Font, 
            Size = UDim2.fromScale(1, 0), 
            TextSize = v29, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
            TextWrapped = true, 
            BackgroundTransparency = 1
        }), 
        PriceInputBox = v2.createElement(l_Focusable_0[v6], {
            LayoutOrder = 2, 
            Size = UDim2.fromScale(1, 0), 
            PlaceholderText = v20.pricePlaceholderText, 
            Image = v13, 
            TextInputType = Enum.TextInputType.Number, 
            ref = if not v8() then nil else v19, 
            NextSelectionUp = if not v8() then nil else v18.NextSelectionUp, 
            NextSelectionDown = if not v8() then nil else v18.NextSelectionDown, 
            NextSelectionLeft = if not v8() then nil else v18.NextSelectionLeft, 
            NextSelectionRight = if not v8() then nil else v18.NextSelectionRight, 
            [v2.Change.Text] = function(v35)
                local l_Text_0 = v35.Text;
                if string.len(l_Text_0) > 10 then
                    v35.Text = v18.priceInRobux;
                    return ;
                elseif not (l_Text_0 ~= nil) or l_Text_0 == "" then
                    v18.setPriceInRobux("");
                    return ;
                elseif not string.match(l_Text_0, "^[0-9]+$") then
                    v35.Text = v18.priceInRobux;
                    return ;
                else
                    v18.setPriceInRobux(l_Text_0);
                    return ;
                end;
            end
        })
    };
    local l_createElement_1 = v2.createElement;
    local v39 = "Frame";
    local v40 = {
        LayoutOrder = 3, 
        Size = UDim2.new(1, 0, 0, v30 + 2), 
        BackgroundTransparency = 1
    };
    local v41 = {};
    local l_priceInRobux_0 = v18.priceInRobux;
    local l_priceFloor_0 = v18.priceFloor;
    local v44;
    if not l_priceInRobux_0 then
        v44 = true;
    else
        local v45 = tonumber(l_priceInRobux_0);
        v44 = if not v9() then not v45 or v45 <= 0 else not v45 or v45 <= (l_priceFloor_0 or 0);
    end;
    if v44 then
        v44 = v2.createElement("TextLabel", {
            LayoutOrder = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Text = l_minAmountText_0, 
            Font = l_CaptionBody_0.Font, 
            Size = UDim2.fromScale(1, 0), 
            TextSize = v30, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            TextTransparency = l_Theme_0.TextDefault.Transparency, 
            TextWrapped = true, 
            BackgroundTransparency = 1
        });
    end;
    v41.MinAmountText = v44;
    v37.MinAmountContainer = l_createElement_1(v39, v40, v41);
    return l_createElement_0(v33, v34, v37);
end));
