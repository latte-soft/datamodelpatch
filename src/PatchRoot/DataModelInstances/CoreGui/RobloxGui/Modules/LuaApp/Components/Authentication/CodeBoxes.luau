local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_Modules_0.Common.Roact);
local v5 = require(l_Modules_0.Common.RoactRodux);
local v6 = require(l_Modules_0.LuaApp.Components.GenericTextButton);
local v7 = require(l_Modules_0.LuaApp.Themes.Colors);
local v8 = v4.Component:extend("CodeBoxes");
v8.defaultProps = {
    characterCount = 6, 
    value = "", 
    Transparency = 0
};
v8.init = function(v9)
    v9.state = {
        textCursorVisible = true, 
        textBoxOffset = 1000
    };
    v9.textBoxRef = v4.createRef();
    v9.onTextChanged = function(v10, v11)
        local v12 = v10.Text:gsub("[^%d]", "");
        if v11 < #v10.Text then
            v12 = v12:sub(1, v11);
        end;
        if v10.Text ~= v12 then
            v10.Text = v12;
            return ;
        else
            if v9.props.onValueChanged then
                v9.props.onValueChanged(v12);
            end;
            if not (not (#v10.Text == v11) or not v9.props.onAllBoxesFilled) then
                v9.props.onAllBoxesFilled();
            end;
            return ;
        end;
    end;
    v9.onCodeBoxActivated = function(_)
        local l_textBoxRef_0 = v9.textBoxRef;
        if l_textBoxRef_0 then
            if l_textBoxRef_0.current then
                l_textBoxRef_0.current:CaptureFocus();
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    v9.updateTextBoxOffset = function(v15)
        if not (not v9.mounted or not v9.props.screenHeight) then
            v9:setState({
                textBoxOffset = (v9.props.screenHeight - v15.AbsolutePosition.Y) + 100
            });
        end;
    end;
end;
v8.didMount = function(v16)
    v16.mounted = true;
    spawn(function()
        if not ((not v16.mounted or not v16.props.shouldFocus) or not v16.textBoxRef.current) then
            v16.textBoxRef.current:CaptureFocus();
        end;
        while v16.mounted do
            v16:setState({
                textCursorVisible = not v16.state.textCursorVisible
            });
            wait(0.5);
        end;
    end);
end;
v8.willUnmount = function(v17)
    v17.mounted = false;
end;
v8.didUpdate = function(v18, v19, _)
    if not ((not v18.textBoxRef.current or v19.shouldFocus) or not v18.props.shouldFocus) then
        v18.textBoxRef.current:CaptureFocus();
    end;
end;
v8.render = function(v21)
    local l_characterCount_0 = v21.props.characterCount;
    local l_LayoutOrder_0 = v21.props.LayoutOrder;
    local l_value_0 = v21.props.value;
    local l_Transparency_0 = v21.props.Transparency;
    local l_textBoxRef_1 = v21.textBoxRef;
    local l_onInvisibleTextBoxAncestryChanged_0 = v21.props.onInvisibleTextBoxAncestryChanged;
    local l_onInvisibleTextBoxFocused_0 = v21.props.onInvisibleTextBoxFocused;
    local v29 = 0.3 + l_Transparency_0 * 0.7;
    local v30 = {
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 13)
        })
    };
    local v31 = UDim2.new(1 / l_characterCount_0, 13 / (l_characterCount_0 + 1) - 13, 1, 0);
    for v32 = 1, l_characterCount_0 do
        local v33 = l_value_0:sub(v32, v32) or "";
        if (not (not l_textBoxRef_1 or not l_textBoxRef_1.current) and v32 == #l_value_0 + 1) and l_UserInputService_0:GetFocusedTextBox() == l_textBoxRef_1.current then
            v33 = not v21.state.textCursorVisible and "" or "|";
        end;
        v30[v32] = v4.createElement("Frame", {
            Size = v31, 
            BackgroundTransparency = 1, 
            LayoutOrder = v32
        }, {
            Character = v4.createElement(v6, {
                Size = UDim2.new(1, 0, 1, 0), 
                Text = v33, 
                Font = l_AppFonts_0.default:getDefault(), 
                TextSize = 16, 
                themeSettings = {
                    Color = v7.Black, 
                    Transparency = v29, 
                    OnPressColor = v7.Black, 
                    OnPressTransparency = v29, 
                    Text = {
                        Color = v7.White, 
                        Transparency = l_Transparency_0
                    }, 
                    Border = {
                        Hidden = true, 
                        Transparency = 1
                    }
                }, 
                isDisabled = false, 
                isLoading = false, 
                AutoButtonColor = false, 
                onActivated = v21.onCodeBoxActivated
            })
        });
    end;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 36), 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0, 
        [v4.Change.AbsolutePosition] = v21.updateTextBoxOffset
    }, {
        CodeCharacters = v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 36), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1, 
            ZIndex = 2
        }, v30), 
        InvisibleTextBox = v4.createElement("TextBox", {
            Size = UDim2.new(0, 1, 0, 1), 
            Position = UDim2.new(0, 0, 0, v21.state.textBoxOffset), 
            BackgroundTransparency = 1, 
            TextTransparency = 1, 
            Text = l_value_0, 
            TextSize = 1, 
            OverlayNativeInput = true, 
            ManualFocusRelease = true, 
            ClearTextOnFocus = false, 
            TextInputType = Enum.TextInputType.Number, 
            [v4.Ref] = l_textBoxRef_1, 
            [v4.Change.Text] = function(v34)
                v21.onTextChanged(v34, l_characterCount_0);
            end, 
            [v4.Event.AncestryChanged] = l_onInvisibleTextBoxAncestryChanged_0, 
            [v4.Event.Focused] = l_onInvisibleTextBoxFocused_0
        })
    });
end;
return (v5.connect(function(v35, _)
    return {
        screenHeight = v35.ScreenSize.Y
    };
end)(v8));
