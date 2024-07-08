local l_Utility_0 = require(game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell"):FindFirstChild("Utility"));
return function(v1, v2, v3)
    v1 = v1 or {};
    v2 = v2 or {};
    local v4 = {};
    local v5 = {};
    local v6 = false;
    local v7 = v1.ImageTransparency or 0;
    local v8 = l_Utility_0.Signal();
    local v9 = l_Utility_0.Create("ImageLabel")({
        Name = "LoadIcon", 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Icons/LoadingSpinner@1080.png", 
        Size = v1.Size or UDim2.new(0, 100, 0, 100), 
        ZIndex = v1.ZIndex or 7, 
        Parent = v1.Parent, 
        ImageTransparency = v7, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = v1.Position or UDim2.new(0.5, 0, 0.5, 0)
    });
    if v1.Visible == false then
        v9.Visible = false;
    end;
    local function _()
        if not v3 then
            return #v5 == #v2;
        else
            return false;
        end;
    end;
    v4.AwaitFinished = function(_)
        if not if not v3 then #v5 == #v2 else false then
            v8:wait();
            if not v6 then
                return true;
            else
                return false;
            end;
        else
            return true;
        end;
    end;
    v4.Cleanup = function(_)
        v9.Parent = nil;
        v9.ImageTransparency = 1;
        v9:Destroy();
        v6 = true;
    end;
    v4.SetTransparency = function(_, v14)
        v7 = v14;
    end;
    v4.SetParent = function(_, v16)
        v9.Parent = v16;
    end;
    v4.GetTransparency = function(_)
        return v7;
    end;
    for _, v19 in pairs(v2) do
        spawn(function()
            v19();
            table.insert(v5, v19);
        end);
    end;
    spawn(function()
        local v20 = tick();
        while not (v6 or if not v3 then #v5 == #v2 else false) do
            local v21 = tick();
            local v22 = (v21 - v20) * 360;
            if v9.Parent then
                v9.ImageTransparency = v7;
                v9.Rotation = v9.Rotation + v22;
            end;
            v20 = v21;
            wait();
        end;
        v8.fire();
    end);
    return v4;
end;
