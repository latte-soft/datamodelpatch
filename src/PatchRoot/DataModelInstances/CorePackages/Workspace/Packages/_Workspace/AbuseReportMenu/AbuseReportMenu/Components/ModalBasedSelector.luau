local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_Images_0 = v3.App.ImageSet.Images;
local l_Button_0 = v3.App.Button.Button;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local v7 = require(l_script_FirstAncestor_0.Components.ModalBasedSelectorDialogController);
return function(v8)
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        ControlButton = v2.createElement(l_Button_0, {
            buttonType = l_ButtonType_0.Secondary, 
            size = UDim2.new(1, 0, 1, 0), 
            anchorPoint = Vector2.new(0.5, 0.5), 
            position = UDim2.fromScale(0.5, 0.5), 
            text = v8.selectedValue or "Choose One", 
            inputIcon = l_Images_0["icons/actions/truncationExpand"], 
            onActivated = function()
                v7.mountModalSelector(v8.viewportHeight, v8.viewportWidth, v8.selections, v8.onSelect, function()
                    v7.unmountModalSelector();
                end);
            end
        })
    });
end;
