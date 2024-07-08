local l_GuiService_0 = game:GetService("GuiService");
local v1 = require(game:GetService("CorePackages").Packages.ReactRoblox);
return function(v2)
    local function _(v3)
        return function()
            v1.act(function()
                v2:hitButton(v3);
                wait();
            end);
        end;
    end;
    local function v6()
        for _ = 1, 60 do
            if l_GuiService_0.SelectedCoreObject ~= nil then
                return ;
            else
                v1.act(function()
                    task.wait();
                end);
            end;
        end;
    end;
    local v7 = {};
    local l_DPadDown_0 = Enum.KeyCode.DPadDown;
    local l_l_DPadDown_0_0 = l_DPadDown_0 --[[ copy: 5 -> 6 ]];
    v7.down = function()
        v1.act(function()
            v2:hitButton(l_l_DPadDown_0_0);
            wait();
        end);
    end;
    l_DPadDown_0 = Enum.KeyCode.DPadUp;
    local l_l_DPadDown_0_1 = l_DPadDown_0 --[[ copy: 5 -> 7 ]];
    v7.up = function()
        v1.act(function()
            v2:hitButton(l_l_DPadDown_0_1);
            wait();
        end);
    end;
    l_DPadDown_0 = Enum.KeyCode.DPadLeft;
    local l_l_DPadDown_0_2 = l_DPadDown_0 --[[ copy: 5 -> 8 ]];
    v7.left = function()
        v1.act(function()
            v2:hitButton(l_l_DPadDown_0_2);
            wait();
        end);
    end;
    l_DPadDown_0 = Enum.KeyCode.DPadRight;
    local l_l_DPadDown_0_3 = l_DPadDown_0 --[[ copy: 5 -> 9 ]];
    v7.right = function()
        v1.act(function()
            v2:hitButton(l_l_DPadDown_0_3);
            wait();
        end);
    end;
    l_DPadDown_0 = Enum.KeyCode.ButtonA;
    v7.buttonA = function()
        v1.act(function()
            v2:hitButton(l_DPadDown_0);
            wait();
        end);
    end;
    v7.waitForFocus = v6;
    return v7;
end;
