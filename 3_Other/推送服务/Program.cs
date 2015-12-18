using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PushSharp;
using PushSharp.Apple;
using PushSharp.Core;
using System.IO;
 

namespace PushSharpConsole
{
    class Program
    {
        [STAThread]
        static void Main(string[] args)
        {
            
            //Create our service    
            var push = new PushBroker();

            //Wire up the events
            push.OnNotificationSent += NotificationSent;
            push.OnNotificationFailed += NotificationFailed;

            //-------------------------
            // APPLE NOTIFICATIONS
            //-------------------------
            //Configure and start Apple APNS
            // IMPORTANT: Make sure you use the right Push certificate.  Apple allows you to generate one for connecting to Sandbox,
            //   and one for connecting to Production.  You must use the right one, to match the provisioning profile you build your
            //   app with!
            var appleCert = File.ReadAllBytes(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "../../id4test_push_aps_development.p12"));
            //IMPORTANT: If you are using a Development provisioning Profile, you must use the Sandbox push notification server 
            //  (so you would leave the first arg in the ctor of ApplePushChannelSettings as 'false')
            //  If you are using an AdHoc or AppStore provisioning profile, you must use the Production push notification server
            //  (so you would change the first arg in the ctor of ApplePushChannelSettings to 'true')
            push.RegisterAppleService(new ApplePushChannelSettings(appleCert, "WEIWEI")); //Extension method
            //Fluent construction of an iOS notification
            //IMPORTANT: For iOS you MUST MUST MUST use your own DeviceToken here that gets generated within your iOS app itself when the Application Delegate
            //  for registered for remote notifications is called, and the device token is passed back to you
            push.QueueNotification(new AppleNotification()
                                       .ForDeviceToken("cde6d75a0fc144b2bd30e10e15855376e4b53d793e6ccf9495787df19ace48d4")
                                       .WithAlert("Hello World!")
                                       .WithBadge(7)
                                       .WithSound("sound.caf"));
            //Console.ReadKey();
            Console.ReadLine();
        }
        static void NotificationSent(object sender, INotification notification)
        {
            Console.WriteLine("发送成功！");
            Console.WriteLine("Sent: " + sender + " -> " + notification);
        }
        static void NotificationFailed(object sender, INotification notification, Exception notificationFailureException)
        {
            Console.WriteLine("发送失败！");
            Console.WriteLine("Failure: " + sender + " -> " + notificationFailureException.Message + " -> " + notification);
        }
     
    }
}
