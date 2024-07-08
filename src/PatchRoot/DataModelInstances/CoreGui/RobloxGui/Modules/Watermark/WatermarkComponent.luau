local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local v3 = require(l_CorePackages_0.Roact);
local _ = require(l_CorePackages_0.RoactRodux);
local _ = require(l_CorePackages_0.UIBlox).App.ImageSet.Images;
local v6 = v3.PureComponent:extend("WatermarkComponent");
local l_PolicyService_0 = game:GetService("PolicyService");
v6.init = function(v8)
    local function v12()
        local l_v8_0 = v8;
        local v10 = {};
        local v11 = not l_RunService_0:IsStudio();
        if v11 then
            v11 = false;
            if l_PolicyService_0.IsLuobuServer == Enum.TriStateBoolean.True then
                v11 = l_PolicyService_0.LuobuWhitelisted == Enum.TriStateBoolean.False;
            end;
        end;
        v10.watermarkVisible = v11;
        l_v8_0:setState(v10);
    end;
    l_PolicyService_0:GetPropertyChangedSignal("IsLuobuServer"):connect(function()
        v12();
    end);
    l_PolicyService_0:GetPropertyChangedSignal("LuobuWhitelisted"):connect(function()
        v12();
    end);
    v8:setState({
        absoluteSize = Vector2.new(0, 0), 
        watermarkVisible = false
    });
    v8.onAbsoluteSizeChange = function(v13)
        v8:setState({
            absoluteSize = v13.AbsoluteSize
        });
    end;
    v12();
end;
v6.render = function(v14)
    local function _()
        return v14.state.absoluteSize.X * 0.9681476403781077 + v14.state.absoluteSize.Y * 0.25038000405444144;
    end;
    local function _()
        return v14.state.absoluteSize.Y * 0.9681476403781077 + v14.state.absoluteSize.X * 0.25038000405444144;
    end;
    return not not v14.state.watermarkVisible and v3.createElement("ScreenGui", {
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        AutoLocalize = false, 
        DisplayOrder = 10, 
        [v3.Change.AbsoluteSize] = v14.onAbsoluteSizeChange
    }, {
        FullScreenFrame = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v14.state.absoluteSize.X * 0.9681476403781077 + v14.state.absoluteSize.Y * 0.25038000405444144, 0, v14.state.absoluteSize.Y * 0.9681476403781077 + v14.state.absoluteSize.X * 0.25038000405444144), 
            Position = UDim2.new(0, (v14.state.absoluteSize.X - (v14.state.absoluteSize.X * 0.9681476403781077 + v14.state.absoluteSize.Y * 0.25038000405444144)) * 0.5, 0, (v14.state.absoluteSize.Y - (v14.state.absoluteSize.Y * 0.9681476403781077 + v14.state.absoluteSize.X * 0.25038000405444144)) * 0.5), 
            Rotation = 14.5
        }, ((function()
            local v17 = math.ceil((v14.state.absoluteSize.X * 0.9681476403781077 + v14.state.absoluteSize.Y * 0.25038000405444144) / 450);
            local v18 = math.ceil((v14.state.absoluteSize.Y * 0.9681476403781077 + v14.state.absoluteSize.X * 0.25038000405444144) / 450);
            local v19 = {};
            for v20 = 0, v18 - 1 do
                for v21 = 0, v17 - 1 do
                    table.insert(v19, v3.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        TextTransparency = 0.75, 
                        Text = "\228\187\133\231\148\168\228\186\142\230\181\139\232\175\149\239\188\140\n\233\157\158\230\173\163\229\188\143\229\143\145\232\161\168\227\128\130", 
                        TextSize = 30, 
                        TextColor3 = Color3.new(1, 1, 1), 
                        Size = UDim2.new(0, 225, 0, 225), 
                        Position = UDim2.new(0, v21 * 450, 0, v20 * 450)
                    }));
                    table.insert(v19, v3.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        TextTransparency = 0.91, 
                        Text = "\228\187\133\231\148\168\228\186\142\230\181\139\232\175\149\239\188\140\n\233\157\158\230\173\163\229\188\143\229\143\145\232\161\168\227\128\130", 
                        TextSize = 30, 
                        TextColor3 = Color3.new(0, 0, 0), 
                        Size = UDim2.new(0, 225, 0, 225), 
                        Position = UDim2.new(0, v21 * 450 + 1, 0, v20 * 450 + 1)
                    }));
                    table.insert(v19, v3.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        TextTransparency = 0.75, 
                        Text = "\228\187\133\231\148\168\228\186\142\230\181\139\232\175\149\239\188\140\n\233\157\158\230\173\163\229\188\143\229\143\145\232\161\168\227\128\130", 
                        TextSize = 30, 
                        TextColor3 = Color3.new(1, 1, 1), 
                        Size = UDim2.new(0, 225, 0, 225), 
                        Position = UDim2.new(0, v21 * 450 + 225, 0, v20 * 450 + 225)
                    }));
                    table.insert(v19, v3.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        TextTransparency = 0.91, 
                        Text = "\228\187\133\231\148\168\228\186\142\230\181\139\232\175\149\239\188\140\n\233\157\158\230\173\163\229\188\143\229\143\145\232\161\168\227\128\130", 
                        TextSize = 30, 
                        TextColor3 = Color3.new(0, 0, 0), 
                        Size = UDim2.new(0, 225, 0, 225), 
                        Position = UDim2.new(0, v21 * 450 + 226, 0, v20 * 450 + 226)
                    }));
                end;
            end;
            return v19;
        end)()))
    }) or nil;
end;
return v6;
