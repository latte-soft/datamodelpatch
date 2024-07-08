local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v2.Style.withStyle;
local l_useSelectionCursor_0 = v2.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v2.App.SelectionImage.CursorKind;
local l_GetFFlagEndOfScrollCursor_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEndOfScrollCursor;
local v7 = require(l_Modules_0.Common.Roact);
local v8 = require(l_Modules_0.LuaApp.Components.LocalizedTextButton);
return function(v9)
    local l_backToTopCallback_0 = v9.backToTopCallback;
    local l_LayoutOrder_0 = v9.LayoutOrder;
    local v12 = if not l_GetFFlagEndOfScrollCursor_0() then nil else l_useSelectionCursor_0(l_CursorKind_0.RoundedRect);
    local v13 = v9.bottomPadding or 0;
    return l_withStyle_0(function(v14)
        return v7.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 70 + v13), 
            LayoutOrder = l_LayoutOrder_0
        }, {
            BackToTopButton = v7.createElement(v8, {
                Size = UDim2.new(0.5, 0, 0, 30), 
                Position = UDim2.new(0.25, 0, 0, 20), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = "Feature.GamePage.Action.BackToTop", 
                Font = v14.Font.Body.Font, 
                TextSize = v14.Font.BaseSize * v14.Font.Body.RelativeSize, 
                TextColor3 = v14.Theme.TextEmphasis.Color, 
                TextTransparency = v14.Theme.TextEmphasis.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                [v7.Event.Activated] = l_backToTopCallback_0, 
                SelectionImageObject = if not l_GetFFlagEndOfScrollCursor_0() then nil else v12
            })
        });
    end);
end;
