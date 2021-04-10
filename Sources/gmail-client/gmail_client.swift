import Foundation

class Gmail {
    
    private static var bearerToken: String = ""
    private static var defaultHeadersWithAuth = ["Authorization" : "Bearer \(Gmail.bearerToken)"]
    
    static func setAuth(bearerToken: String) {
        Gmail.bearerToken = bearerToken
    }
    
    class Users {
        
        static func getProfile(userID: String) -> Data? {
            return API.executeRequest(APIRequest: API.user.getProfile(userID: userID).request, headers: defaultHeadersWithAuth, requestBody: nil)
        }
        
        static func stop(userID: String) -> Data? {
            return API.executeRequest(APIRequest: API.user.stop(userID: userID).request, headers: defaultHeadersWithAuth, requestBody: nil)
        }
        
        static func watch(userID: String, requestBody: [String : Any]) -> Data? {
            return API.executeRequest(APIRequest: API.user.watch(userID: userID).request, headers: defaultHeadersWithAuth, requestBody: requestBody)
        }
        
    }
    
    class UsersDrafts {
        
        static func create(userID: String, type: API.resourceContentType, draft: [String : Any]) -> Data? {
            return API.executeRequest(APIRequest: API.usersDrafts.create(userId: userID, type: type).request, headers: defaultHeadersWithAuth, requestBody: draft)
        }
        
        static func delete(userID: String, id: String) -> Data? {
            return API.executeRequest(APIRequest: API.usersDrafts.delete(userId: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil)
        }
        
        static func get(userID: String, id: String) -> Data? {
            return API.executeRequest(APIRequest: API.usersDrafts.get(userId: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil)
        }
        
        static func list(userID: String) -> Data? {
            return API.executeRequest(APIRequest: API.usersDrafts.list(userId: userID).request, headers: defaultHeadersWithAuth, requestBody: nil)
        }
        
        static func send(userID: String, headers: [String : String], draft: [String : Any], type: API.resourceContentType) -> Data? {
            var headersWithAuth = headers
            headersWithAuth["Authorization"] = "Bearer \(Gmail.bearerToken)"
            return API.executeRequest(APIRequest: API.usersDrafts.send(userId: userID, type: type).request, headers: headersWithAuth, requestBody: draft)
        }
        
        static func update(userID: String, draft: [String : Any], id: String, type: API.resourceContentType) -> Data? {
            return API.executeRequest(APIRequest: API.usersDrafts.update(userId: userID, id: id, type: type).request, headers: defaultHeadersWithAuth, requestBody: draft)
        }
        
    }
    
    class UsersHistory {
        
        static func list(userID: String, startHistoryId: String) -> Data? {
            return API.executeRequest(APIRequest: API.usersHistory.list(userID: userID, startHistoryId: startHistoryId).request, headers: defaultHeadersWithAuth, requestBody: nil)
        }
        
    }
    
    class UsersLabels {
        
        static func create(userID: String, requestBody: Label) -> Label? {
            return UsersLabels.decodeToLabel(data: API.executeRequest(APIRequest: API.usersLabels.create(userId: userID).request, headers: defaultHeadersWithAuth, requestBody: requestBody.dictionary))
        }
        
        static func delete(userID: String, id: String) -> Data? {
            return API.executeRequest(APIRequest: API.usersLabels.delete(userId: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil)
        }
        
        static func get(userID: String, id: String) -> Label? {
            return UsersLabels.decodeToLabel(data: API.executeRequest(APIRequest: API.usersLabels.get(userId: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil))
        }
        
        static func list(userID: String) -> LabelList? {
            return UsersLabels.decodeToLabelList(data: API.executeRequest(APIRequest: API.usersLabels.list(userId: userID).request, headers: defaultHeadersWithAuth, requestBody: nil))
        }
        
        static func patch(userID: String, id: String, requestBody: Label) -> Label? {
            return UsersLabels.decodeToLabel(data: API.executeRequest(APIRequest: API.usersLabels.patch(userId: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: requestBody.dictionary))
        }
        
        static func update(userID: String, id: String, requestBody: Label) -> Label? {
            return UsersLabels.decodeToLabel(data: API.executeRequest(APIRequest: API.usersLabels.update(userId: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: requestBody.dictionary))
        }
        
    }
    
    class UsersMessages {
        
        static func batchDelete(userID: String, ids: [String]) -> Data? {
            return API.executeRequest(APIRequest: API.usersMessages.batchDelete(userID: userID).request, headers: defaultHeadersWithAuth, requestBody: ["ids":ids])
        }
        
        static func batchModify(userID: String, requestBody: UserMessagesBatchModifyBody) -> Data? {
            return API.executeRequest(APIRequest: API.usersMessages.batchModify(userID: userID).request, headers: defaultHeadersWithAuth, requestBody: requestBody.dictionary)
        }
        
        static func delete(userID: String, id: String) -> Data? {
            return API.executeRequest(APIRequest: API.usersMessages.delete(userID: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil)
        }
        
        static func importMessage(userID: String, type: API.resourceContentType, message: Message) -> Message? {
            return UsersMessages.decodeToMessage(data: API.executeRequest(APIRequest: API.usersMessages.importMessages(userID: userID, importType: type).request, headers: defaultHeadersWithAuth, requestBody: message.dictionary))
        }
        
        static func insert(userID: String, type: API.resourceContentType, message: Message) -> Message? {
            return UsersMessages.decodeToMessage(data: API.executeRequest(APIRequest: API.usersMessages.insert(userID: userID, importType: type).request, headers: defaultHeadersWithAuth, requestBody: message.dictionary))
        }
        
        static func modify(userID: String, id: String, modifiedMessageBody: ModifiedMessageBody) -> Message? {
            return UsersMessages.decodeToMessage(data: API.executeRequest(APIRequest: API.usersMessages.modify(userID: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: modifiedMessageBody.dictionary))
        }
        
        static func send(userID: String, type: API.resourceContentType, message: Message) -> Message? {
            return UsersMessages.decodeToMessage(data: API.executeRequest(APIRequest: API.usersMessages.send(userID: userID, importType: type).request, headers: defaultHeadersWithAuth, requestBody: message.dictionary))
        }
        
        static func trash(userID: String, id: String) -> Message? {
            return UsersMessages.decodeToMessage(data: API.executeRequest(APIRequest: API.usersMessages.trash(userID: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil))
        }
        
        static func untrash(userID: String, id: String) -> Message? {
            return UsersMessages.decodeToMessage(data: API.executeRequest(APIRequest: API.usersMessages.untrash(userID: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil))
        }
        
        static func list(userID: String) -> MessagesList? {
            return UsersMessages.decodeToMessageList(data: API.executeRequest(APIRequest: API.usersMessages.list(userID: userID).request, headers: defaultHeadersWithAuth, requestBody: nil))
        }
        
        static func get(userID: String, id: String) -> Message? {
            return UsersMessages.decodeToMessage(data: API.executeRequest(APIRequest: API.usersMessages.get(userID: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil))
        }
        
    }
    
    class UsersThreads {
        
        static func get(userID: String, id: String) -> Thread? {
            return UsersThreads.decodeToThread(data: API.executeRequest(APIRequest: API.usersThreads.get(userID: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil))
        }
        
        static func list(userID: String) -> ThreadList? {
            return UsersThreads.decodeToThreadList(data: API.executeRequest(APIRequest: API.usersThreads.list(userID: userID).request, headers: defaultHeadersWithAuth, requestBody: nil))
        }
        
        static func trash(userID: String, id: String) -> Thread? {
            return UsersThreads.decodeToThread(data: API.executeRequest(APIRequest: API.usersThreads.trash(userID: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil))
        }
        
        static func untrash(userID: String, id: String) -> Thread? {
            return UsersThreads.decodeToThread(data: API.executeRequest(APIRequest: API.usersThreads.untrash(userID: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil))
        }
        
        static func delete(userID: String, id: String) -> Data? {
            return API.executeRequest(APIRequest: API.usersThreads.delete(userID: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil)
        }
        
        static func modify(userID: String, id: String, requestBody: ThreadModifyBody) -> Thread? {
            return UsersThreads.decodeToThread(data: API.executeRequest(APIRequest: API.usersThreads.untrash(userID: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: requestBody.dictionary))
        }
        
    }
    
}
