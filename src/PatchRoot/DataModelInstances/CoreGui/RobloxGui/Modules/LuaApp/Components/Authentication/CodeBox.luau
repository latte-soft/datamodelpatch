local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local _ = require(l_Modules_0.Common.RoactRodux);
local _ = require(l_Modules_0.LuaApp.Themes.Colors);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v6 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local l_GenericTextBox_0 = v6.Components.GenericTextBox;
local l_AuthStatefulRoundCornerBorder_0 = v6.Components.AuthStatefulRoundCornerBorder;
local v9 = v2.PureComponent:extend("CodeBox");
v9.defaultProps = {
    TextInputType = Enum.TextInputType.Number
};
v9.init = function(v10)
    v10:setState({
        isFocused = false
    });
    local v11, v12 = v2.createBinding("");
    v10.CurrentText = v11;
    v10.UpdateCurrentText = v12;
    v10.textBoxRef = v2.createRef();
    v10.onChangeText = function(v13)
        local l_Text_0 = v13.Text;
        if v10.props.textFilter then
            l_Text_0 = l_Text_0:gsub(v10.props.textFilter, "");
        end;
        if v10.props.characterCount and v10.props.characterCount < #l_Text_0 then
            l_Text_0 = l_Text_0:sub(1, v10.props.characterCount);
        end;
        if l_Text_0 ~= v13.Text then
            v13.Text = l_Text_0;
            return ;
        else
            if v10.props.onValueChanged then
                v10.props.onValueChanged(v13.Text);
            end;
            return ;
        end;
    end;
    v10.onFocused = function(v15)
        spawn(function()
            if v10.isMounted then
                v10:setState({
                    isFocused = v15:isFocused()
                });
            end;
        end);
        if v10.props.onFocused then
            v10.props.onFocused(v15);
        end;
    end;
    v10.onFocusLost = function(v16, v17, v18)
        spawn(function()
            if v10.isMounted then
                v10:setState({
                    isFocused = v16:isFocused()
                });
            end;
        end);
        if v10.props.onFocusLost then
            v10.props.onFocusLost(v16, v17, v18);
        end;
    end;
end;
v9.didMount = function(v19)
    v19.isMounted = true;
    spawn(function()
        if not ((not v19.isMounted or not v19.props.shouldFocus) or not v19.textBoxRef.current) then
            v19.textBoxRef.current:CaptureFocus();
        end;
    end);
end;
v9.willUnmount = function(v20)
    v20.isMounted = false;
end;
v9.didUpdate = function(v21, v22, _)
    if not ((not v21.textBoxRef.current or v22.shouldFocus) or not v21.props.shouldFocus) then
        v21.UpdateCurrentText("");
        v21.textBoxRef.current:CaptureFocus();
    end;
end;
v9.render = function(v24)
    return l_withStyle_0(function(v25)
        return v2.createElement(l_AuthStatefulRoundCornerBorder_0, {
            size = UDim2.new(1, 0, 0, 36), 
            borderState = (not not v24.props.errorState and l_AuthStatefulRoundCornerBorder_0.BorderState.Error or v24.state.isFocused and l_AuthStatefulRoundCornerBorder_0.BorderState.Focused) or l_AuthStatefulRoundCornerBorder_0.BorderState.Default
        }, {
            v2.createElement(l_GenericTextBox_0, {
                Active = false, 
                Size = UDim2.new(1, 0, 1, 0), 
                Color = v25.Theme.BackgroundUIContrast.Color, 
                Font = v25.Font.Body.Font, 
                Transparency = v25.Theme.BackgroundUIContrast.Transparency, 
                TextSize = 16, 
                TextColor = v25.Theme.TextDefault.Color, 
                PlaceholderColor = v25.Theme.BackgroundUIDefault.Color, 
                TextTransparency = v25.Theme.TextDefault.Transparency, 
                Text = v24.CurrentText, 
                TextEditable = v24.props.TextEditable, 
                PlaceholderText = v24.props.PlaceholderText, 
                TextInputType = v24.props.TextInputType, 
                TextBoxRef = v24.textBoxRef, 
                ClearTextOnFocus = false, 
                onChangeText = v24.onChangeText, 
                onFocused = v24.onFocused, 
                onFocusLost = v24.onFocusLost, 
                ManualFocusRelease = v24.props.ManualFocusRelease
            })
        });
    end);
end;
return v9;
