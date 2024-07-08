local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.Promise);
local v6 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v7 = require(l_RobloxGui_0.Modules.Common.CoreScriptsRootProvider);
local v8 = require(script.Parent.Components.Blocking.BlockingModalScreen);
local v9 = require(l_RobloxGui_0.Modules.Flags.GetFFlagWrapBlockModalScreenInProvider);
local v10 = nil;
local function _()
    if v10 ~= nil then
        v4.unmount(v10);
        v10 = nil;
    end;
end;
return function(v12, v13, v14, v15)
    v13:action("SettingsHub", "blockUserButtonClick", {
        blockeeUserId = v12.UserId, 
        source = v14
    });
    if v10 ~= nil then
        v4.unmount(v10);
        v10 = nil;
    end;
    local v16 = false;
    local function v17()
        v16 = true;
        if v10 ~= nil then
            v4.unmount(v10);
            v10 = nil;
        end;
    end;
    local v18 = v4.createElement(v8, {
        player = v12, 
        closeModal = v17, 
        analytics = v13, 
        translator = not not v15 and v15.RobloxTranslator or v6, 
        source = v14
    });
    if not v9() then
        v10 = v4.mount(v18, l_RobloxGui_0, "BlockingContainer");
    else
        v10 = v4.mount(v4.createElement(v7, {}, {
            BlockingModalScreen = v18
        }), l_RobloxGui_0, "BlockingContainer");
        l_ContextActionService_0:BindCoreAction("BlockingModalScreen", v17, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape);
    end;
    return v5.new(function(v19)
        coroutine.wrap(function()
            while not v16 do
                wait();
            end;
            if v9() then
                l_ContextActionService_0:UnbindCoreAction("BlockingModalScreen");
            end;
            v19();
        end)();
    end);
end;
