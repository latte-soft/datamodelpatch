local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.UIBlox).Core.Style.useStyle;
local l_useIsGamepad_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useIsGamepad;
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.RadioButtonGroup);
local v6 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterUtils);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v9 = UDim.new(0, 4);
local function _(v10)
    return (v10 + 19) + v9.Offset;
end;
return function(v12)
    local v13 = l_useStyle_0();
    local l_Theme_0 = v13.Theme;
    local l_Font_0 = v13.Font;
    local v16 = l_useIsGamepad_0();
    local v17, v18 = v2.useBinding(0);
    return v2.createElement(l_Focusable_0.Frame, {
        Size = v17:map(function(v19)
            return UDim2.new(1, 0, 0, (v19 + 19) + v9.Offset);
        end), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v12.LayoutOrder, 
        ref = v12.frameRef, 
        NextSelectionUp = v12.NextSelectionUp, 
        NextSelectionDown = v12.NextSelectionDown
    }, {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = v9
        }), 
        Title = v2.createElement("TextLabel", {
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Font = l_Font_0.Header2.Font, 
            TextSize = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize, 
            Text = v12.title, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextTransparency = l_Theme_0.TextEmphasis.Transparency
        }), 
        RadioButtonGroupContainer = v2.createElement("Frame", {
            Size = v17:map(v7.mapHeightToSize), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            RadioButtons = v2.createElement(v5, {
                items = v12.items, 
                itemHeight = v6.SortAndFiltersRowHeight, 
                selectedValue = v12.selectedValue, 
                onActivated = function(v20)
                    if v12.setSelectedValue then
                        v12.setSelectedValue(v20);
                    end;
                end, 
                useDefaultControlState = v16, 
                onHeightChanged = function(v21)
                    v18(v21);
                    if v12.onHeightChanged then
                        v12.onHeightChanged((v21 + 19) + v9.Offset);
                    end;
                end
            })
        })
    });
end;
