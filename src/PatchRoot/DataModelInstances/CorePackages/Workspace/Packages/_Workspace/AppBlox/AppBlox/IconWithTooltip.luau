local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_Interactable_0 = v3.Core.Control.Interactable;
local l_withHoverTooltip_0 = v3.App.Dialog.TooltipV2.withHoverTooltip;
local l_useCursor_0 = v3.App.SelectionCursor.useCursor;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local l_GetFFlagLuaAppSortTooltipEnableVR_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppSortTooltipEnableVR;
local l_GetFFlagTenFootUiSupportSortHeaderTooltip_0 = require(l_Parent_0.SharedFlags).GetFFlagTenFootUiSupportSortHeaderTooltip;
local l_GetFFlagLuaAppExpandTooltipHitbox_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppExpandTooltipHitbox;
local l_FFlagLuaAppFixCursorHooks_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixCursorHooks;
game:DefineFastInt("TooltipHitboxMinSize", 26);
local v16 = l_Images_0["icons/actions/info"];
local v17 = if not l_GetFFlagLuaAppExpandTooltipHitbox_0() then nil else Vector2.new(game:GetFastInt("TooltipHitboxMinSize"), game:GetFastInt("TooltipHitboxMinSize"));
return function(v18)
    local v19 = l_useUiModeInfo_0();
    local v20 = l_useDesignTokens_0();
    local l_Color3_0 = v20.Semantic.Color.Text.Emphasis.Color3;
    local l_Space_300_0 = v20.Global.Space_300;
    local v23 = nil;
    local v24 = nil;
    if l_GetFFlagTenFootUiSupportSortHeaderTooltip_0() then
        v23 = v20.Semantic.Radius.Circle;
        v24 = v20.Semantic.Offset.Focus.Inset;
    end;
    local v25 = if not not l_FFlagLuaAppFixCursorHooks_0 and l_GetFFlagTenFootUiSupportSortHeaderTooltip_0() then l_useCursor_0(UDim.new(0, v23), v24) else nil;
    local v26 = if not l_GetFFlagLuaAppSortTooltipEnableVR_0() then nil else v19.uiMode == l_UiMode_0.VR;
    if not (v19.uiMode == l_UiMode_0.VR) or v18.supportVR then
        if not (v19.uiMode == l_UiMode_0.TenFoot) or v18.supportTenFootUi then
            local v27 = {
                bodyText = v18.hoverText, 
                useLargeDropShadow = true
            };
            local v28 = {
                preferredOrientation = v18.tooltipOrientation, 
                guiTarget = l_CoreGui_0, 
                DisplayOrder = 10, 
                delayTime = 0.2, 
                triggerPointName = v18.triggerPointName, 
                disabled = if not l_GetFFlagLuaAppSortTooltipEnableVR_0() then nil else v26
            };
            if not l_GetFFlagLuaAppExpandTooltipHitbox_0() then
                return l_withHoverTooltip_0(v27, v28, function(v29, v30)
                    return v2.createElement(l_Interactable_0, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = v18.layoutOrder, 
                        AnchorPoint = v18.anchorPoint, 
                        Position = v18.position, 
                        onStateChanged = v30, 
                        SelectionImageObject = if not l_GetFFlagTenFootUiSupportSortHeaderTooltip_0() then nil else l_useCursor_0(UDim.new(0, v23), v24), 
                        [v2.Change.AbsolutePosition] = v29, 
                        [v2.Change.AbsoluteSize] = v29, 
                        [v2.Event.Activated] = v18.onActivateTooltip
                    }, {
                        TooltipIcon = v2.createElement(l_ImageSetLabel_0, {
                            Size = v18.size or UDim2.new(0, l_Space_300_0, 0, l_Space_300_0), 
                            BackgroundTransparency = 1, 
                            Image = v18.icon or v16, 
                            ImageColor3 = v18.color or l_Color3_0
                        })
                    });
                end);
            else
                local v31 = v18.size or UDim2.new(0, l_Space_300_0, 0, l_Space_300_0);
                return l_withHoverTooltip_0(v27, v28, function(v32, v33)
                    return v2.createElement("Frame", {
                        Size = v31, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = v18.layoutOrder, 
                        AnchorPoint = v18.anchorPoint, 
                        Position = v18.position, 
                        SelectionImageObject = if not not l_FFlagLuaAppFixCursorHooks_0 and l_GetFFlagTenFootUiSupportSortHeaderTooltip_0() then v25 else if l_GetFFlagTenFootUiSupportSortHeaderTooltip_0() then l_useCursor_0(UDim.new(0, v23), v24) else nil, 
                        [v2.Change.AbsolutePosition] = v32, 
                        [v2.Change.AbsoluteSize] = v32
                    }, {
                        TooltipIcon = v2.createElement(l_ImageSetLabel_0, {
                            Size = v31, 
                            BackgroundTransparency = 1, 
                            Image = v18.icon or v16, 
                            ImageColor3 = v18.color or l_Color3_0, 
                            ZIndex = 0
                        }), 
                        Hitbox = v2.createElement(l_Interactable_0, {
                            Size = UDim2.fromScale(1, 1), 
                            BackgroundTransparency = 1, 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            Position = UDim2.fromScale(0.5, 0.5), 
                            onStateChanged = v33, 
                            [v2.Event.Activated] = v18.onActivateTooltip, 
                            ZIndex = 1
                        }, {
                            UISizeConstraint = v2.createElement("UISizeConstraint", {
                                MinSize = v17
                            })
                        })
                    });
                end);
            end;
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
