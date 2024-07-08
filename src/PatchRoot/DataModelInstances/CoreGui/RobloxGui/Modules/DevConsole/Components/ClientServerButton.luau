local v0 = require(game:GetService("CorePackages").Roact);
local v1 = require(script.Parent.Parent.Constants);
local l_FrameHeight_0 = v1.UtilityBarFormatting.FrameHeight;
local l_SmallFrameHeight_0 = v1.UtilityBarFormatting.SmallFrameHeight;
local l_ClientServerButtonWidth_0 = v1.UtilityBarFormatting.ClientServerButtonWidth;
local l_ClientServerDropDownWidth_0 = v1.UtilityBarFormatting.ClientServerDropDownWidth;
local l_UtilBar_0 = v1.Font.UtilBar;
local l_UtilBar_1 = v1.DefaultFontSize.UtilBar;
local l_Text_0 = v1.Color.Text;
local v9 = require(script.Parent.FullScreenDropDownButton);
local v10 = require(script.Parent.DropDown);
local v11 = UDim2.new(0, l_ClientServerButtonWidth_0, 0, l_FrameHeight_0);
local v12 = {
    "Client", 
    "Server"
};
local v13 = v0.Component:extend("ClientServerButton");
v13.init = function(v14)
    v14.dropDownCallback = function(v15)
        if v15 == 1 then
            v14.props.onClientButton();
            return ;
        else
            if v15 == 2 then
                v14.props.onServerButton();
            end;
            return ;
        end;
    end;
end;
v13.render = function(v16)
    local l_formFactor_0 = v16.props.formFactor;
    local l_useDropDown_0 = v16.props.useDropDown;
    local l_isClientView_0 = v16.props.isClientView;
    local l_layoutOrder_0 = v16.props.layoutOrder;
    local l_onServerButton_0 = v16.props.onServerButton;
    local l_onClientButton_0 = v16.props.onClientButton;
    local l_SelectedBlue_0 = v1.Color.SelectedBlue;
    local l_UnselectedGray_0 = v1.Color.UnselectedGray;
    if l_isClientView_0 then
        l_UnselectedGray_0 = v1.Color.SelectedBlue;
        l_SelectedBlue_0 = v1.Color.UnselectedGray;
    end;
    if l_formFactor_0 == v1.FormFactor.Small then
        return v0.createElement(v9, {
            buttonSize = UDim2.new(0, l_ClientServerDropDownWidth_0, 0, l_SmallFrameHeight_0), 
            dropDownList = v12, 
            selectedIndex = not l_isClientView_0 and 2 or 1, 
            onSelection = v16.dropDownCallback, 
            layoutOrder = l_layoutOrder_0
        });
    elseif not l_useDropDown_0 then
        return v0.createElement("Frame", {
            Size = UDim2.new(0, 2 * l_ClientServerButtonWidth_0, 0, l_FrameHeight_0), 
            BackgroundTransparency = 1, 
            LayoutOrder = l_layoutOrder_0
        }, {
            ClientButton = v0.createElement("TextButton", {
                Text = v12[1], 
                TextSize = l_UtilBar_1, 
                TextColor3 = l_Text_0, 
                Font = l_UtilBar_0, 
                Size = v11, 
                AutoButtonColor = false, 
                BackgroundColor3 = l_UnselectedGray_0, 
                BackgroundTransparency = 0, 
                LayoutOrder = 1, 
                [v0.Event.Activated] = l_onClientButton_0
            }), 
            ServerButton = v0.createElement("TextButton", {
                Text = v12[2], 
                TextSize = l_UtilBar_1, 
                TextColor3 = l_Text_0, 
                Font = l_UtilBar_0, 
                Size = v11, 
                AutoButtonColor = false, 
                Position = UDim2.new(0, l_ClientServerButtonWidth_0, 0, 0), 
                BackgroundColor3 = l_SelectedBlue_0, 
                BackgroundTransparency = 0, 
                LayoutOrder = 2, 
                [v0.Event.Activated] = l_onServerButton_0
            })
        });
    else
        return v0.createElement(v10, {
            buttonSize = UDim2.new(0, l_ClientServerDropDownWidth_0, 0, l_SmallFrameHeight_0), 
            dropDownList = v12, 
            selectedIndex = not l_isClientView_0 and 2 or 1, 
            onSelection = v16.dropDownCallback, 
            layoutOrder = l_layoutOrder_0
        });
    end;
end;
return v13;
