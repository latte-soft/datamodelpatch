local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_Parent_0.Actions.SetDetailsInformation);
local v6 = require(l_Parent_0.Actions.SetTryingOnInfo);
local v7 = require(l_Parent_0.Components.InspectAndBuyContext);
local v8 = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Theme);
local v9 = v2.PureComponent:extend("CloseButton");
v9.render = function(v10)
    local l_view_0 = v10.props.view;
    local l_viewingDetails_0 = v10.props.detailsInformation.viewingDetails;
    local l_closeDetails_0 = v10.props.closeDetails;
    local l_setTryingOnInfo_0 = v10.props.setTryingOnInfo;
    return v2.createElement(v7.Consumer, {
        render = function(v15)
            local v16 = v15[l_view_0];
            local v17 = UDim2.new(0, 0, 0, 0);
            local v18 = 26;
            if v8.UseInspectAndBuyPanel() then
                v18 = 18;
                v17 = UDim2.new(0, v16.BorderPaddingSize, 0, 0);
            end;
            return v2.createElement("ImageButton", {
                Size = UDim2.new(0, v18, 0, v18), 
                Position = v16.CloseButtonPosition + v17, 
                BackgroundTransparency = 1, 
                Selectable = false, 
                Image = not l_viewingDetails_0 and "rbxasset://textures/ui/InspectMenu/x.png" or "rbxasset://textures/ui/InspectMenu/caret_tail_left.png", 
                ZIndex = 2, 
                [v2.Event.Activated] = function()
                    if not l_viewingDetails_0 then
                        l_GuiService_0:CloseInspectMenu();
                        return ;
                    else
                        l_closeDetails_0();
                        l_setTryingOnInfo_0(false, nil);
                        return ;
                    end;
                end
            });
        end
    });
end;
return v3.UNSTABLE_connect2(function(v19, _)
    return {
        view = v19.view, 
        detailsInformation = v19.detailsInformation
    };
end, function(v21)
    return {
        closeDetails = function()
            v21(v5(false, nil));
        end, 
        setTryingOnInfo = function(v22, v23)
            v21(v6(v22, v23));
        end
    };
end)(v9);
