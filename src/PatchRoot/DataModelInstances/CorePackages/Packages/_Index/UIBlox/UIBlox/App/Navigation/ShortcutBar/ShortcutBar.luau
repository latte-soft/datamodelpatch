local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v4 = require(l_Parent_2.React);
local v5 = require(l_Parent_2.ReactOtter);
local v6 = require(l_Parent_2.ReactUtils);
local l_useDelayedActionHandler_0 = v6.useDelayedActionHandler;
local l_useEventConnection_0 = v6.useEventConnection;
local l_Object_0 = require(l_Parent_2.LuauPolyfill).Object;
local v10 = require(l_Parent_1.Core.Style.useStyle);
local _ = require(script.Parent.Types);
local v12 = require(script.Parent.Shortcut);
local v13 = require(l_Parent_1.Utility.useInputType);
local v14 = require(l_Parent_1.UIBloxConfig);
local v15 = require(l_Parent_0.Utilities);
local _ = require(l_Parent_1.Enums.InputType);
local v17 = {
    dampingRatio = 2, 
    frequency = 3
};
local v18 = {
    items = {}, 
    spacingTop = 12, 
    spacingTrailing = 30, 
    spacingBottom = 12, 
    spacingLeading = 18, 
    itemsGap = 24, 
    itemIconLabelGap = 6, 
    actionTextSpacingLeading = 12
};
return function(v19)
    local v20 = l_Object_0.assign({}, v18, v19);
    local v21 = v10();
    local v22 = {
        UICorner = v4.createElement("UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        }), 
        Padding = v4.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v20.spacingTop), 
            PaddingRight = UDim.new(0, v20.spacingTrailing), 
            PaddingBottom = UDim.new(0, v20.spacingBottom), 
            PaddingLeft = UDim.new(0, v20.spacingLeading)
        }), 
        ListLayout = v4.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v20.itemsGap)
        })
    };
    if not v14.useInputResponsiveShortcutBarChanges then
        for v23, v24 in ipairs(v20.items) do
            v22["Item" .. tostring(v23)] = v4.createElement(v12, {
                index = v23, 
                iconLabelGap = v20.itemIconLabelGap, 
                actionTextSpacingLeading = v20.actionTextSpacingLeading, 
                publicProps = v24
            });
        end;
        return v4.createElement("Frame", {
            Position = v20.position, 
            AnchorPoint = v20.anchorPoint, 
            Size = UDim2.fromOffset(0, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v21.Theme.UIMuted.Color, 
            BackgroundTransparency = v21.Theme.UIMuted.Transparency, 
            AutomaticSize = Enum.AutomaticSize.XY
        }, v22);
    else
        local v25 = v13();
        local v26, v27 = v5.useAnimatedBinding(0);
        local v28 = l_useDelayedActionHandler_0(not v20.transitionDelaySeconds and 0 or v20.transitionDelaySeconds, 0.1, function()
            v27(v5.spring(0, v17));
        end);
        local function v29()
            if v20.transitionDelaySeconds then
                v27(v5.spring(1, v17));
                v28();
            end;
        end;
        local v30, v31 = v4.useState(v15.filterItems(v20.items, v25));
        l_useEventConnection_0(l_UserInputService_0.InputChanged, v29);
        v4.useEffect(function()
            v31(v15.filterItems(v20.items, v25));
        end, {
            v25, 
            v20.items
        });
        for v32, v33 in ipairs(v30) do
            v22["Item" .. tostring(v32)] = v4.createElement(v12, {
                index = v32, 
                iconLabelGap = v20.itemIconLabelGap, 
                actionTextSpacingLeading = v20.actionTextSpacingLeading, 
                publicProps = v33
            });
        end;
        if #v30 > 0 then
            return v4.createElement("CanvasGroup", {
                Position = v20.position, 
                AnchorPoint = v20.anchorPoint, 
                BackgroundTransparency = 1, 
                GroupTransparency = not v20.transitionDelaySeconds and 0 or v26, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                ShortcutBarComponent = v4.createElement("Frame", {
                    Size = UDim2.fromOffset(0, 0), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v21.Theme.UIMuted.Color, 
                    BackgroundTransparency = v21.Theme.UIMuted.Transparency, 
                    AutomaticSize = Enum.AutomaticSize.XY
                }, v22)
            });
        else
            return nil;
        end;
    end;
end;
