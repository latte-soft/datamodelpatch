local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_ButtonStack_0 = v5.App.Button.ButtonStack;
local l_Enum_0 = v5.App.Button.Enum;
local l_useEffect_0 = v4.useEffect;
local v11 = {
    bodyText = "Placeholder body", 
    denyText = "TempDeny", 
    acceptText = "TempAccept", 
    onHeightChanged = function(_)
    end, 
    onAccepted = nil, 
    onDenied = nil
};
return function(v12)
    local v13 = v3.Dictionary.join(v11, v12);
    local v14 = v13.style or l_useStyle_0();
    local l_Space_100_0 = v14.Tokens.Global.Space_100;
    local l_Size_500_0 = v14.Tokens.Global.Size_500;
    l_useEffect_0(function()
        return function()
            v13.onHeightChanged(0);
        end;
    end, {});
    return v4.createElement("Frame", {
        BackgroundTransparency = v14.Theme.SystemPrimaryContent.Transparency, 
        BackgroundColor3 = v14.Theme.SystemPrimaryContent.Color, 
        BorderSizePixel = 0, 
        LayoutOrder = v13.layoutOrder, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        [v4.Change.AbsoluteSize] = function(v17)
            v13.onHeightChanged(v17.AbsoluteSize.Y);
        end
    }, {
        ContentPadding = v4.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_Space_100_0), 
            PaddingBottom = UDim.new(0, l_Space_100_0), 
            PaddingLeft = UDim.new(0, l_Space_100_0), 
            PaddingRight = UDim.new(0, l_Space_100_0)
        }), 
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, l_Space_100_0), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        Body = v4.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            TextSize = v14.Font.Body.RelativeSize * v14.Font.BaseSize, 
            Font = v14.Font.Body.Font, 
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Text = v13.bodyText, 
            TextWrapped = true, 
            TextColor3 = v14.Theme.TextDefault.Color, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        }), 
        Buttons = v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, l_Size_500_0)
        }, {
            ButtonStack = v4.createElement(l_ButtonStack_0, {
                forcedFillDirection = Enum.FillDirection.Horizontal, 
                buttons = {
                    {
                        buttonType = l_Enum_0.ButtonType.Secondary, 
                        props = {
                            onActivated = v13.onDenied, 
                            text = v13.denyText, 
                            isDisabled = v13.loading
                        }
                    }, 
                    {
                        buttonType = l_Enum_0.ButtonType.PrimarySystem, 
                        props = {
                            onActivated = v13.onAccepted, 
                            text = v13.acceptText, 
                            isDisabled = v13.loading
                        }
                    }
                }
            })
        })
    });
end;
