// // To parse this JSON data, do
// //
// //     final marketPlaceModel = marketPlaceModelFromJson(jsonString);

// import 'dart:convert';

// List<MarketPlaceModel> marketPlaceModelFromJson(String str) => List<MarketPlaceModel>.from(json.decode(str).map((x) => MarketPlaceModel.fromJson(x)));

// String marketPlaceModelToJson(List<MarketPlaceModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class MarketPlaceModel {
//     MarketPlaceModel({
//         this.id,
//         this.userId,
//         this.pageId,
//         this.name,
//         this.description,
//         this.category,
//         this.subCategory,
//         this.price,
//         this.location,
//         this.status,
//         this.type,
//         this.currency,
//         this.lng,
//         this.lat,
//         this.units,
//         this.time,
//         this.active,
//         this.images,
//         this.timeText,
//         this.postId,
//         this.editDescription,
//         this.url,
//         this.reviewsUrl,
//         this.seoId,
//         this.reviewsSeoId,
//         this.productSubCategory,
//         this.fields,
//         this.addedToCart,
//         this.userData,
//         this.rating,
//         this.reviewsCount,
//         this.priceFormat,
//         this.seller,
//     });

//     String id;
//     String userId;
//     String pageId;
//     String name;
//     String description;
//     String category;
//     String subCategory;
//     String price;
//     String location;
//     String status;
//     String type;
//     String currency;
//     String lng;
//     String lat;
//     String units;
//     String time;
//     String active;
//     List<Image> images;
//     String timeText;
//     String postId;
//     String editDescription;
//     String url;
//     String reviewsUrl;
//     String seoId;
//     String reviewsSeoId;
//     String productSubCategory;
//     List<dynamic> fields;
//     int addedToCart;
//     Seller userData;
//     dynamic rating;
//     int reviewsCount;
//     String priceFormat;
//     Seller seller;

//     factory MarketPlaceModel.fromJson(Map<String, dynamic> json) => MarketPlaceModel(
//         id: json["id"],
//         userId: json["user_id"],
//         pageId: json["page_id"],
//         name: json["name"],
//         description: json["description"],
//         category: json["category"],
//         subCategory: json["sub_category"],
//         price: json["price"],
//         location: json["location"],
//         status: json["status"],
//         type: json["type"],
//         currency: json["currency"],
//         lng: json["lng"],
//         lat: json["lat"],
//         units: json["units"],
//         time: json["time"],
//         active: json["active"],
//         images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
//         timeText: json["time_text"],
//         postId: json["post_id"],
//         editDescription: json["edit_description"],
//         url: json["url"],
//         reviewsUrl: json["reviews_url"],
//         seoId: json["seo_id"],
//         reviewsSeoId: json["reviews_seo_id"],
//         productSubCategory: json["product_sub_category"],
//         fields: List<dynamic>.from(json["fields"].map((x) => x)),
//         addedToCart: json["added_to_cart"],
//         userData: Seller.fromJson(json["user_data"]),
//         rating: json["rating"],
//         reviewsCount: json["reviews_count"],
//         priceFormat: json["price_format"],
//         seller: Seller.fromJson(json["seller"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "user_id": userId,
//         "page_id": pageId,
//         "name": name,
//         "description": description,
//         "category": category,
//         "sub_category": subCategory,
//         "price": price,
//         "location": location,
//         "status": status,
//         "type": type,
//         "currency": currency,
//         "lng": lng,
//         "lat": lat,
//         "units": units,
//         "time": time,
//         "active": active,
//         "images": List<dynamic>.from(images.map((x) => x.toJson())),
//         "time_text": timeText,
//         "post_id": postId,
//         "edit_description": editDescription,
//         "url": url,
//         "reviews_url": reviewsUrl,
//         "seo_id": seoId,
//         "reviews_seo_id": reviewsSeoId,
//         "product_sub_category": productSubCategory,
//         "fields": List<dynamic>.from(fields.map((x) => x)),
//         "added_to_cart": addedToCart,
//         "user_data": userData.toJson(),
//         "rating": rating,
//         "reviews_count": reviewsCount,
//         "price_format": priceFormat,
//         "seller": seller.toJson(),
//     };
// }

// class Image {
//     Image({
//         this.id,
//         this.image,
//         this.productId,
//         this.imageOrg,
//     });

//     String id;
//     String image;
//     String productId;
//     String imageOrg;

//     factory Image.fromJson(Map<String, dynamic> json) => Image(
//         id: json["id"],
//         image: json["image"],
//         productId: json["product_id"],
//         imageOrg: json["image_org"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "image": image,
//         "product_id": productId,
//         "image_org": imageOrg,
//     };
// }

// class Seller {
//     Seller({
//         this.userId,
//         this.username,
//         this.email,
//         this.firstName,
//         this.lastName,
//         this.avatar,
//         this.cover,
//         this.backgroundImage,
//         this.relationshipId,
//         this.address,
//         this.working,
//         this.workingLink,
//         this.about,
//         this.school,
//         this.gender,
//         this.birthday,
//         this.countryId,
//         this.website,
//         this.facebook,
//         this.google,
//         this.twitter,
//         this.linkedin,
//         this.youtube,
//         this.vk,
//         this.instagram,
//         this.qq,
//         this.wechat,
//         this.discord,
//         this.mailru,
//         this.okru,
//         this.language,
//         this.ipAddress,
//         this.followPrivacy,
//         this.friendPrivacy,
//         this.postPrivacy,
//         this.messagePrivacy,
//         this.confirmFollowers,
//         this.showActivitiesPrivacy,
//         this.birthPrivacy,
//         this.visitPrivacy,
//         this.verified,
//         this.lastseen,
//         this.emailNotification,
//         this.eLiked,
//         this.eWondered,
//         this.eShared,
//         this.eFollowed,
//         this.eCommented,
//         this.eVisited,
//         this.eLikedPage,
//         this.eMentioned,
//         this.eJoinedGroup,
//         this.eAccepted,
//         this.eProfileWallPost,
//         this.eSentmeMsg,
//         this.eLastNotif,
//         this.notificationSettings,
//         this.status,
//         this.active,
//         this.admin,
//         this.registered,
//         this.phoneNumber,
//         this.isPro,
//         this.proType,
//         this.proRemainder,
//         this.timezone,
//         this.referrer,
//         this.refUserId,
//         this.refLevel,
//         this.balance,
//         this.paypalEmail,
//         this.notificationsSound,
//         this.orderPostsBy,
//         this.androidMDeviceId,
//         this.iosMDeviceId,
//         this.androidNDeviceId,
//         this.iosNDeviceId,
//         this.webDeviceId,
//         this.wallet,
//         this.lat,
//         this.lng,
//         this.lastLocationUpdate,
//         this.shareMyLocation,
//         this.lastDataUpdate,
//         this.details,
//         this.lastAvatarMod,
//         this.lastCoverMod,
//         this.points,
//         this.dailyPoints,
//         this.convertedPoints,
//         this.pointDayExpire,
//         this.lastFollowId,
//         this.shareMyData,
//         this.lastLoginData,
//         this.twoFactor,
//         this.twoFactorHash,
//         this.newEmail,
//         this.twoFactorVerified,
//         this.newPhone,
//         this.infoFile,
//         this.city,
//         this.state,
//         this.zip,
//         this.schoolCompleted,
//         this.weatherUnit,
//         this.paystackRef,
//         this.codeSent,
//         this.timeCodeSent,
//         this.permission,
//         this.skills,
//         this.languages,
//         this.currentlyWorking,
//         this.banned,
//         this.bannedReason,
//         this.avatarPostId,
//         this.coverPostId,
//         this.avatarFull,
//         this.userPlatform,
//         this.url,
//         this.name,
//         this.apiNotificationSettings,
//         this.isNotifyStopped,
//         this.mutualFriendsData,
//         this.lastseenUnixTime,
//         this.lastseenStatus,
//         this.isReported,
//         this.isStoryMuted,
//         this.isFollowingMe,
//         this.isReportedUser,
//         this.isOpenToWork,
//         this.isProvidingService,
//         this.providingService,
//         this.openToWorkData,
//         this.formatedLangs,
//         this.password,
//         this.backgroundImageStatus,
//         this.emailCode,
//         this.src,
//         this.showlastseen,
//         this.type,
//         this.startUp,
//         this.startUpInfo,
//         this.startupFollow,
//         this.startupImage,
//         this.lastEmailSent,
//         this.smsCode,
//         this.proTime,
//         this.joined,
//         this.cssFile,
//         this.socialLogin,
//         this.sidebarData,
//         this.avatarOrg,
//         this.coverOrg,
//         this.coverFull,
//         this.id,
//         this.followingData,
//         this.followersData,
//         this.likesData,
//         this.groupsData,
//         this.albumData,
//     });

//     String userId;
//     String username;
//     String email;
//     String firstName;
//     String lastName;
//     String avatar;
//     String cover;
//     String backgroundImage;
//     String relationshipId;
//     String address;
//     String working;
//     String workingLink;
//     dynamic about;
//     String school;
//     String gender;
//     String birthday;
//     String countryId;
//     String website;
//     String facebook;
//     String google;
//     String twitter;
//     String linkedin;
//     String youtube;
//     String vk;
//     String instagram;
//     dynamic qq;
//     dynamic wechat;
//     dynamic discord;
//     dynamic mailru;
//     String okru;
//     String language;
//     String ipAddress;
//     String followPrivacy;
//     String friendPrivacy;
//     String postPrivacy;
//     String messagePrivacy;
//     String confirmFollowers;
//     String showActivitiesPrivacy;
//     String birthPrivacy;
//     String visitPrivacy;
//     String verified;
//     String lastseen;
//     String emailNotification;
//     String eLiked;
//     String eWondered;
//     String eShared;
//     String eFollowed;
//     String eCommented;
//     String eVisited;
//     String eLikedPage;
//     String eMentioned;
//     String eJoinedGroup;
//     String eAccepted;
//     String eProfileWallPost;
//     String eSentmeMsg;
//     String eLastNotif;
//     String notificationSettings;
//     String status;
//     String active;
//     String admin;
//     String registered;
//     String phoneNumber;
//     String isPro;
//     String proType;
//     String proRemainder;
//     String timezone;
//     String referrer;
//     String refUserId;
//     dynamic refLevel;
//     String balance;
//     String paypalEmail;
//     String notificationsSound;
//     String orderPostsBy;
//     String androidMDeviceId;
//     String iosMDeviceId;
//     String androidNDeviceId;
//     String iosNDeviceId;
//     String webDeviceId;
//     String wallet;
//     String lat;
//     String lng;
//     String lastLocationUpdate;
//     String shareMyLocation;
//     String lastDataUpdate;
//     Details details;
//     String lastAvatarMod;
//     String lastCoverMod;
//     String points;
//     String dailyPoints;
//     String convertedPoints;
//     String pointDayExpire;
//     String lastFollowId;
//     String shareMyData;
//     dynamic lastLoginData;
//     String twoFactor;
//     String twoFactorHash;
//     String newEmail;
//     String twoFactorVerified;
//     String newPhone;
//     String infoFile;
//     String city;
//     String state;
//     String zip;
//     String schoolCompleted;
//     String weatherUnit;
//     String paystackRef;
//     String codeSent;
//     String timeCodeSent;
//     dynamic permission;
//     dynamic skills;
//     dynamic languages;
//     String currentlyWorking;
//     String banned;
//     String bannedReason;
//     int avatarPostId;
//     int coverPostId;
//     String avatarFull;
//     String userPlatform;
//     String url;
//     String name;
//     Map<String, int> apiNotificationSettings;
//     int isNotifyStopped;
//     String mutualFriendsData;
//     String lastseenUnixTime;
//     String lastseenStatus;
//     bool isReported;
//     bool isStoryMuted;
//     int isFollowingMe;
//     int isReportedUser;
//     int isOpenToWork;
//     int isProvidingService;
//     int providingService;
//     String openToWorkData;
//     List<dynamic> formatedLangs;
//     String password;
//     String backgroundImageStatus;
//     String emailCode;
//     String src;
//     String showlastseen;
//     String type;
//     String startUp;
//     String startUpInfo;
//     String startupFollow;
//     String startupImage;
//     String lastEmailSent;
//     String smsCode;
//     String proTime;
//     String joined;
//     String cssFile;
//     String socialLogin;
//     dynamic sidebarData;
//     String avatarOrg;
//     String coverOrg;
//     String coverFull;
//     String id;
//     String followingData;
//     String followersData;
//     String likesData;
//     String groupsData;
//     String albumData;

//     factory Seller.fromJson(Map<String, dynamic> json) => Seller(
//         userId: json["user_id"],
//         username: json["username"],
//         email: json["email"],
//         firstName: json["first_name"],
//         lastName: json["last_name"],
//         avatar: json["avatar"],
//         cover: json["cover"],
//         backgroundImage: json["background_image"],
//         relationshipId: json["relationship_id"],
//         address: json["address"],
//         working: json["working"],
//         workingLink: json["working_link"],
//         about: json["about"],
//         school: json["school"],
//         gender: json["gender"],
//         birthday: json["birthday"],
//         countryId: json["country_id"],
//         website: json["website"],
//         facebook: json["facebook"],
//         google: json["google"],
//         twitter: json["twitter"],
//         linkedin: json["linkedin"],
//         youtube: json["youtube"],
//         vk: json["vk"],
//         instagram: json["instagram"],
//         qq: json["qq"],
//         wechat: json["wechat"],
//         discord: json["discord"],
//         mailru: json["mailru"],
//         okru: json["okru"],
//         language: json["language"],
//         ipAddress: json["ip_address"],
//         followPrivacy: json["follow_privacy"],
//         friendPrivacy: json["friend_privacy"],
//         postPrivacy: json["post_privacy"],
//         messagePrivacy: json["message_privacy"],
//         confirmFollowers: json["confirm_followers"],
//         showActivitiesPrivacy: json["show_activities_privacy"],
//         birthPrivacy: json["birth_privacy"],
//         visitPrivacy: json["visit_privacy"],
//         verified: json["verified"],
//         lastseen: json["lastseen"],
//         emailNotification: json["emailNotification"],
//         eLiked: json["e_liked"],
//         eWondered: json["e_wondered"],
//         eShared: json["e_shared"],
//         eFollowed: json["e_followed"],
//         eCommented: json["e_commented"],
//         eVisited: json["e_visited"],
//         eLikedPage: json["e_liked_page"],
//         eMentioned: json["e_mentioned"],
//         eJoinedGroup: json["e_joined_group"],
//         eAccepted: json["e_accepted"],
//         eProfileWallPost: json["e_profile_wall_post"],
//         eSentmeMsg: json["e_sentme_msg"],
//         eLastNotif: json["e_last_notif"],
//         notificationSettings: json["notification_settings"],
//         status: json["status"],
//         active: json["active"],
//         admin: json["admin"],
//         registered: json["registered"],
//         phoneNumber: json["phone_number"],
//         isPro: json["is_pro"],
//         proType: json["pro_type"],
//         proRemainder: json["pro_remainder"],
//         timezone: json["timezone"],
//         referrer: json["referrer"],
//         refUserId: json["ref_user_id"],
//         refLevel: json["ref_level"],
//         balance: json["balance"],
//         paypalEmail: json["paypal_email"],
//         notificationsSound: json["notifications_sound"],
//         orderPostsBy: json["order_posts_by"],
//         androidMDeviceId: json["android_m_device_id"],
//         iosMDeviceId: json["ios_m_device_id"],
//         androidNDeviceId: json["android_n_device_id"],
//         iosNDeviceId: json["ios_n_device_id"],
//         webDeviceId: json["web_device_id"],
//         wallet: json["wallet"],
//         lat: json["lat"],
//         lng: json["lng"],
//         lastLocationUpdate: json["last_location_update"],
//         shareMyLocation: json["share_my_location"],
//         lastDataUpdate: json["last_data_update"],
//         details: Details.fromJson(json["details"]),
//         lastAvatarMod: json["last_avatar_mod"],
//         lastCoverMod: json["last_cover_mod"],
//         points: json["points"],
//         dailyPoints: json["daily_points"],
//         convertedPoints: json["converted_points"],
//         pointDayExpire: json["point_day_expire"],
//         lastFollowId: json["last_follow_id"],
//         shareMyData: json["share_my_data"],
//         lastLoginData: json["last_login_data"],
//         twoFactor: json["two_factor"],
//         twoFactorHash: json["two_factor_hash"],
//         newEmail: json["new_email"],
//         twoFactorVerified: json["two_factor_verified"],
//         newPhone: json["new_phone"],
//         infoFile: json["info_file"],
//         city: json["city"],
//         state: json["state"],
//         zip: json["zip"],
//         schoolCompleted: json["school_completed"],
//         weatherUnit: json["weather_unit"],
//         paystackRef: json["paystack_ref"],
//         codeSent: json["code_sent"],
//         timeCodeSent: json["time_code_sent"],
//         permission: json["permission"],
//         skills: json["skills"],
//         languages: json["languages"],
//         currentlyWorking: json["currently_working"],
//         banned: json["banned"],
//         bannedReason: json["banned_reason"],
//         avatarPostId: json["avatar_post_id"],
//         coverPostId: json["cover_post_id"],
//         avatarFull: json["avatar_full"],
//         userPlatform: json["user_platform"],
//         url: json["url"],
//         name: json["name"],
//         apiNotificationSettings: Map.from(json["API_notification_settings"]).map((k, v) => MapEntry<String, int>(k, v)),
//         isNotifyStopped: json["is_notify_stopped"],
//         mutualFriendsData: json["mutual_friends_data"],
//         lastseenUnixTime: json["lastseen_unix_time"],
//         lastseenStatus: json["lastseen_status"],
//         isReported: json["is_reported"],
//         isStoryMuted: json["is_story_muted"],
//         isFollowingMe: json["is_following_me"],
//         isReportedUser: json["is_reported_user"],
//         isOpenToWork: json["is_open_to_work"],
//         isProvidingService: json["is_providing_service"],
//         providingService: json["providing_service"],
//         openToWorkData: json["open_to_work_data"],
//         formatedLangs: List<dynamic>.from(json["formated_langs"].map((x) => x)),
//         password: json["password"] == null ? null : json["password"],
//         backgroundImageStatus: json["background_image_status"] == null ? null : json["background_image_status"],
//         emailCode: json["email_code"] == null ? null : json["email_code"],
//         src: json["src"] == null ? null : json["src"],
//         showlastseen: json["showlastseen"] == null ? null : json["showlastseen"],
//         type: json["type"] == null ? null : json["type"],
//         startUp: json["start_up"] == null ? null : json["start_up"],
//         startUpInfo: json["start_up_info"] == null ? null : json["start_up_info"],
//         startupFollow: json["startup_follow"] == null ? null : json["startup_follow"],
//         startupImage: json["startup_image"] == null ? null : json["startup_image"],
//         lastEmailSent: json["last_email_sent"] == null ? null : json["last_email_sent"],
//         smsCode: json["sms_code"] == null ? null : json["sms_code"],
//         proTime: json["pro_time"] == null ? null : json["pro_time"],
//         joined: json["joined"] == null ? null : json["joined"],
//         cssFile: json["css_file"] == null ? null : json["css_file"],
//         socialLogin: json["social_login"] == null ? null : json["social_login"],
//         sidebarData: json["sidebar_data"],
//         avatarOrg: json["avatar_org"] == null ? null : json["avatar_org"],
//         coverOrg: json["cover_org"] == null ? null : json["cover_org"],
//         coverFull: json["cover_full"] == null ? null : json["cover_full"],
//         id: json["id"] == null ? null : json["id"],
//         followingData: json["following_data"] == null ? null : json["following_data"],
//         followersData: json["followers_data"] == null ? null : json["followers_data"],
//         likesData: json["likes_data"] == null ? null : json["likes_data"],
//         groupsData: json["groups_data"] == null ? null : json["groups_data"],
//         albumData: json["album_data"] == null ? null : json["album_data"],
//     );

//     Map<String, dynamic> toJson() => {
//         "user_id": userId,
//         "username": username,
//         "email": email,
//         "first_name": firstName,
//         "last_name": lastName,
//         "avatar": avatar,
//         "cover": cover,
//         "background_image": backgroundImage,
//         "relationship_id": relationshipId,
//         "address": address,
//         "working": working,
//         "working_link": workingLink,
//         "about": about,
//         "school": school,
//         "gender": gender,
//         "birthday": birthday,
//         "country_id": countryId,
//         "website": website,
//         "facebook": facebook,
//         "google": google,
//         "twitter": twitter,
//         "linkedin": linkedin,
//         "youtube": youtube,
//         "vk": vk,
//         "instagram": instagram,
//         "qq": qq,
//         "wechat": wechat,
//         "discord": discord,
//         "mailru": mailru,
//         "okru": okru,
//         "language": language,
//         "ip_address": ipAddress,
//         "follow_privacy": followPrivacy,
//         "friend_privacy": friendPrivacy,
//         "post_privacy": postPrivacy,
//         "message_privacy": messagePrivacy,
//         "confirm_followers": confirmFollowers,
//         "show_activities_privacy": showActivitiesPrivacy,
//         "birth_privacy": birthPrivacy,
//         "visit_privacy": visitPrivacy,
//         "verified": verified,
//         "lastseen": lastseen,
//         "emailNotification": emailNotification,
//         "e_liked": eLiked,
//         "e_wondered": eWondered,
//         "e_shared": eShared,
//         "e_followed": eFollowed,
//         "e_commented": eCommented,
//         "e_visited": eVisited,
//         "e_liked_page": eLikedPage,
//         "e_mentioned": eMentioned,
//         "e_joined_group": eJoinedGroup,
//         "e_accepted": eAccepted,
//         "e_profile_wall_post": eProfileWallPost,
//         "e_sentme_msg": eSentmeMsg,
//         "e_last_notif": eLastNotif,
//         "notification_settings": notificationSettings,
//         "status": status,
//         "active": active,
//         "admin": admin,
//         "registered": registered,
//         "phone_number": phoneNumber,
//         "is_pro": isPro,
//         "pro_type": proType,
//         "pro_remainder": proRemainder,
//         "timezone": timezone,
//         "referrer": referrer,
//         "ref_user_id": refUserId,
//         "ref_level": refLevel,
//         "balance": balance,
//         "paypal_email": paypalEmail,
//         "notifications_sound": notificationsSound,
//         "order_posts_by": orderPostsBy,
//         "android_m_device_id": androidMDeviceId,
//         "ios_m_device_id": iosMDeviceId,
//         "android_n_device_id": androidNDeviceId,
//         "ios_n_device_id": iosNDeviceId,
//         "web_device_id": webDeviceId,
//         "wallet": wallet,
//         "lat": lat,
//         "lng": lng,
//         "last_location_update": lastLocationUpdate,
//         "share_my_location": shareMyLocation,
//         "last_data_update": lastDataUpdate,
//         "details": details.toJson(),
//         "last_avatar_mod": lastAvatarMod,
//         "last_cover_mod": lastCoverMod,
//         "points": points,
//         "daily_points": dailyPoints,
//         "converted_points": convertedPoints,
//         "point_day_expire": pointDayExpire,
//         "last_follow_id": lastFollowId,
//         "share_my_data": shareMyData,
//         "last_login_data": lastLoginData,
//         "two_factor": twoFactor,
//         "two_factor_hash": twoFactorHash,
//         "new_email": newEmail,
//         "two_factor_verified": twoFactorVerified,
//         "new_phone": newPhone,
//         "info_file": infoFile,
//         "city": city,
//         "state": state,
//         "zip": zip,
//         "school_completed": schoolCompleted,
//         "weather_unit": weatherUnit,
//         "paystack_ref": paystackRef,
//         "code_sent": codeSent,
//         "time_code_sent": timeCodeSent,
//         "permission": permission,
//         "skills": skills,
//         "languages": languages,
//         "currently_working": currentlyWorking,
//         "banned": banned,
//         "banned_reason": bannedReason,
//         "avatar_post_id": avatarPostId,
//         "cover_post_id": coverPostId,
//         "avatar_full": avatarFull,
//         "user_platform": userPlatform,
//         "url": url,
//         "name": name,
//         "API_notification_settings": Map.from(apiNotificationSettings).map((k, v) => MapEntry<String, dynamic>(k, v)),
//         "is_notify_stopped": isNotifyStopped,
//         "mutual_friends_data": mutualFriendsData,
//         "lastseen_unix_time": lastseenUnixTime,
//         "lastseen_status": lastseenStatus,
//         "is_reported": isReported,
//         "is_story_muted": isStoryMuted,
//         "is_following_me": isFollowingMe,
//         "is_reported_user": isReportedUser,
//         "is_open_to_work": isOpenToWork,
//         "is_providing_service": isProvidingService,
//         "providing_service": providingService,
//         "open_to_work_data": openToWorkData,
//         "formated_langs": List<dynamic>.from(formatedLangs.map((x) => x)),
//         "password": password == null ? null : password,
//         "background_image_status": backgroundImageStatus == null ? null : backgroundImageStatus,
//         "email_code": emailCode == null ? null : emailCode,
//         "src": src == null ? null : src,
//         "showlastseen": showlastseen == null ? null : showlastseen,
//         "type": type == null ? null : type,
//         "start_up": startUp == null ? null : startUp,
//         "start_up_info": startUpInfo == null ? null : startUpInfo,
//         "startup_follow": startupFollow == null ? null : startupFollow,
//         "startup_image": startupImage == null ? null : startupImage,
//         "last_email_sent": lastEmailSent == null ? null : lastEmailSent,
//         "sms_code": smsCode == null ? null : smsCode,
//         "pro_time": proTime == null ? null : proTime,
//         "joined": joined == null ? null : joined,
//         "css_file": cssFile == null ? null : cssFile,
//         "social_login": socialLogin == null ? null : socialLogin,
//         "sidebar_data": sidebarData,
//         "avatar_org": avatarOrg == null ? null : avatarOrg,
//         "cover_org": coverOrg == null ? null : coverOrg,
//         "cover_full": coverFull == null ? null : coverFull,
//         "id": id == null ? null : id,
//         "following_data": followingData == null ? null : followingData,
//         "followers_data": followersData == null ? null : followersData,
//         "likes_data": likesData == null ? null : likesData,
//         "groups_data": groupsData == null ? null : groupsData,
//         "album_data": albumData == null ? null : albumData,
//     };
// }

// class Details {
//     Details({
//         this.postCount,
//         this.albumCount,
//         this.followingCount,
//         this.followersCount,
//         this.groupsCount,
//         this.likesCount,
//     });

//     int postCount;
//     int albumCount;
//     int followingCount;
//     int followersCount;
//     int groupsCount;
//     int likesCount;

//     factory Details.fromJson(Map<String, dynamic> json) => Details(
//         postCount: json["post_count"],
//         albumCount: json["album_count"],
//         followingCount: json["following_count"],
//         followersCount: json["followers_count"],
//         groupsCount: json["groups_count"],
//         likesCount: json["likes_count"],
//     );

//     Map<String, dynamic> toJson() => {
//         "post_count": postCount,
//         "album_count": albumCount,
//         "following_count": followingCount,
//         "followers_count": followersCount,
//         "groups_count": groupsCount,
//         "likes_count": likesCount,
//     };
// }
