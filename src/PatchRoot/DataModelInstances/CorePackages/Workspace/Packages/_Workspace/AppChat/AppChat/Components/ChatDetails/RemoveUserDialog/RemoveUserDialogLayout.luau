local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_script_FirstAncestor_0.SocialLibraries);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_Parent_0.React);
local l_memo_0 = v6.memo;
local l_ResponseIndicator_0 = v3.Components.ResponseIndicator;
local v9 = require(script.Parent.RemoveUserDialog);
local v10 = {};
RemoveUserDialogLayout = function(v11)
    local v12 = v5.Dictionary.join(v10, v11);
    local v13 = l_useStyle_0();
    return v6.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        RemoveUserDialog = v12.isModalVisible and v6.createElement(v9, v12), 
        ResponseIndicator = v12.isLoading and v6.createElement(l_ResponseIndicator_0, {
            soakAreaColor3 = v13.Theme.Overlay.Color, 
            soakAreaTransparency = v13.Theme.Overlay.Transparency
        })
    });
end;
return l_memo_0(RemoveUserDialogLayout);
