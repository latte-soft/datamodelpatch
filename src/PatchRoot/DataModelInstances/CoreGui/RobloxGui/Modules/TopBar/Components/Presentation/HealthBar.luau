local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent.Parent;
local v6 = require(l_Parent_0.Constants);
local v7 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.TenFootInterface);
local v8 = require(l_Parent_0.Flags.GetFFlagEnableChromeBackwardsSignalAPI)();
local v9 = require(l_Parent_0.Actions.SetKeepOutArea);
local v10 = require(l_Parent_0.Actions.RemoveKeepOutArea);
local l_Chrome_0 = l_Parent_0.Parent.Chrome;
local v12 = require(l_Chrome_0.Enabled);
local v13 = if not v12 then nil else require(l_Chrome_0.Service);
local v14 = UDim2.new(0, 80, 0, 6);
local v15 = UDim2.new(0, 220, 0, 16);
local v16 = v2.PureComponent:extend("HealthBar");
v16.validateProps = v4.strictInterface({
    layoutOrder = v4.integer, 
    healthEnabled = v4.boolean, 
    health = v4.number, 
    maxHealth = v4.number, 
    setKeepOutArea = v4.callback, 
    removeKeepOutArea = v4.callback
});
local function _(v17)
    return (Vector3.new(v17.r, v17.g, v17.b));
end;
local v19 = {};
local l_HealthRedColor_0 = v6.HealthRedColor;
v19[Vector3.new(l_HealthRedColor_0.r, l_HealthRedColor_0.g, l_HealthRedColor_0.b)] = 0.1;
l_HealthRedColor_0 = v6.HealthYellowColor;
v19[Vector3.new(l_HealthRedColor_0.r, l_HealthRedColor_0.g, l_HealthRedColor_0.b)] = 0.5;
l_HealthRedColor_0 = v6.HealthGreenColor;
v19[Vector3.new(l_HealthRedColor_0.r, l_HealthRedColor_0.g, l_HealthRedColor_0.b)] = 0.8;
local l_HealthRedColor_1 = v6.HealthRedColor;
l_HealthRedColor_0 = v6.HealthGreenColor;
local function v30(v22)
    if v22 <= 0.1 then
        return l_HealthRedColor_1;
    elseif v22 >= 0.8 then
        return l_HealthRedColor_0;
    else
        local v23 = Vector3.new(0, 0, 0);
        local v24 = 0;
        for v25, v26 in pairs(v19) do
            local v27 = v22 - v26;
            if v27 == 0 then
                return Color3.new(v25.x, v25.y, v25.z);
            else
                local v28 = 1 / (v27 * v27);
                v23 = v23 + v28 * v25;
                v24 = v24 + v28;
            end;
        end;
        local v29 = v23 / v24;
        return Color3.new(v29.x, v29.y, v29.z);
    end;
end;
v16.init = function(v31)
    v31.rootRef = v2.createRef();
    if v13 then
        v31:setState({
            chromeMenuOpen = v13:status():get() == v13.MenuStatus.Open
        });
    end;
end;
v16.didMount = function(v32)
    if v13 then
        v32.chromeMenuStatusConn = v13:status():connect(function()
            v32:setState({
                chromeMenuOpen = v13:status():get() == v13.MenuStatus.Open
            });
        end);
    end;
end;
v16.onUnmount = function(v33)
    if v33.chromeMenuStatusConn then
        v33.chromeMenuStatusConn:Disconnect();
        v33.chromeMenuStatusConn = nil;
    end;
end;
v16.render = function(v34)
    local v35 = (v34.props.healthEnabled and v34.props.health < v34.props.maxHealth) and not v34.state.chromeMenuOpen;
    local v36 = 1;
    if not v34.props.isDead then
        if v34.props.maxHealth > 0 then
            v36 = v34.props.health / v34.props.maxHealth;
        end;
    else
        v36 = 0;
    end;
    local l_v14_0 = v14;
    if v7:IsEnabled() then
        l_v14_0 = v15;
    end;
    local v38 = 4;
    if v7:IsEnabled() then
        v38 = 0;
    end;
    local v39 = "rbxasset://textures/ui/TopBar/HealthBarBase.png";
    local v40 = "rbxasset://textures/ui/TopBar/HealthBar.png";
    local v41 = Rect.new(3, 3, 4, 4);
    if v7:IsEnabled() then
        v39 = "rbxasset://textures/ui/TopBar/HealthBarBaseTV.png";
        v40 = "rbxasset://textures/ui/TopBar/HealthBarTV.png";
        v41 = Rect.new(8, 8, 9, 9);
    end;
    local function v43(v42)
        if not v35 or not v42 then
            v34.props.removeKeepOutArea(v6.HealthBarKeepOutAreaId);
            return ;
        else
            v34.props.setKeepOutArea(v6.HealthBarKeepOutAreaId, v42.AbsolutePosition, v42.AbsoluteSize);
            return ;
        end;
    end;
    if not (not v8 or not v34.rootRef.current) then
        local l_current_0 = v34.rootRef.current;
        if not v35 or not l_current_0 then
            v34.props.removeKeepOutArea(v6.HealthBarKeepOutAreaId);
        else
            v34.props.setKeepOutArea(v6.HealthBarKeepOutAreaId, l_current_0.AbsolutePosition, l_current_0.AbsoluteSize);
        end;
    end;
    return v2.createElement("Frame", {
        Visible = v35, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(l_v14_0.X, UDim.new(1, 0)), 
        LayoutOrder = v34.props.layoutOrder, 
        [v2.Change.AbsoluteSize] = if not v8 then nil else v43, 
        [v2.Change.AbsolutePosition] = if not v8 then nil else v43, 
        [v2.Ref] = v34.rootRef
    }, {
        Padding = not v12 and v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v38)
        }) or nil, 
        HealthBar = v2.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Image = v39, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v41, 
            Size = l_v14_0, 
            Position = UDim2.fromScale(0, 0.5), 
            AnchorPoint = Vector2.new(0, 0.5)
        }, {
            Fill = v2.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Image = v40, 
                ImageColor3 = v30(v36), 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v41, 
                Size = UDim2.fromScale(v36, 1)
            })
        })
    });
end;
return v3.UNSTABLE_connect2(function(v45)
    return {
        health = v45.health.currentHealth, 
        maxHealth = v45.health.maxHealth, 
        healthEnabled = v45.coreGuiEnabled[Enum.CoreGuiType.Health]
    };
end, function(v46)
    return {
        setKeepOutArea = function(v47, v48, v49)
            return v46(v9(v47, v48, v49));
        end, 
        removeKeepOutArea = function(v50)
            return v46(v10(v50));
        end
    };
end)(v16);
