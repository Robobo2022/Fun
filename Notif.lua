local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()

Notification.new("error", "Error Heading", "Error body message.") 
Notification.new("success", "Success Heading", "Success body message.")
Notification.new("info", "Information Heading", "Information body message.")
Notification.new("warning", "Warning Heading", "Warning body message.") 
Notification.new("message", "Message Heading", "Message body message.")

local notif = Notification.new("success", "Success", "Success body message.")
notif:changeHeading("New Heading")
notif:changeBody("New Body")
notif:deleteTimeout(3)
notif:delete()