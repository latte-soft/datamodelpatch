local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_Parent_0 = script.Parent.Parent.Parent;
local v5 = require(l_Parent_0.Actions.ClosePlayerDropDown);
local v6 = require(l_Parent_0.Actions.SetIsUsingGamepad);
local v7 = require(script.Parent.EventConnection);
local v8 = v2.PureComponent:extend("UserInputServiceConnector");
v8.render = function(v9)
    return v2.createFragment({
        InputBeganConnection = v2.createElement(v7, {
            event = l_UserInputService_0.InputBegan, 
            callback = function(v10, v11)
                if not v11 then
                    local l_UserInputType_0 = v10.UserInputType;
                    if not (l_UserInputType_0 ~= Enum.UserInputType.Touch) or l_UserInputType_0 == Enum.UserInputType.MouseButton1 then
                        v9.props.closePlayerDropDown();
                    end;
                    return ;
                else
                    return ;
                end;
            end
        }), 
        LastInputTypeChangedConnection = v2.createElement(v7, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = function(v13)
                v9.props.setIsUsingGamepad(v13.Name:find("Gamepad") ~= nil);
            end
        })
    });
end;
return v3.connect(nil, function(v14)
    return {
        closePlayerDropDown = function()
            return v14(v5());
        end, 
        setIsUsingGamepad = function(v15)
            return v14(v6(v15));
        end
    };
end)(v8);
