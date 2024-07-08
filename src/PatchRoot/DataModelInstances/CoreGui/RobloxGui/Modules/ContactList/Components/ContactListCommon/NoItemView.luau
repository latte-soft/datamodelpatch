local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_GetFFlagIrisUseLocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIrisUseLocalizationProvider;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v5 = require(l_RobloxGui_0.Modules.ContactList.dependencies);
local l_UIBlox_0 = v5.UIBlox;
local v7 = nil;
local v8 = nil;
if not l_GetFFlagIrisUseLocalizationProvider_0() then
    v8 = require(l_RobloxGui_0.Modules.RobloxTranslator);
else
    v7 = v5.Hooks.useLocalization;
end;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
return function(v12)
    local v13 = l_useStyle_0();
    local l_Font_0 = v13.Font;
    local l_Theme_0 = v13.Theme;
    local v16 = nil;
    if l_GetFFlagIrisUseLocalizationProvider_0() then
        v16 = v7({
            failedLabel = "Feature.Call.Label.Retry", 
            placeCallLabel = "Feature.Call.Prompt.StartCall"
        });
    end;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = 10000
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, 20), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 12), 
            PaddingBottom = UDim.new(0, 12), 
            PaddingLeft = UDim.new(0, 24), 
            PaddingRight = UDim.new(0, 24)
        }), 
        Image = if not v12.isImageEnabled then nil else v2.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Image = l_Images_0[v12.imageName], 
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(96, 96)
        }), 
        Message = v2.createElement("TextLabel", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Font = l_Font_0.Body.Font, 
            LayoutOrder = 2, 
            Text = v12.messageText, 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            TextSize = l_Font_0.Body.RelativeSize * l_Font_0.BaseSize, 
            TextTransparency = l_Theme_0.TextDefault.Transparency, 
            TextWrapped = true
        }), 
        FailedButton = if not v12.isFailedButtonEnabled then nil else v2.createElement("TextButton", {
            Size = UDim2.new(0, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundColor3 = l_Theme_0.SystemPrimaryDefault.Color, 
            BackgroundTransparency = l_Theme_0.SystemPrimaryDefault.Transparency, 
            BorderSizePixel = 0, 
            Font = l_Font_0.Header2.Font, 
            LayoutOrder = 3, 
            Text = if not l_GetFFlagIrisUseLocalizationProvider_0() then v8:FormatByKey("Feature.Call.Label.Retry") else v16.failedLabel, 
            TextColor3 = l_Theme_0.SystemPrimaryContent.Color, 
            TextSize = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize, 
            TextTransparency = l_Theme_0.SystemPrimaryContent.Transparency, 
            [v2.Event.Activated] = v12.onFailedButtonActivated
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            UIPadding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 8), 
                PaddingRight = UDim.new(0, 8)
            }), 
            UISizeConstraint = v2.createElement("UISizeConstraint", {
                MinSize = Vector2.new(108, 36)
            })
        }), 
        CallButton = if not v12.isCallButtonEnabled then nil else v2.createElement("ImageButton", {
            Size = UDim2.new(1, 0, 0, 48), 
            BackgroundColor3 = l_Theme_0.SystemPrimaryDefault.Color, 
            BackgroundTransparency = l_Theme_0.SystemPrimaryDefault.Transparency, 
            BorderSizePixel = 0, 
            LayoutOrder = 3, 
            [v2.Event.Activated] = v12.onCallButtonActivated
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 4), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            StartCallIcon = v2.createElement(l_ImageSetLabel_0, {
                Size = UDim2.fromOffset(24, 24), 
                BackgroundTransparency = 1, 
                Image = "rbxassetid://15239343417", 
                ImageColor3 = l_Theme_0.SystemPrimaryContent.Color, 
                LayoutOrder = 1
            }), 
            StartCallButtonText = v2.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                Font = l_Font_0.Header2.Font, 
                LayoutOrder = 2, 
                Text = if not l_GetFFlagIrisUseLocalizationProvider_0() then v8:FormatByKey("Feature.Call.Prompt.StartCall") else v16.placeCallLabel, 
                TextColor3 = l_Theme_0.SystemPrimaryContent.Color, 
                TextSize = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize, 
                TextTransparency = l_Theme_0.SystemPrimaryContent.Transparency
            })
        })
    });
end;
