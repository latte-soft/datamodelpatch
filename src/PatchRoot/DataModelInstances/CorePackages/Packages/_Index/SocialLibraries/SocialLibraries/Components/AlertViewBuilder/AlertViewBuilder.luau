local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_Cryo_0 = v1.Cryo;
local l_UIBlox_0 = v1.UIBlox;
local l_Text_0 = v1.Text;
local l_Components_0 = l_script_FirstAncestor_0.Components;
local v7 = require(l_Components_0.AlertView.AlertViewLabel);
local v8 = require(l_Components_0.AlertView.AlertViewTextbox);
local v9 = require(l_Components_0.AlertView.AlertViewSoakArea);
local v10 = require(script.Parent.Parent.FitFrameVertical);
local l_InteractiveAlert_0 = l_UIBlox_0.App.Dialog.Alert.InteractiveAlert;
local l_CheckboxList_0 = l_UIBlox_0.App.InputButton.CheckboxList;
local v13 = l_Roact_0.Component:extend("AlertViewBuilder");
local v14 = game:DefineFastFlag("AlertViewUseScreenSize", false);
v13.defaultProps = {
    bodyText = "", 
    buttons = {}, 
    checkboxes = {}, 
    textboxes = {}, 
    displayTextbox = false, 
    onActivated = function()
    end, 
    onModalClose = function()
    end, 
    onModalStayOpen = function()
    end, 
    onModalOpen = function()
    end, 
    title = "", 
    checkboxHeight = 50, 
    childComponentWidth = 220, 
    screenSize = Vector2.new(0, 0), 
    soakAreaColor3 = Color3.fromRGB(255, 0, 255), 
    soakAreaTransparency = 0.5, 
    inputLengthExceeded = nil
};
v13.init = function(v15)
    local v16 = {};
    local v17 = 0;
    local v18 = 0;
    for v19, _ in pairs(v15.props.checkboxes) do
        v16[v19] = false;
        v17 = v17 + 1;
    end;
    v15.refs = {};
    for v21, _ in pairs(v15.props.textboxes) do
        v15.refs[v21] = l_Roact_0.createRef();
        v18 = v18 + 1;
    end;
    v15.state = {
        checkboxStatuses = v16, 
        numCheckboxes = v17, 
        numTextboxes = v18
    };
    v15.calcTextboxTextHeight = function(v23, v24)
        local v25 = v23.Font.Body.RelativeSize * v23.Font.BaseSize;
        local l_Font_0 = v23.Font.Body.Font;
        local v27 = 0;
        if v24 and v24 ~= "" then
            v27 = l_Text_0.GetTextHeight(v24, l_Font_0, v25, v15.props.childComponentWidth);
        end;
        return v27;
    end;
end;
v13.didMount = function(v28)
    if type(v28.props.onModalOpen) == "function" then
        v28.props.onModalOpen();
    end;
end;
v13.reset = function(v29)
    for _, v31 in pairs(v29.refs) do
        if v31.current then
            v31.current.Text = "";
        end;
    end;
    local v32 = {};
    for v33, _ in pairs(v29.state.checkboxStatuses) do
        v32[v33] = false;
    end;
    v29:setState({
        checkboxStatuses = v32
    });
end;
v13.makeButtonTable = function(v35)
    local v36 = {
        buttons = {}
    };
    for v37, v38 in ipairs(v35.props.buttons) do
        table.insert(v36.buttons, {});
        v36.buttons[v37] = l_Cryo_0.Dictionary.join(v38, {
            props = l_Cryo_0.Dictionary.join(v38.props, {
                layoutOrder = v37, 
                onActivated = function()
                    v35.props.onActivated();
                    local v39 = {};
                    for v40, v41 in pairs(v35.refs) do
                        v39[v40] = not not v41.current and v41.current.Text or "";
                    end;
                    if v38.props.onActivated(v39, v35.state.checkboxStatuses) then
                        v35.props.onModalStayOpen();
                        return ;
                    else
                        v35:reset();
                        v35:setState({
                            displayingModal = false
                        });
                        v35.props.onModalClose();
                        return ;
                    end;
                end
            })
        });
    end;
    return v36;
end;
v13.makeTextboxList = function(v42, v43)
    local v44 = {};
    local l_Color_0 = v43.Theme.TextDefault.Color;
    if v42.props.inputLengthExceeded then
        l_Color_0 = v43.Theme.Alert.Color;
    end;
    for v46, v47 in pairs(v42.props.textboxes) do
        v44[v46] = l_Roact_0.createElement(v10, {
            width = UDim.new(1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = v47.LayoutOrder
        }, {
            [v46] = l_Roact_0.createElement(v8, {
                onTextChanged = v47.onTextChanged, 
                PlaceholderText = v47.PlaceholderText, 
                Text = v47.Text, 
                LayoutOrder = 1, 
                [l_Roact_0.Ref] = v42.refs[v46]
            }), 
            [v46 .. " Below Text"] = (not not v47.belowText and v47.belowText ~= "") and l_Roact_0.createElement(v7, {
                BackgroundTransparency = 1, 
                Text = v47.belowText, 
                LayoutOrder = 2, 
                TextXAlignment = v47.belowTextAlignment or Enum.TextXAlignment.Left, 
                Size = UDim2.new(1, 0, 0, (v42.calcTextboxTextHeight(v43, v47.belowText))), 
                TextColor3 = l_Color_0
            }) or nil, 
            [v46 .. " Warning Text"] = (not not v47.warningText and v47.warningText ~= "") and l_Roact_0.createElement(v7, {
                BackgroundTransparency = 1, 
                Text = v47.warningText, 
                LayoutOrder = 3, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Size = UDim2.new(1, 0, 0, (v42.calcTextboxTextHeight(v43, v47.warningText))), 
                TextColor3 = v43.Theme.Alert.Color
            }) or nil
        });
    end;
    return v44;
end;
v13.makeCheckboxList = function(v48)
    return l_Roact_0.createElement(l_CheckboxList_0, {
        checkboxes = v48.props.checkboxes, 
        atMost = v48.state.numCheckboxes + 1, 
        elementSize = UDim2.new(0, v48.props.childComponentWidth, 0, v48.props.checkboxHeight), 
        onActivated = function(v49)
            v48:setState({
                checkboxStatuses = l_Cryo_0.Dictionary.join(v48.state.checkboxStatuses, v49)
            });
        end
    });
end;
v13.makeMiddleContent = function(v50, v51)
    local v52 = v50:makeTextboxList(v51);
    local v53 = v50:makeCheckboxList();
    local v54 = v50.state.numCheckboxes * v50.props.checkboxHeight;
    if v50.state.numTextboxes == 0 and v50.state.numCheckboxes == 0 then
        return nil;
    else
        return function()
            return l_Roact_0.createElement(v10, {
                width = UDim.new(1, 0), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                Textboxes = l_Roact_0.createElement(v10, {
                    width = UDim.new(1, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }, v52), 
                Checkboxes = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v54), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }, v53)
            });
        end;
    end;
end;
v13.render = function(v55)
    assert(v55.props.displayTextbox or not v55.props.mandatoryInput);
    return l_UIBlox_0.Style.withStyle(function(v56)
        return l_Roact_0.createElement(v9, {
            BackgroundColor3 = v55.props.soakAreaColor3, 
            BackgroundTransparency = v55.props.soakAreaTransparency, 
            Visible = v55.state.displayingModal
        }, {
            alertView = l_Roact_0.createElement(l_InteractiveAlert_0, {
                title = v55.props.title, 
                bodyText = v55.props.bodyText ~= "" and v55.props.bodyText or nil, 
                middleContent = v55:makeMiddleContent(v56), 
                buttonStackInfo = v55:makeButtonTable(), 
                screenSize = if not v14 then Vector2.new(0, 0) else v55.props.screenSize
            })
        });
    end);
end;
return v13;
