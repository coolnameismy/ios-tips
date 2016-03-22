`UIApplicationShortcutItemIconType` 这个key可以使用一些系统自定义的icon，
可选的类型的枚举如下，详细介绍和每个图片的样子可以参考[这里](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIApplicationShortcutIcon_Class/index.html#//apple_ref/c/tdef/UIApplicationShortcutIconType)


````
enum UIApplicationShortcutIconType : Int {
    case Compose
    case Play
    case Pause
    case Add
    case Location
    case Search
    case Share
    case Prohibit
    case Contact
    case Home
    case MarkLocation
    case Favorite
    case Love
    case Cloud
    case Invitation
    case Confirmation
    case Mail
    case Message
    case Date
    case Time
    case CapturePhoto
    case CaptureVideo
    case Task
    case TaskCompleted
    case Alarm
    case Bookmark
    case Shuffle
    case Audio
    case Update
}
OBJECTIVE-C
typedef enum UIApplicationShortcutIconType : NSInteger {
   UIApplicationShortcutIconTypeCompose,
   UIApplicationShortcutIconTypePlay,
   UIApplicationShortcutIconTypePause,
   UIApplicationShortcutIconTypeAdd,
   UIApplicationShortcutIconTypeLocation,
   UIApplicationShortcutIconTypeSearch,
   UIApplicationShortcutIconTypeShare,
   UIApplicationShortcutIconTypeProhibit,
   UIApplicationShortcutIconTypeContact,
   UIApplicationShortcutIconTypeHome,
   UIApplicationShortcutIconTypeMarkLocation,
   UIApplicationShortcutIconTypeFavorite,
   UIApplicationShortcutIconTypeLove,
   UIApplicationShortcutIconTypeCloud,
   UIApplicationShortcutIconTypeInvitation,
   UIApplicationShortcutIconTypeConfirmation,
   UIApplicationShortcutIconTypeMail,
   UIApplicationShortcutIconTypeMessage,
   UIApplicationShortcutIconTypeDate,
   UIApplicationShortcutIconTypeTime,
   UIApplicationShortcutIconTypeCapturePhoto,
   UIApplicationShortcutIconTypeCaptureVideo,
   UIApplicationShortcutIconTypeTask,
   UIApplicationShortcutIconTypeTaskCompleted,
   UIApplicationShortcutIconTypeAlarm,
   UIApplicationShortcutIconTypeBookmark,
   UIApplicationShortcutIconTypeShuffle,
   UIApplicationShortcutIconTypeAudio,
   UIApplicationShortcutIconTypeUpdate
} UIApplicationShortcutIconType;
````