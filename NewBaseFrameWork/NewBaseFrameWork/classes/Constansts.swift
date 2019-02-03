//
//  Constansts.swift
//  BaseApp
//
//  Created by Yousef on 10/30/18.
//  Copyright © 2018 Yousef. All rights reserved.
//

// keys for user profile
let FIRST_TIME = "firstTime"
let USER_NAME_KEY = "userName"
let USER_EMAIL_KEY = "userEmail"
let USER_ID_KEY = "userID"
let USER_PHONE_KEY = "userPhone"
let USER_IMAGE_KEY = "userImage"
let USER_TOKEN_KEY = "userToken"
let USER_TYPE_KEY = "userType"
let USER_GENDER_KEY = "userGender"
let USER_BIRTH_DATE_KEY = "userBirthDate"
let LANGUAGE = "language"
let APPLICATION_TYPE = "applicationType"
let NOTIFICATION_ACTIVE = "notificationActive"
let doctorType = "DOCTOR"
let patientType = "PATIENT"
let chatType = "CHAT"
let callType = "CALL"
let finished = "finished"
let notAssigned = "notAssignedToDr"
let doctorApplicationType = "DOCTOR_APPLICATION"
let patientApplicationType = "PATIENT_APPLICATION"

let AR = "ar"
let En = "en"

// notifications
let resultUserId = "userId"
let resultIdToken = "idToken"
let resultFullName = "fullName"
let resultGivenName = "givenName"
let resultFamilyName = "familyName"
let resultEmail = "email"
let resultProfileImage = "profileImage"

// reusable tableview
let reusableConsultation = "reusableConsultationTableView"
let reusableImages = "reusableImagesForConsultation"
let reusableFilteration = "reusableFilterationCell"
let reusableCertificates = "reusableCertificateCell"
let friendChatReusable = "friendChatReusable"
let myChatReusable = "myChatReusable"
let myImageChatReusable = "myImageChatReusable"
let friendImageChatReusable = "friendImageChatReusable"
let emptyResuableCell = "emptyResuableCell"
let menuReuableCell = "menuReuableCell"
let diseaseReusableItem = "diseaseReusableItem"
let notificationReusableCell = "notificationReusableCell"
let settingReusableKey = "settingReusableKey"
let cerificateReusableCell = "cerificateReusableCell"
let articlesReusableCell = "articlesReusableCell"
let chattingRateCellReusable = "chattingRateCellReusable"
let imageGelleryResuableCell = "imageGelleryResuableCell"
let blogsCollectionReusable = "blogsCollectionReusable"
let faqResuableCollectionViewCell = "faqResuableCollectionViewCell"

// main url end point
let BASE_URL = "https://www.themoviedb.org/"
let apiKey  = "186c89ecdd9fad31f59bd1f03cade80f"
let accessToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxODZjODllY2RkOWZhZDMxZjU5YmQxZjAzY2FkZTgwZiIsInN1YiI6IjVjMzhlYjVlYzNhMzY4MDg0ZjQ1NTFkMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.HK9QaX57moGuJxXFlL6biuf1VzoQKJTTLPygyZPtZVc"

let graphQlSubscribtion = "wss://api.estshara.com"
let PROFILE_URL = "https://api.estshara.com/uploads/users/"
let SYNDICATE_URL = "https://api.estshara.com/uploads/syndicates/"
let CERTIFICATES_URL = "https://api.estshara.com/uploads/cirtfs/"
let ARTICLES_URL = "https://api.estshara.com/uploads/articles"
let BLOG_URL = "https://dev.estshara.com/blog/"
let CONSULTATION_URL = "https://api.estshara.com/uploads/consultations_messages/"
let chatMessagesFilesKey = "messageImages"

// constants for notifications
let RECOMMENDATIONS = "recommendation"
let CONSULTATION_CREATED = "consultation_created"
let PATIENTS_CANCELED = "patient_canceled_consultation"
let DOCTOR_CANCELED = "doctor_canceled_consultation"
let RATE = "consultation_rate"
let LEAVE_REQUEST_ACCEPTED = "leave_request_accepted"
let LEAVE_REQUEST_REJECTED = "leave_request_rejected"
let JOIN_REQUEST_ACCEPTED = "request_accepted"
let JOIN_REQUEST_REJECTED = "request_rejected"

/**
    get the real link of the imagex
 */
func checkForImage(image: String) -> String{
    if image.contains("http"){
        return image
    }else{
        return "\(PROFILE_URL)\(image)"
    }
}

func checkForPhone(phone: String) -> String{
    if phone.count > 0{
        if phone.contains("+20"){
            return String(phone.dropFirst(3))
        }
    }
    return phone
}

func addCountryCodeToPhone(phone: String) -> String{
    if phone.count > 0{
        if phone.contains("+20"){
            return phone
        }else{
            return "+20\(phone)"
        }
    }
    return phone
}
