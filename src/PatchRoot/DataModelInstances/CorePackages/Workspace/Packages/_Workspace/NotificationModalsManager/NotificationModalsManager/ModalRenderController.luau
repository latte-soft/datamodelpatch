local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactRoblox);
local v2 = require(l_Parent_0.React);
local v3 = require(script.Parent.Components.NotificationModalBase);
local v4 = nil;
local v5 = {};
local function _(v6)
    if not ((not (v5 and v5.ModalKey ~= v6.ModalKey) or not v5.Params) or not v5.Params.CloseCallback) then
        v5.Params.CloseCallback();
    end;
    v5 = v6;
    v4:render(v2.createElement(v3, v6));
end;
return {
    OpenModal = function(v8, v9, v10)
        if not v4 then
            local l_Folder_0 = Instance.new("Folder");
            l_Folder_0.Name = "NotificationModals";
            l_Folder_0.Parent = game.CoreGui;
            v4 = v1.createRoot(l_Folder_0);
        end;
        local v14 = {
            ModalKey = v8, 
            Component = v9, 
            Params = v10, 
            CloseModal = function()
                local l_v8_0 = v8;
                if v4 and l_v8_0 == v5.ModalKey then
                    local v13 = {};
                    if not ((not (v5 and v5.ModalKey ~= v13.ModalKey) or not v5.Params) or not v5.Params.CloseCallback) then
                        v5.Params.CloseCallback();
                    end;
                    v5 = v13;
                    v4:render(v2.createElement(v3, v13));
                end;
            end
        };
        if not ((not (v5 and v5.ModalKey ~= v14.ModalKey) or not v5.Params) or not v5.Params.CloseCallback) then
            v5.Params.CloseCallback();
        end;
        v5 = v14;
        v4:render(v2.createElement(v3, v14));
        return true;
    end, 
    CloseModal = function(v15)
        if v4 and v15 == v5.ModalKey then
            local v16 = {};
            if not ((not (v5 and v5.ModalKey ~= v16.ModalKey) or not v5.Params) or not v5.Params.CloseCallback) then
                v5.Params.CloseCallback();
            end;
            v5 = v16;
            v4:render(v2.createElement(v3, v16));
        end;
    end
};
