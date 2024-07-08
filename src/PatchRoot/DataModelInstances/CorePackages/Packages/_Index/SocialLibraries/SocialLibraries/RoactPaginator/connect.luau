local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoactPaginator");
local v1 = require(l_script_FirstAncestor_0.fetchInitSymbol);
local v2 = require(l_script_FirstAncestor_0.fetchWithCursorSymbol);
local v3 = require(l_script_FirstAncestor_0.loadNextSymbol);
local v4 = require(l_script_FirstAncestor_0.loadPreviousSymbol);
local v5 = require(l_script_FirstAncestor_0.Logger);
local v6 = require(l_script_FirstAncestor_0.Parent.dependencies);
local l_Roact_0 = v6.Roact;
local l_Cryo_0 = v6.Cryo;
local l_GenericPagination_0 = v6.GenericPagination;
local function _(v10, v11)
    return table.concat(v10, "\n"):format(unpack(v11 or {}));
end;
return function(v13)
    assert(v13 and type(v13) == "function", "RoactPaginator.connect: parameters expected to be a function");
    local v14 = debug.traceback();
    return function(v15)
        if v15 == nil then
            error(table.concat({
                "connect returns a function that must be passed a component.", 
                "Check the connection at:", 
                "%s"
            }, "\n"):format(unpack({
                v14
            } or {})), 2);
        end;
        local v16 = l_Roact_0.Component:extend((("PaginatorConnection(%s)"):format((tostring(v15)))));
        v16.init = function(v17)
            local v18 = v13();
            assert(v18, "RoactPaginator.connect: Expected parameters to return an object");
            v17.paginator = l_GenericPagination_0.new({
                pageSize = v18.pageSize, 
                fetchInit = v17.props[v1], 
                fetchWithCursor = v17.props[v2]
            });
        end;
        v16.render = function(v19)
            return l_Roact_0.createElement(v15, (l_Cryo_0.Dictionary.join(v19.props, {
                [v3] = function()
                    if not v19.paginator:isFetching() then
                        v19.paginator:getNext():catch(function(v20)
                            v5:error("Could not getNext. Got error: {}", v20);
                        end);
                        return ;
                    else
                        return ;
                    end;
                end, 
                [v4] = function()
                    if not v19.paginator:isFetching() then
                        v19.paginator:getPrevious():catch(function(v21)
                            v5:error("Could not getPrevious. Got error: {}", v21);
                        end);
                        return ;
                    else
                        return ;
                    end;
                end
            })));
        end;
        return v16;
    end;
end;
