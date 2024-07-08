local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("CoreGui").RobloxGui;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(script.Parent.Parent.Constants);
local v4 = v2.Component:extend("CheckBoxDropDown");
v4.render = function(v5)
    local v6 = v5.props[v2.Children] or {};
    local l_absolutePosition_0 = v5.props.absolutePosition;
    local l_frameWidth_0 = v5.props.frameWidth;
    local l_elementHeight_0 = v5.props.elementHeight;
    local l_numElements_0 = v5.props.numElements;
    local l_dropdownTargetGui_0 = v5.props.dropdownTargetGui;
    local l_onCloseCheckBox_0 = v5.props.onCloseCheckBox;
    local v13 = l_elementHeight_0 * l_numElements_0;
    return v2.createElement(v2.Portal, {
        target = l_dropdownTargetGui_0 ~= nil and l_dropdownTargetGui_0 or game:GetService("CoreGui").DevConsoleMaster
    }, {
        InputCatcher = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1, 
            [v2.Event.InputEnded] = l_onCloseCheckBox_0
        }, {
            OuterFrame = v2.createElement("ImageButton", {
                Size = UDim2.new(0, l_frameWidth_0, 0, 24 + v13), 
                AutoButtonColor = false, 
                Position = l_absolutePosition_0, 
                BackgroundColor3 = v3.Color.TextBoxGray, 
                BackgroundTransparency = 0
            }, {
                innerFrame = v2.createElement("Frame", {
                    Position = UDim2.new(0, 12, 0, 12), 
                    Size = UDim2.new(0, l_frameWidth_0, 0, v13), 
                    BackgroundTransparency = 1
                }, v6)
            })
        })
    });
end;
return v4;
