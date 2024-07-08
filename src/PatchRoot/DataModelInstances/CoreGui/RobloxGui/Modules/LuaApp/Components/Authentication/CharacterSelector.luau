local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_SpringAnimatedItem_0 = require(l_CorePackages_0.UIBlox).Utility.SpringAnimatedItem;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v6 = require(l_Modules_0.LuaApp.Enum.ScrollingPickerDirection);
local v7 = require(l_Modules_0.LuaApp.Components.Authentication.SignUpCharacter);
local v8 = require(l_Modules_0.LuaApp.Components.Authentication.ScrollingPicker);
local v9 = Color3.fromRGB(255, 255, 255);
local v10 = Color3.fromRGB(150, 150, 150);
local v11 = v2.PureComponent:extend("CharacterSelector");
v11.defaultProps = {
    bundleIds = {}
};
v11.init = function(v12)
    local l_bundleIds_0 = v12.props.bundleIds;
    local l_selectedBundleId_0 = v12.props.selectedBundleId;
    local l_onSelectedCharacterChanged_0 = v12.props.onSelectedCharacterChanged;
    local v16 = (#l_bundleIds_0 + 1) / 2;
    local v17 = nil;
    for v18, v19 in pairs(l_bundleIds_0) do
        if v19 == l_selectedBundleId_0 then
            v16 = v18;
            v17 = l_selectedBundleId_0;
            if l_onSelectedCharacterChanged_0 then
                l_onSelectedCharacterChanged_0(v17);
                break;
            else
                break;
            end;
        end;
    end;
    v12.state = {
        currentIndex = v16, 
        currentBundleId = v17, 
        entryWidth = 100, 
        containerAbsoluteSize = Vector2.new(100, 100)
    };
    v12.isMounted = false;
    v12.calculateEntryWidth = function(v20, v21)
        local l_formFactor_0 = v12.props.formFactor;
        v21 = math.max(1, v21);
        local _ = nil;
        if l_formFactor_0 == l_FormFactor_0.COMPACT then
            return (v20 / v21) * 1;
        else
            return (v20 / v21) * 0.8;
        end;
    end;
    v12.updateEntryWidth = function()
        local v24 = v12.calculateEntryWidth(v12.state.containerAbsoluteSize.X, #v12.props.bundleIds);
        spawn(function()
            if v12.isMounted then
                v12:setState({
                    entryWidth = v24
                });
            end;
        end);
    end;
    v12.onContainerAbsoluteSizeChange = function(v25)
        local v26 = v12.calculateEntryWidth(v25.AbsoluteSize.X, #v12.props.bundleIds);
        spawn(function()
            if v12.isMounted then
                v12:setState({
                    entryWidth = v26, 
                    containerAbsoluteSize = v25.AbsoluteSize
                });
            end;
        end);
    end;
    v12.onSelectedIndexChanged = function(v27, v28)
        local l_bundleIds_1 = v12.props.bundleIds;
        local l_onSelectedCharacterChanged_1 = v12.props.onSelectedCharacterChanged;
        local l_currentBundleId_0 = v12.state.currentBundleId;
        local v32 = l_bundleIds_1[v27];
        if not (not (l_currentBundleId_0 ~= v32) or not v28) then
            spawn(function()
                if v12.isMounted then
                    if l_onSelectedCharacterChanged_1 then
                        l_onSelectedCharacterChanged_1(v32);
                    end;
                    v12:setState({
                        currentIndex = v27, 
                        currentBundleId = v32
                    });
                end;
            end);
        end;
    end;
    v12.renderCharacter = function(v33)
        local l_entryWidth_0 = v12.state.entryWidth;
        local l_Y_0 = v12.state.containerAbsoluteSize.Y;
        local l_currentBundleId_1 = v12.state.currentBundleId;
        local v37 = v33 == l_currentBundleId_1;
        if l_entryWidth_0 * 4 < l_Y_0 then
            l_Y_0 = l_entryWidth_0 * 3.5;
        end;
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            AvatarPlaceholder = v2.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
                regularProps = {
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    [v2.Children] = {
                        AspectRatioConstraint = v2.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1, 
                            AspectType = Enum.AspectType.FitWithinMaxSize
                        }), 
                        Character = v2.createElement(v7, {
                            bundleId = v33, 
                            characterColor = not not v37 and v9 or (not not l_currentBundleId_1 and v10 or v9)
                        })
                    }
                }, 
                animatedValues = {
                    sizeOffset = not not v37 and l_Y_0 or l_Y_0 * 0.8
                }, 
                mapValuesToProps = function(v38)
                    return {
                        Size = UDim2.new(0, v38.sizeOffset, 0, v38.sizeOffset)
                    };
                end, 
                springOptions = {
                    frequency = 3
                }
            })
        });
    end;
end;
v11.didMount = function(v39)
    v39.isMounted = true;
end;
v11.willUnmount = function(v40)
    v40.isMounted = false;
end;
v11.render = function(v41)
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        [v2.Change.AbsoluteSize] = v41.onContainerAbsoluteSizeChange
    }, {
        Wheel = v2.createElement(v8, {
            size = UDim2.new(1, 0, 1, 0), 
            renderEntry = v41.renderCharacter, 
            entries = v41.props.bundleIds, 
            entrySizeOnScrollingAxis = v41.state.entryWidth, 
            onSelectedIndexChanged = v41.onSelectedIndexChanged, 
            scrollDirection = v6.Horizontal, 
            clipsDescendants = false, 
            parentSpecifiedTarget = v41.state.currentIndex, 
            getEntryWrapperProps = function(v42)
                return {
                    ZIndex = v42 == v41.state.currentBundleId and 2 or 1
                };
            end
        })
    });
end;
v11.didUpdate = function(v43, v44)
    if #v44.bundleIds ~= #v43.props.bundleIds then
        v43.updateEntryWidth();
    end;
end;
return (v3.connect(function(v45, _)
    return {
        formFactor = v45.FormFactor, 
        selectedBundleId = v45.SignUpInfo.SignUpSelectedBundleId
    };
end)(v11));
