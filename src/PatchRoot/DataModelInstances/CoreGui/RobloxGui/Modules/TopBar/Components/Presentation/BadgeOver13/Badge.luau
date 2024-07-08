local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_createElement_0 = v1.createElement;
local v5 = require(l_CorePackages_0.UIBlox);
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_Interactable_0 = v5.Core.Control.Interactable;
local l_ControlState_0 = v5.Core.Control.Enum.ControlState;
local l_useDispatch_0 = v2.Hooks.RoactRodux.useDispatch;
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v11 = require(l_Parent_0.Flags.GetFFlagEnableChromeBackwardsSignalAPI)();
local v12 = require(l_Parent_0.Actions.SetKeepOutArea);
local v13 = require(l_Parent_0.Constants);
noop = function()
end;
return function(v14)
    local v15 = l_useStyle_0();
    local v16 = l_useDispatch_0();
    local v17, v18 = v1.useState(false);
    local function v20(v19)
        if not (not v11 or not v19) then
            v16(v12(v13.BadgeOver13KeepOutAreaId, Vector2.new(v19.AbsolutePosition.X - 2, v19.AbsolutePosition.Y - 2), (Vector2.new(v19.AbsoluteSize.X + 4, v19.AbsoluteSize.Y + 4))));
        end;
    end;
    return l_createElement_0(l_Interactable_0, {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        isDisabled = false, 
        LayoutOrder = v14.layoutOrder, 
        onStateChanged = v1.useCallback(function(_, v22)
            local l_v18_0 = v18;
            local v24 = true;
            if v22 ~= l_ControlState_0.Hover then
                v24 = v22 == l_ControlState_0.Pressed;
            end;
            l_v18_0(v24);
        end), 
        [v1.Event.Activated] = v1.useCallback(function()
            v14.setIsPopupVisible(not v14.isPopupVisible);
        end), 
        [v1.Change.AbsoluteSize] = v20, 
        [v1.Change.AbsolutePosition] = v20
    }, {
        constraint = l_createElement_0("UISizeConstraint", {
            MinSize = Vector2.new(32, 32)
        }), 
        text = l_createElement_0("TextLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Text = "13+", 
            Font = l_AppFonts_0.default:getBold(), 
            TextSize = 12, 
            BackgroundColor3 = v15.Theme.TextEmphasis.Color, 
            BackgroundTransparency = if not v17 then v15.Theme.TextEmphasis.Transparency else 0.25, 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            padding = l_createElement_0("UIPadding", {
                PaddingTop = UDim.new(0, 3), 
                PaddingBottom = UDim.new(0, 3), 
                PaddingLeft = UDim.new(0, 6), 
                PaddingRight = UDim.new(0, 6)
            }), 
            shape = l_createElement_0("UICorner", {
                CornerRadius = UDim.new(0, 4)
            }), 
            stroke = l_createElement_0("UIStroke", {
                Thickness = 2, 
                Color = v15.Theme.BackgroundMuted.Color, 
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            })
        })
    });
end;
