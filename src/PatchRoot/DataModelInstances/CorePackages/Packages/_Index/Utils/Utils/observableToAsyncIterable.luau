local l_Boolean_0 = require((nil).LuauPolyfill).Boolean;
return {
    observableToAsyncIterable = function(v1)
        local v2 = {};
        local v3 = {};
        local v4 = true;
        local function v6(v5)
            if v2.length ~= 0 then
                table.remove(v2, 1)({
                    value = v5, 
                    done = false
                });
                return ;
            else
                table.insert(v3, {
                    value = v5, 
                    done = false
                });
                return ;
            end;
        end;
        local function v8(v7)
            if v2.length ~= 0 then
                table.remove(v2, 1)({
                    value = {
                        errors = {
                            v7
                        }
                    }, 
                    done = false
                });
                return ;
            else
                table.insert(v3, {
                    value = {
                        errors = {
                            v7
                        }
                    }, 
                    done = false
                });
                return ;
            end;
        end;
        local function v9()
            if v2.length ~= 0 then
                table.remove(v2, 1)({
                    done = true
                });
                return ;
            else
                table.insert(v3, {
                    done = true
                });
                return ;
            end;
        end;
        local function _()
            return Promise.new(function(v10)
                if v3.length ~= 0 then
                    v10((table.remove(v3, 1)));
                    return ;
                else
                    table.insert(v2, v10);
                    return ;
                end;
            end);
        end;
        local v17 = v1:subscribe({
            next = function(_, v13)
                v6(v13);
            end, 
            error = function(_, v15)
                v8(v15);
            end, 
            complete = function(_)
                v9();
            end
        });
        local function v20()
            if l_Boolean_0.toJSBoolean(v4) then
                v4 = false;
                v17:unsubscribe();
                for _, v19 in v2, nil, nil do
                    v19({
                        value = nil, 
                        done = true
                    });
                end;
                v2.length = 0;
                v3.length = 0;
            end;
        end;
        return {
            next = function(v21)
                if not l_Boolean_0.toJSBoolean(v4) then
                    return (v21["return"]());
                else
                    return (Promise.new(function(v22)
                        if v3.length ~= 0 then
                            v22((table.remove(v3, 1)));
                            return ;
                        else
                            table.insert(v2, v22);
                            return ;
                        end;
                    end));
                end;
            end, 
            ["return"] = function(_)
                v20();
                return Promise.resolve({
                    value = nil, 
                    done = true
                });
            end, 
            throw = function(_, v25)
                v20();
                return Promise.reject(v25);
            end, 
            [tostring(Symbol.asyncIterator)] = function(v26)
                return v26;
            end
        };
    end
};
