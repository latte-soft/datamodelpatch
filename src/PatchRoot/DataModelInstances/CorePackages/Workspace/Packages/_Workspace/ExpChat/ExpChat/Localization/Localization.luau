local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local v1 = require(l_Parent_0.Roact);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local _ = function(v3)
    return function(v4)
        local function v13(v5, v6)
            return l_Dictionary_0.map(v4(v6), function(v7, _)
                if type(v7) == "table" then
                    local l_status_0, l_result_0 = pcall(function()
                        return v5:FormatByKey(v7[1], v7[2]);
                    end);
                    if not l_status_0 then
                        return "";
                    else
                        return l_result_0;
                    end;
                elseif type(v7) == "string" then
                    local l_status_1, l_result_1 = pcall(function()
                        return v5:FormatByKey(v7);
                    end);
                    if not l_status_1 then
                        return "";
                    else
                        return l_result_1;
                    end;
                else
                    return "";
                end;
            end);
        end;
        return function(v14)
            local v15 = v1.Component:extend("Connected-" .. tostring(v14));
            v15.render = function(v16)
                return v1.createElement(v3.Consumer, {
                    render = function(v17)
                        return v1.createElement(v14, l_Dictionary_0.join(v16.props, v13(v17, v16.props)));
                    end
                });
            end;
            return v15;
        end;
    end;
end;
return function(v19)
    local v20 = v1.createContext(v19);
    return {
        Consumer = v20.Consumer, 
        Provider = v20.Provider, 
        connect = function(v21)
            local function v30(v22, v23)
                return l_Dictionary_0.map(v21(v23), function(v24, _)
                    if type(v24) == "table" then
                        local l_status_2, l_result_2 = pcall(function()
                            return v22:FormatByKey(v24[1], v24[2]);
                        end);
                        if not l_status_2 then
                            return "";
                        else
                            return l_result_2;
                        end;
                    elseif type(v24) == "string" then
                        local l_status_3, l_result_3 = pcall(function()
                            return v22:FormatByKey(v24);
                        end);
                        if not l_status_3 then
                            return "";
                        else
                            return l_result_3;
                        end;
                    else
                        return "";
                    end;
                end);
            end;
            return function(v31)
                local v32 = v1.Component:extend("Connected-" .. tostring(v31));
                v32.render = function(v33)
                    return v1.createElement(v20.Consumer, {
                        render = function(v34)
                            return v1.createElement(v31, l_Dictionary_0.join(v33.props, v30(v34, v33.props)));
                        end
                    });
                end;
                return v32;
            end;
        end
    };
end;
