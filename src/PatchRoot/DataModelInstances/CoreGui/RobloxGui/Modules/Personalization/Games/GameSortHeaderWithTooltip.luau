local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_GetTextSize_0 = require(l_CorePackages_0.Workspace.Packages.Style).GetTextSize;
local v4 = require(l_CorePackages_0.UIBlox);
local l_StyledTextLabel_0 = v4.App.Text.StyledTextLabel;
local l_Button_0 = v4.App.Button.Button;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_Images_0 = v4.App.ImageSet.Images;
local _ = v4.Core.ImageSet.ImageSetLabel;
local _ = v4.Core.Control.Interactable;
local l_useStyle_0 = v4.Core.Style.useStyle;
local _ = v4.App.Dialog.TooltipV2.withHoverTooltip;
local l_TooltipOrientation_0 = v4.App.Dialog.Enum.TooltipOrientation;
local l_IconWithTooltip_0 = require(l_CorePackages_0.Workspace.Packages.AppBlox).IconWithTooltip;
local l_GetFFlagLuaAppSortSubtitlesEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppSortSubtitlesEnabled;
local l_GetFFlagLuaAppSortTooltipEnableVR_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppSortTooltipEnableVR;
local v17 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppLinkSortTitle);
local v18 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppCountdownSubtitle);
local _ = l_Images_0["icons/actions/info"];
local v20 = Vector2.new(math.huge, math.huge);
return function(v21)
    local v22 = l_useStyle_0();
    local l_CaptionHeader_0 = v22.Font.CaptionHeader;
    local v24 = UDim2.fromOffset(l_GetTextSize_0(v21.buttonText, l_CaptionHeader_0.RelativeSize * v22.Font.BaseSize, l_CaptionHeader_0.Font, v20).X + 16, 28);
    local l_onSeeAll_0 = v21.onSeeAll;
    local v26 = not not l_onSeeAll_0 and (v21.buttonText and true or false);
    local v27 = if not v26 then UDim2.new() else v24;
    local v28 = (l_GetFFlagLuaAppSortSubtitlesEnabled_0() and v21.subtitleText) and v21.subtitleText ~= "";
    local v29 = 28;
    local v30 = nil;
    if v28 then
        if not v18 then
            v29 = v29 + 22;
        else
            v29 = v29 + 30;
            if type(v21.subtitleText) == "string" then
                v30 = v2.createElement("TextLabel", {
                    TextSize = 14, 
                    Size = UDim2.new(1, 0, 0, 14), 
                    Text = v21.subtitleText, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Position = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0, 1), 
                    BackgroundTransparency = 1, 
                    Font = v22.Font.Body.Font, 
                    TextColor3 = v22.Theme.TextDefault.Color
                });
            elseif type(v21.subtitleText) == "table" then
                v30 = v21.subtitleText;
            end;
        end;
    end;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v29), 
        BackgroundTransparency = 1, 
        LayoutOrder = v21.layoutOrder, 
        ZIndex = 2
    }, {
        ResponsiveCarouselHeaderPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v21.headerMargin), 
            PaddingRight = UDim.new(0, v21.headerMargin)
        }), 
        ResponsiveCarouselHeaderMaxWidth = if v21.headerWidth > 0 then v2.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(v21.headerWidth, 28)
        }) else nil, 
        ResponsiveCarouselTitleAndTooltip = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 28), 
            BackgroundTransparency = 1, 
            LayoutOrder = v21.layoutOrder
        }, {
            ResponsiveCarouselTitleLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 4)
            }), 
            ResponsiveCarouselTitle = if not v17 then v2.createElement(l_StyledTextLabel_0, {
                text = v21.title, 
                automaticSize = Enum.AutomaticSize.XY, 
                textXAlignment = Enum.TextXAlignment.Left, 
                textYAlignment = Enum.TextYAlignment.Center, 
                fontStyle = v22.Font.Header1, 
                colorStyle = v22.Theme.TextEmphasis, 
                textTruncate = Enum.TextTruncate.AtEnd
            }) else v2.createElement("TextButton", {
                Text = v21.title, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Font = v22.Font.Header1.Font, 
                TextSize = v22.Font.BaseSize * v22.Font.Header1.RelativeSize, 
                TextColor3 = v22.Theme.TextEmphasis.Color or v22.Theme.TextEmphasis.Color3, 
                TextWrapped = false, 
                BackgroundTransparency = 1, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                AutoButtonColor = false, 
                Active = v21.onActivateTitle ~= nil, 
                [v2.Event.Activated] = v21.onActivateTitle
            }), 
            GameSortTooltip = if not l_GetFFlagLuaAppSortSubtitlesEnabled_0() then v2.createElement(l_IconWithTooltip_0, {
                tooltipOrientation = l_TooltipOrientation_0.Right, 
                hoverText = v21.tooltipHoverText, 
                triggerPointName = "GameSortTooltip", 
                onActivateTooltip = if not l_GetFFlagLuaAppSortTooltipEnableVR_0() then nil else v21.onActivateTooltip, 
                supportVR = if not l_GetFFlagLuaAppSortTooltipEnableVR_0() then nil else v21.supportVR
            }) else not not v21.tooltipHoverText and v2.createElement(l_IconWithTooltip_0, {
                tooltipOrientation = l_TooltipOrientation_0.Right, 
                hoverText = v21.tooltipHoverText, 
                triggerPointName = "GameSortTooltip", 
                onActivateTooltip = if not l_GetFFlagLuaAppSortTooltipEnableVR_0() then nil else v21.onActivateTooltip, 
                supportVR = if not l_GetFFlagLuaAppSortTooltipEnableVR_0() then nil else v21.supportVR
            }) or nil
        }), 
        Subtitle = if not not v18 and v30 then v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 14), 
            Position = UDim2.new(0, 0, 1, -8), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = 1
        }, {
            SubtitleElement = v30
        }) else if v28 then v2.createElement("TextLabel", {
            TextSize = 14, 
            Size = UDim2.new(1, 0, 0, 14), 
            Text = v21.subtitleText, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = 1, 
            Font = v22.Font.Body.Font, 
            TextColor3 = v22.Theme.TextDefault.Color
        }) else nil, 
        ResponsiveCarouselSeeAll = if not v26 then nil else v2.createElement(l_Button_0, {
            buttonType = l_ButtonType_0.Secondary, 
            position = UDim2.new(1, -v27.X.Offset, 0, 0), 
            size = v27, 
            text = v21.buttonText, 
            fontStyle = v22.Font.CaptionHeader, 
            onActivated = l_onSeeAll_0
        })
    });
end;
