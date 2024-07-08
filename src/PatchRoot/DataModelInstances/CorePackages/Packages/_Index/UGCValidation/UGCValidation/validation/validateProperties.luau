local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Cryo);
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.Constants);
local v4 = require(l_Parent_0.util.valueToString);
local v5 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local function _(v6, v7)
    return math.abs(v6 - v7) <= 1.0E-5;
end;
local function _(v9, v10)
    return (math.abs(v9.X - v10.X) <= 1.0E-5 and math.abs(v9.Y - v10.Y) <= 1.0E-5) and math.abs(v9.Z - v10.Z) <= 1.0E-5;
end;
local function _(v12, v13)
    return (math.abs(v12.R - v13.R) <= 1.0E-5 and math.abs(v12.G - v13.G) <= 1.0E-5) and math.abs(v12.B - v13.B) <= 1.0E-5;
end;
local function v17(v15, v16)
    if v16 == v1.None then
        return v15 == nil;
    elseif typeof(v16) == "number" then
        return math.abs(v15 - v16) <= 1.0E-5;
    elseif typeof(v16) == "Vector3" then
        return (math.abs(v15.X - v16.X) <= 1.0E-5 and math.abs(v15.Y - v16.Y) <= 1.0E-5) and math.abs(v15.Z - v16.Z) <= 1.0E-5;
    elseif typeof(v16) == "Color3" then
        return (math.abs(v15.R - v16.R) <= 1.0E-5 and math.abs(v15.G - v16.G) <= 1.0E-5) and math.abs(v15.B - v16.B) <= 1.0E-5;
    else
        return v15 == v16;
    end;
end;
return function(v18)
    local l_v18_Descendants_0 = v18:GetDescendants();
    table.insert(l_v18_Descendants_0, v18);
    for _, v21 in pairs(l_v18_Descendants_0) do
        for v22, v23 in pairs(v3.PROPERTIES) do
            if v21:IsA(v22) then
                for v24, v25 in pairs(v23) do
                    local l_status_0, l_result_0 = pcall(function()
                        return v21[v24];
                    end);
                    if l_status_0 then
                        if not v17(l_result_0, v25) then
                            v2.reportFailure(v2.ErrorType.validateProperties_PropertyMismatch);
                            if not v5() then
                                return false, {
                                    string.format("Expected %s.%s to be %s", v21:GetFullName(), v24, v4(v25))
                                };
                            else
                                return false, {
                                    string.format("Tying to access property '%s.%s' using the incorrect type for it. Expected '%s' to be '%s'.", v21:GetFullName(), v24, v24, v4(v25))
                                };
                            end;
                        end;
                    else
                        v2.reportFailure(v2.ErrorType.validateProperties_PropertyDoesNotExist);
                        if not v5() then
                            return false, {
                                string.format("Property %s does not exist on type %s", v24, v21.ClassName)
                            };
                        else
                            return false, {
                                string.format("Property '%s' does not exist on type '%s'. Delete the property and try again.", v24, v21.ClassName)
                            };
                        end;
                    end;
                end;
            end;
        end;
    end;
    return true;
end;
