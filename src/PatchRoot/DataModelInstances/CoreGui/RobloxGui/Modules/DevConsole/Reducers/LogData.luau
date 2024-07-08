local v0 = require(game:GetService("CorePackages").Rodux);
local v1 = require(script.Parent.Parent.Immutable);
return function(v2, v3)
    return v0.createReducer({
        clientSearchTerm = "", 
        clientTypeFilters = {}, 
        serverSearchTerm = "", 
        serverTypeFilters = {}
    }, {
        ClientLogAppendMessage = function(v4, v5)
            return v1.JoinDictionaries(v4, {
                clientData = v1.Append(v4.clientData, v5.newMessage)
            });
        end, 
        ServerLogAppendMessage = function(v6, v7)
            return v1.JoinDictionaries(v6, {
                serverData = v1.Append(v6.serverData, v7.newMessage)
            });
        end, 
        ClientLogAppendFilteredMessage = function(v8, v9)
            return v1.JoinDictionaries(v8, {
                clientData = v1.Append(v8.clientData, v9.newMessage), 
                clientDataFiltered = v1.Append(v8.clientDataFiltered, v9.newMessage)
            });
        end, 
        ServerLogAppendFilteredMessage = function(v10, v11)
            return v1.JoinDictionaries(v10, {
                serverData = v1.Append(v10.serverData, v11.newMessage), 
                serverDataFiltered = v1.Append(v10.serverDataFiltered, v11.newMessage)
            });
        end, 
        ClientLogSetData = function(v12, v13)
            return v1.JoinDictionaries(v12, {
                clientData = v13.newData, 
                clientDataFiltered = v13.newDataFiltered
            });
        end, 
        ServerLogSetData = function(v14, v15)
            return v1.JoinDictionaries(v14, {
                serverData = v15.newData, 
                serverDataFiltered = v15.newDataFiltered
            });
        end, 
        ClientLogUpdateSearchFilter = function(v16, v17)
            return v1.JoinDictionaries(v16, {
                clientSearchTerm = v17.searchTerm, 
                clientTypeFilters = v1.JoinDictionaries(v16.clientTypeFilters, v17.filterTypes)
            });
        end, 
        ServerLogUpdateSearchFilter = function(v18, v19)
            return v1.JoinDictionaries(v18, {
                serverSearchTerm = v19.searchTerm, 
                serverTypeFilters = v1.JoinDictionaries(v18.serverTypeFilters, v19.filterTypes)
            });
        end
    })(v2, v3);
end;
