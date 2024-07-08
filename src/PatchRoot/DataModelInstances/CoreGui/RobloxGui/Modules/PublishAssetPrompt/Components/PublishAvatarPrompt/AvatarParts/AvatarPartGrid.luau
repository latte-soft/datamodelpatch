local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.UIBlox);
local l_GridMetrics_0 = v2.App.Grid.GridMetrics;
local l_DefaultMetricsGridView_0 = v2.App.Grid.DefaultMetricsGridView;
local v5 = require(script.Parent.Parent.Parent.Parent.Constants);
local v6 = require(script.Parent.AvatarItemCard);
local v7 = Vector2.new(20, 20);
local _ = function(v8)
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "R15ArtistIntent";
    for _, v11 in v8, nil, nil do
        v11.Parent = l_Folder_0;
    end;
    return {
        [1] = l_Folder_0
    };
end;
local function _(v13, v14)
    return (v13:FindFirstChild(v14));
end;
local function v42(v16, v17)
    local v18 = nil;
    local v19 = nil;
    for _, v21 in ipairs(v16:GetChildren()) do
        if v21:IsA("Accessory") then
            if v21.AccessoryType == Enum.AccessoryType.Eyebrow then
                v19 = v21;
            elseif v21.AccessoryType == Enum.AccessoryType.Eyelash then
                v18 = v21;
            end;
        end;
    end;
    local v22 = {};
    local v23 = {
        asset = v16:FindFirstChild("Head"), 
        titleText = v17 .. "'s Head"
    };
    local v24 = {};
    local v25 = {
        v16:FindFirstChild("UpperTorso"), 
        (v16:FindFirstChild("LowerTorso"))
    };
    local l_Folder_1 = Instance.new("Folder");
    l_Folder_1.Name = "R15ArtistIntent";
    for _, v28 in v25, nil, nil do
        v28.Parent = l_Folder_1;
    end;
    v24.asset = {
        [1] = l_Folder_1
    };
    v24.titleText = v17 .. "'s Torso";
    local v29 = {};
    l_Folder_1 = {
        v16:FindFirstChild("LeftUpperArm"), 
        v16:FindFirstChild("LeftLowerArm"), 
        (v16:FindFirstChild("LeftHand"))
    };
    local l_Folder_2 = Instance.new("Folder");
    l_Folder_2.Name = "R15ArtistIntent";
    for _, v32 in l_Folder_1, nil, nil do
        v32.Parent = l_Folder_2;
    end;
    v29.asset = {
        [1] = l_Folder_2
    };
    v29.titleText = v17 .. "'s Left Arm";
    v25 = {};
    l_Folder_2 = {
        v16:FindFirstChild("LeftUpperLeg"), 
        v16:FindFirstChild("LeftLowerLeg"), 
        (v16:FindFirstChild("LeftFoot"))
    };
    local l_Folder_3 = Instance.new("Folder");
    l_Folder_3.Name = "R15ArtistIntent";
    for _, v35 in l_Folder_2, nil, nil do
        v35.Parent = l_Folder_3;
    end;
    v25.asset = {
        [1] = l_Folder_3
    };
    v25.titleText = v17 .. "'s Left Leg";
    l_Folder_1 = {};
    l_Folder_3 = {
        v16:FindFirstChild("RightUpperArm"), 
        v16:FindFirstChild("RightLowerArm"), 
        (v16:FindFirstChild("RightHand"))
    };
    local l_Folder_4 = Instance.new("Folder");
    l_Folder_4.Name = "R15ArtistIntent";
    for _, v38 in l_Folder_3, nil, nil do
        v38.Parent = l_Folder_4;
    end;
    l_Folder_1.asset = {
        [1] = l_Folder_4
    };
    l_Folder_1.titleText = v17 .. "'s Right Arm";
    l_Folder_2 = {};
    l_Folder_4 = {
        v16:FindFirstChild("RightUpperLeg"), 
        v16:FindFirstChild("RightLowerLeg"), 
        (v16:FindFirstChild("RightFoot"))
    };
    local l_Folder_5 = Instance.new("Folder");
    l_Folder_5.Name = "R15ArtistIntent";
    for _, v41 in l_Folder_4, nil, nil do
        v41.Parent = l_Folder_5;
    end;
    l_Folder_2.asset = {
        [1] = l_Folder_5
    };
    l_Folder_2.titleText = v17 .. "'s Right Leg";
    setlist { ['R004[1 to 6]'] = 'R005 to R010' };
    if v19 then
        table.insert(v22, {
            asset = v19, 
            titleText = v17 .. "'s Eyebrows"
        });
    end;
    if v18 then
        table.insert(v22, {
            asset = v18, 
            titleText = v17 .. "'s Eyelashes"
        });
    end;
    return v22;
end;
return function(v43)
    local v44, v45 = v1.useState({});
    v1.useEffect(function()
        v45((v42(v43.humanoidModel:Clone(), v43.name)));
    end, {
        v43.humanoidModel, 
        v43.name
    });
    local v46 = if not (v43.screenSize.X < v43.screenSize.Y) then v5.ItemCardWidthLandscape else v5.ItemCardWidthPortrait;
    return v1.createElement("Frame", {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = v43.LayoutOrder, 
        BackgroundTransparency = 1
    }, {
        Grid = v1.createElement(l_DefaultMetricsGridView_0, {
            getItemHeight = function(v47)
                return v47 * 1.3333333333333333;
            end, 
            getItemMetrics = l_GridMetrics_0.makeCustomMetricsGetter({
                minimumItemsPerRow = 2, 
                minimumItemWidth = v46
            }), 
            renderItem = v1.useCallback(function(v48)
                return v1.createElement(v6, {
                    asset = v48.asset, 
                    titleText = v48.titleText, 
                    viewportSize = v46
                });
            end, {
                v46
            }), 
            itemPadding = v7, 
            items = v44
        })
    });
end;
