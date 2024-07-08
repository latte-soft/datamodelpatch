local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.Cryo);
local l_Label_0 = require(l_Parent_0.Core.ImageSet.ImageSetComponent).Label;
local v6 = require(l_Parent_0.Core.Style.useStyle);
local _ = require(l_Parent_0.App.ImageSet.ImagesTypes);
local _ = require(l_Parent_0.App.Style.StyleTypes);
local l_withHoverTooltip_0 = require(l_Parent_0.App.Dialog.TooltipV2.Controllers).withHoverTooltip;
local v10 = require(l_Parent_0.App.Dialog.Tooltip.Enum.TooltipOrientation);
local v11 = require(l_Parent_0.Core.Control.StateLayer);
local v12 = require(l_Parent_0.App.Indicator.Badge);
local v13 = {
    tooltipTarget = l_CoreGui_0, 
    disableOutset = false, 
    onMedia = false
};
return function(v14)
    local v15 = v4.Dictionary.join(v13, v14);
    local l_anchorPoint_0 = v15.anchorPoint;
    local l_position_0 = v15.position;
    local l_layoutOrder_0 = v15.layoutOrder;
    local l_icon_0 = v15.icon;
    local l_badgeValue_0 = v15.badgeValue;
    local l_tooltipText_0 = v15.tooltipText;
    local l_tooltipTarget_0 = v15.tooltipTarget;
    local l_disableOutset_0 = v15.disableOutset;
    local l_onMedia_0 = v15.onMedia;
    local l_onActivated_0 = v15.onActivated;
    local l_Tokens_0 = v6().Tokens;
    local l_Size_500_0 = l_Tokens_0.Global.Size_500;
    local l_Medium_0 = l_Tokens_0.Semantic.Icon.Size.Medium;
    local v29 = if not v15.iconColor then if not l_onMedia_0 then l_Tokens_0.Semantic.Color.Icon.Emphasis else l_Tokens_0.Global.Color.White else v15.iconColor;
    local v30 = not l_onMedia_0 and "Standard" or "Darken";
    local v31 = Vector2.new(0, 1);
    local v32 = UDim2.new(0.5, l_Tokens_0.Global.Size_25, 0.5, -l_Tokens_0.Global.Size_25);
    local v33 = v3.useMemo(function()
        if not l_disableOutset_0 then
            return {
                top = UDim.new(0, l_Tokens_0.Global.Size_50), 
                right = UDim.new(0, l_Tokens_0.Global.Size_50), 
                bottom = UDim.new(0, l_Tokens_0.Global.Size_50), 
                left = UDim.new(0, l_Tokens_0.Global.Size_50)
            };
        else
            return nil;
        end;
    end, {
        l_disableOutset_0, 
        l_Tokens_0
    });
    local v35 = v3.useMemo(function()
        local v34 = UDim.new(0, l_Size_500_0);
        if not v33 then
            return (UDim2.new(v34, v34));
        else
            return (UDim2.new((v34 + v33.left) + v33.right, (v34 + v33.top) + v33.bottom));
        end;
    end, {
        l_Size_500_0, 
        v33
    });
    return l_withHoverTooltip_0({
        bodyText = l_tooltipText_0
    }, {
        disabled = not l_tooltipText_0 and true or false, 
        preferredOrientation = v10.Bottom, 
        guiTarget = l_tooltipTarget_0, 
        DEBUG_useTargetDirectly = v15._DEBUG_is_plugin, 
        DisplayOrder = 10
    }, function(v36, v37)
        return v3.createElement("Frame", {
            Selectable = false, 
            Size = v35, 
            AnchorPoint = l_anchorPoint_0, 
            Position = l_position_0, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_layoutOrder_0, 
            [v3.Change.AbsoluteSize] = v36, 
            [v3.Change.AbsolutePosition] = v36
        }, {
            Background = if not l_onMedia_0 then nil else v3.createElement("Frame", {
                Selectable = false, 
                Size = UDim2.fromOffset(l_Size_500_0, l_Size_500_0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BorderSizePixel = 0, 
                BackgroundColor3 = l_Tokens_0.Global.Color.Black.Color3, 
                BackgroundTransparency = 0.5, 
                ZIndex = 1
            }, {
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, l_Tokens_0.Semantic.Radius.Circle)
                })
            }), 
            StateLayer = v3.createElement(v11, {
                size = UDim2.fromOffset(l_Size_500_0, l_Size_500_0), 
                anchorPoint = Vector2.new(0.5, 0.5), 
                position = UDim2.fromScale(0.5, 0.5), 
                cornerRadius = UDim.new(0, l_Tokens_0.Semantic.Radius.Circle), 
                zIndex = 2, 
                stateStyle = v30, 
                outset = v33, 
                onStateChanged = v37, 
                onActivated = l_onActivated_0
            }), 
            Icon = v3.createElement(l_Label_0, {
                Selectable = false, 
                Size = UDim2.fromOffset(l_Medium_0, l_Medium_0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Image = l_icon_0, 
                ImageColor3 = v29.Color3, 
                ImageTransparency = v29.Transparency, 
                BackgroundTransparency = 1, 
                ZIndex = 3
            }, {
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, l_Tokens_0.Semantic.Radius.Circle)
                }), 
                Badge = if not l_badgeValue_0 then nil else v3.createElement(v12, {
                    position = v32, 
                    anchorPoint = v31, 
                    value = l_badgeValue_0
                })
            })
        });
    end);
end;
