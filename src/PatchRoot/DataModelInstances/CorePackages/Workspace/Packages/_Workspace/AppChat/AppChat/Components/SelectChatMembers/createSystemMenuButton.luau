local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.ArgCheck);
local v2 = require(l_Parent_0.Roact);
local l_TextButton_0 = require(l_Parent_0.UIBlox).App.Button.TextButton;
return function(v4)
    local l_localizedStrings_0 = v4.localizedStrings;
    local l_isDisabled_0 = v4.isDisabled;
    local l_onActivated_0 = v4.onActivated;
    v1.isNotNil(l_localizedStrings_0, "props.localizedStrings");
    return v2.createElement(l_TextButton_0, {
        text = l_localizedStrings_0.systemButtonText, 
        isDisabled = l_isDisabled_0, 
        onActivated = function()
            if not l_isDisabled_0 then
                if l_onActivated_0 then
                    l_onActivated_0({
                        networkErrorText = l_localizedStrings_0.networkErrorText
                    });
                end;
                return ;
            else
                return ;
            end;
        end
    });
end;
