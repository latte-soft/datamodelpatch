local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v3 = require(l_CorePackages_0.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_ScrollBarType_0 = v3.App.Container.Enum.ScrollBarType;
local l_VerticalScrollView_0 = v3.App.Container.VerticalScrollView;
local l_useCursor_0 = v3.App.SelectionCursor.useCursor;
local v9 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.FocusFrame);
local v10 = require(script.Parent.Flags.FFlagExperienceDetailsTextUseTokens);
local v11 = require(script.Parent.Flags.FFlagEDPDescriptionFocusHideControllerBar10ft);
local function v19(v12)
    local v13 = l_useStyle_0();
    local l_PanelRadius_0 = l_useDesignTokens_0().LuaApps.ExperienceDetails.PanelRadius;
    local v15 = v1.useRef(nil);
    local v16 = v1.useRef(nil);
    v1.useEffect(function()
        if v15.current then
            for _, v18 in v15.current:GetDescendants() do
                if v18:IsA("GuiObject") then
                    if not (v18 == v16.current) or not v12.selectable then
                        v18.Selectable = false;
                    else
                        v18.Selectable = true;
                    end;
                end;
            end;
        end;
    end);
    return v1.createElement(not v12.useCanvasGroup and "Frame" or "CanvasGroup", {
        ref = v15, 
        Position = UDim2.new(), 
        Size = UDim2.fromScale(1, 1), 
        BackgroundColor3 = v13.Theme.BackgroundUIContrast.Color, 
        BackgroundTransparency = v13.Theme.BackgroundUIContrast.Transparency, 
        SelectionGroup = true, 
        SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorUp = Enum.SelectionBehavior.Stop
    }, {
        Corner = v1.createElement("UICorner", {
            CornerRadius = UDim.new(0, l_PanelRadius_0)
        }), 
        ScrollView = v1.createElement(l_VerticalScrollView_0, {
            ref = v16, 
            canvasSizeY = UDim.new(), 
            useAutomaticCanvasSize = true, 
            isGamepadFocusable = true, 
            scrollingEnabled = v12.scrollingEnabled, 
            scrollBarType = if not v12.scrollingEnabled then nil else l_ScrollBarType_0.Gamepad
        }, v12.children)
    });
end;
return v1.forwardRef(function(v20, v21)
    local v22 = l_useStyle_0();
    local v23 = l_useDesignTokens_0();
    local v24 = v23.LuaApps.ExperienceDetails.SafeAreaSize or Vector2.zero;
    local v25 = v23.LuaApps.ExperienceDetails.PanelHeaderMargin or 0;
    return v1.createElement(v9, {
        ref = v21, 
        layoutOrder = v20.layoutOrder, 
        safeAreaSize = UDim2.new(1, -2 * v24.X, 1, -2 * v24.Y), 
        limitInlineHeight = true, 
        renderHeader = v1.useCallback(function(_)
            return {
                v1.createElement(l_StyledTextLabel_0, {
                    text = v20.title, 
                    colorStyle = v22.Theme.TextEmphasis, 
                    fontStyle = if not v10 then v22.Font.Header1 else v23.Semantic.Typography.Header
                }), 
                v1.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, v25)
                })
            };
        end, {
            v20.title, 
            v22
        }), 
        renderContents = v1.useCallback(function(_)
            return v1.createElement("Frame", {
                Position = UDim2.new(), 
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, v20.children);
        end, {
            v20.children
        }), 
        renderContentWrapper = v1.useCallback(function(v28, v29, v30)
            if not (not v11 or not v20.onFocusChanged) then
                v20.onFocusChanged(v29);
            end;
            return v1.createElement(v19, {
                scrollingEnabled = v28, 
                selectable = v29, 
                useCanvasGroup = v20.roundContentCorners or false
            }, v30);
        end, if not v11 then {
            v20.roundContentCorners
        } else {
            v20.roundContentCorners, 
            v20.onFocusChanged
        }), 
        selectionCursor = l_useCursor_0(UDim.new(0, v23.LuaApps.ExperienceDetails.PanelRadius))
    });
end);
